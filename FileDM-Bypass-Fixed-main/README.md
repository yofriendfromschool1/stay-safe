# FileDM Bypass
This Python script will let you bypass the FileDM installer (which has tons of adware).

---
## Usage

+ Download the executable file from DirectFileDL (e.g. file_123456.exe).
+ Run the script with the executable file as an argument (e.g. python bypass.py file_123456.exe) or drag the executable to the .py script.
+ The script will print the direct download link and copy it to your clipboard.

---
## How it works
The FileDM installer has a bunch of numbers in its name (e.g. file_**`123456`**), the script extracts it, then sends a GET request to the DirectFileDL callback info URL with the download ID as a parameter, sends two POST requests to the DirectFileDL callback URL with the channel ID, download ID, and action as parameters, finally, it constructs the DirectFileDL link using the download ID.

If this method gets patched I will look for more ways!

---
## Credits
This project is based on [this repo](https://github.com/MattLawz/FileDM-Bypasser-Application/), I just do my research of why is not longer working and decided to create a new one.

---
