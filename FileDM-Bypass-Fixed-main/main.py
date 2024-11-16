import sys
import time
from colorama import Fore, Back, init
import pyperclip as pc
import requests

def bypass(download_id):
    bypass_request = requests.get("http://dlsft.com/callback/info.php?id=" + download_id)
    channel = bypass_request.text.split("**")[0]
    requests.post(f"http://dlsft.com/callback/?channel={channel}&id={download_id}&action=started")
    requests.post(f"http://dlsft.com/callback/?channel={channel}&id={download_id}&action=completed")
    

def main(executable):
    download_id = executable.split("_")[1].replace(".exe", "")
    print(Fore.GREEN + "Your download link is: " + Fore.RESET + f"https://a.directfiledl.com/getfile?id={download_id}")
    print("Copied your bypassed link to clipboard...")
    pc.copy(f"https://a.directfiledl.com/getfile?id={download_id}")
    print("\nClosing in 5 seconds...")
    time.sleep(5)
    sys.exit()

# Start
if __name__ == '__main__':
    init() # Colorama.init() - Otherwise colors don't work
    if len(sys.argv) > 1:
        exe = sys.argv[1]
        main(exe)
    else:
        print(Fore.RED + "Error: No executable specified!" + Fore.RESET)
