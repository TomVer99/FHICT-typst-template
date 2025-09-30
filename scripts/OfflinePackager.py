import requests
import shutil
import os
import tarfile
import toml
import fileinput

__TEMP_LOCATION = "./fhict-document-template-local/"
__PACKAGES = []
__PACKAGE_PACKAGE_INDEX = 0
__PACKAGE_VERSION_INDEX = 1

# ##############################################################################################################
# Parsing

def extract_preview_package_info(line:str):
    slash_index = line.find("/")
    quotation_index = line.find("\"", line.find("\"") + 1)
    first_colon_index = line.find(":")
    second_colon_index = line.find(":", line.find(":") + 1)

    package_name = line[slash_index+1:first_colon_index]
    package_version = line[first_colon_index+1:quotation_index]

    if line.count(":") > 1:
        package_options = line[second_colon_index:]
    else:
        package_options = ""

    return package_name, package_version, package_options.rstrip()

def parse_file_for_external_packages_recursively(path:str, toml_dir_ref_path:str):
    external_packages = []
    files_to_change = []
    with open(path, "r") as file:
        for line in file:
            if line.startswith("#import \"@preview/"): # External package
                package_name, package_version, _ = extract_preview_package_info(line)
                external_packages.append((package_name, package_version))
                files_to_change.append((path, toml_dir_ref_path))
            elif line.startswith("#import \"/"): # Internal package with path relative to toml file dir
                line = line.rstrip().replace("#import \"/", "")
                line = line.split("\"", 1)[0]
                sub_packages, sub_files = parse_file_for_external_packages_recursively(toml_dir_ref_path + line, toml_dir_ref_path)
                if sub_packages != []:
                    external_packages += sub_packages
                if sub_files != []:
                    files_to_change += sub_files
                files_to_change.append((path, toml_dir_ref_path))
            elif line.startswith("#import \"./"): # Internal package with path relative to current file
                line = line.rstrip().replace("#import \"./", "")
                line = line.split("\"", 1)[0]
                sub_packages, sub_files = parse_file_for_external_packages_recursively(toml_dir_ref_path + line, toml_dir_ref_path)
                if sub_packages != []:
                    external_packages += sub_packages
                if sub_files != []:
                    files_to_change += sub_files
            elif line.startswith("#import \""): # Internal package with path relative to current file
                line = line.rstrip().replace("#import \"", "")
                line = line.split("\"", 1)[0]
                sub_packages, sub_files = parse_file_for_external_packages_recursively(os.path.dirname(path) + "/" + line, toml_dir_ref_path)
                if sub_packages != []:
                    external_packages += sub_packages
                if sub_files != []:
                    files_to_change += sub_files
    return external_packages, files_to_change

def change_paths(path:str, toml_dir_ref_path:str):
    for line in fileinput.input(path, inplace=True, backup=".bak"):
        og_line = line
        if line.startswith("#import \"@preview/"): # External package
            package_name, package_version, package_options = extract_preview_package_info(line)
            if toml_dir_ref_path != "":
                levels = path.count("/") - toml_dir_ref_path.count("/") + 1
            else:
                levels = 0
            package_path = ""

            for package in __PACKAGES:
                if package[__PACKAGE_PACKAGE_INDEX] == package_name and package[__PACKAGE_VERSION_INDEX] == package_version:
                    package_path = package[2]

            # Otherwise importing this package does not work (seemingly)
            if package_name == "oxifmt":
                package_options += " as oxifmt"

            print("#import \"./" + ("../" * levels) + package_path.removeprefix("./local/") + "\"" + package_options,end="\n")
        elif line.startswith("#import \"/"): # Internal package with path relative to toml file dir
            line = line.rstrip().replace("#import \"/", "")
            line = line.split("\"", 1)[0]
            if og_line.count(":") > 0:
                options = og_line.rfind(":")
                options = og_line[options:].rstrip()
            elif og_line.count(" as "):
                options = og_line.rfind(" as ")
                options = og_line[options:].rstrip()
            else:
                options = ""
            rel_path = os.path.relpath(toml_dir_ref_path + line, os.path.dirname(path))
            print(f"#import \"./{rel_path}\"{options}", end="\n")
        else:
            print(og_line ,end="")

