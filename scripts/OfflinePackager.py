import requests
import shutil
import os
import tarfile
import toml

__TEMP_LOCATION = "./local/"
__PACKAGES = []
__PACKAGE_PACKAGE_INDEX = 0
__PACKAGE_VERSION_INDEX = 1

# ##############################################################################################################
# Parsing

def parse_file_for_external_packages_recursively(path:str, toml_dir_ref_path:str):
    external_packages = []
    with open(path, "r") as file:
        for line in file:
            if line.startswith("#import \"@preview/"): # External package
                line = line.replace("#import \"@preview/", "")
                if line.count(":") > 1:
                    line = line.split("\":", 1)[0]
                else:
                    line = line.split("\"", 1)[0]
                package, version = line.split(":", 1)
                external_packages.append((package, version))
            elif line.startswith("#import \"/"): # Internal package with path relative to toml file dir
                line = line.rstrip().replace("#import \"/", "")
                line = line.split("\"", 1)[0]
                sub_packages = parse_file_for_external_packages_recursively(toml_dir_ref_path + line, toml_dir_ref_path)
                if sub_packages != []:
                    external_packages = external_packages + sub_packages
            elif line.startswith("#import \"./"): # Internal package with path relative to current file
                line = line.rstrip().replace("#import \"./", "")
                line = line.split("\"", 1)[0]
                sub_packages = parse_file_for_external_packages_recursively(toml_dir_ref_path + line, toml_dir_ref_path)
                if sub_packages != []:
                    external_packages = external_packages + sub_packages
    return external_packages

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

    packages = parse_file_for_external_packages_recursively(__TEMP_LOCATION + "lib.typ", "")
    download_missing_packages(packages)

    while True:
        toml_files = scan_for_toml_files()
        for file in toml_files:
            packages = parse_file_for_external_packages_recursively(parse_toml(file), file.removesuffix("typst.toml"))
            download_missing_packages(packages)

        if check_if_packages_are_missing(__PACKAGES, scan_for_toml_files()) is False:
            break

    shutil.copytree("assets/", __TEMP_LOCATION + "assets/")

    shutil.rmtree(__TEMP_LOCATION)
