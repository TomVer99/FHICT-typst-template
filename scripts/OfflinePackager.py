import requests
import shutil
import os
import tarfile

__TEMP_LOCATION = "./local/"

def parse_file_for_packages(path:str):
    pass

def parse_toml(path:str):
    # Parse toml into python
    # Locate entrypoint
    # Create a relative path
    # Return
    pass

def download_package(package_name:str, version:str):
    url = "https://packages.typst.org/preview/" + package_name + "-" + version + ".tar.gz"
    r = requests.get(url, stream=True)
    with open(__TEMP_LOCATION + package_name + ".tar.gz", 'wb') as fd:
        for chunk in r.iter_content(chunk_size=128):
            fd.write(chunk)

if __name__ == "__main__":
    os.mkdir(__TEMP_LOCATION)
    shutil.copyfile("./lib.typ", __TEMP_LOCATION + "lib.typ")
    
    packages = parse_file_for_packages("./lib.typ")

    # for package in packages:
    #     pass

    download_package("codly", "1.3.0")

    tar = tarfile.open("./local/codly.tar.gz", "r:gz")
    tar.extractall("./local/codly/")
    tar.close()

    os.remove("./local/codly.tar.gz")
    
    # shutil.rmtree(__TEMP_LOCATION)