def parse_toml(path:str):
    data = toml.load(path)
    return path.removesuffix("typst.toml") + data.get("package").get("entrypoint")

def scan_for_toml_files():
    files = []
    for dir in os.listdir(__TEMP_LOCATION):
        if os.path.isdir(__TEMP_LOCATION + dir):
            if os.path.isfile(__TEMP_LOCATION + dir + "/typst.toml"):
                files.append(__TEMP_LOCATION + dir + "/typst.toml")
    return files

def check_if_packages_are_missing(packages, toml_files):
    if len(toml_files) > len(packages): # More toml files than packages recorded, we are missing downloaded packages
        return True
    for package in packages:
        if f"{__TEMP_LOCATION}{package[__PACKAGE_PACKAGE_INDEX]}-{package[__PACKAGE_VERSION_INDEX]}/typst.toml" not in toml_files:
            return True
    return False

def assign_lib_path_to_lib():
    toml_files = scan_for_toml_files()
    for package in __PACKAGES:
        if f"{__TEMP_LOCATION}{package[__PACKAGE_PACKAGE_INDEX]}-{package[__PACKAGE_VERSION_INDEX]}/typst.toml" in toml_files:
            tmp = parse_toml(f"{__TEMP_LOCATION}{package[__PACKAGE_PACKAGE_INDEX]}-{package[__PACKAGE_VERSION_INDEX]}/typst.toml")
            __PACKAGES[__PACKAGES.index(package)] = package + (tmp,)

# ##############################################################################################################
# Downloading

def download_package(package_name:str, version:str):
    url = "https://packages.typst.org/preview/" + package_name + "-" + version + ".tar.gz"
    r = requests.get(url, stream=True)
    with open(__TEMP_LOCATION + package_name + ".tar.gz", 'wb') as fd:
        for chunk in r.iter_content(chunk_size=128):
            fd.write(chunk)
    tar = tarfile.open(__TEMP_LOCATION + package_name + ".tar.gz", "r:gz")
    tar.extractall(__TEMP_LOCATION + package_name + "-" + version)
    tar.close()
    os.remove(__TEMP_LOCATION + package_name + ".tar.gz")

def download_missing_packages(packages):
    for package in packages:
        if package not in __PACKAGES:
            download_package(package[__PACKAGE_PACKAGE_INDEX], package[__PACKAGE_VERSION_INDEX])
            __PACKAGES.append(package)

# ##############################################################################################################

if __name__ == "__main__":
    os.mkdir(__TEMP_LOCATION)
    shutil.copyfile("lib.typ", __TEMP_LOCATION + "lib.typ")

    packages, files_to_change = parse_file_for_external_packages_recursively(__TEMP_LOCATION + "lib.typ", "")
    download_missing_packages(packages)

    while True:
        toml_files = scan_for_toml_files()
        for file in toml_files:
            packages, sub_files_to_change = parse_file_for_external_packages_recursively(parse_toml(file), file.removesuffix("typst.toml"))
            files_to_change += sub_files_to_change
            download_missing_packages(packages)

        if check_if_packages_are_missing(__PACKAGES, scan_for_toml_files()) is False:
            break

    assign_lib_path_to_lib()
    unique_files_to_change = list(dict.fromkeys(files_to_change))

    # print(unique_files_to_change)
    for file in unique_files_to_change:
        change_paths(file[0], file[1])

    shutil.copytree("assets/", __TEMP_LOCATION + "assets/")

    shutil.make_archive("fhict-document-template-local", 'zip', os.getcwd(), __TEMP_LOCATION)

    shutil.rmtree(__TEMP_LOCATION)
