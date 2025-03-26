# RAT-Screenshot-Taker
Remote Access Trojan (RAT)

This repository provides a Remote Access Trojan (RAT) designed for educational purposes. The included scripts showcase how a RAT captures screenshots from a user's screen and uploads them to a remote server. This is intended solely for learning and understanding cybersecurity concepts.

## Files

1. **`File.bat`**: A batch file that captures screenshots and uploads them to an FTP server.
2. **`File.vbs`**: A VBScript that runs the batch file silently.
3. **`Task.vbs`**: A VBScript that schedules tasks using the task scheduler to run `File.vbs` at specified times.


## 1. Simple Setup 

 ### Configure the Batch File
   Open File.bat and modify the FTP server details:
   - ftpServer: Your FTP server address.
   - ftpUser: Your FTP username.
   - ftpPass: Your FTP password.
   - ftpDir: The directory on the FTP server where screenshots will be uploaded.

You can run the File.vbs file for a simpler setup. Just ensure that all three files are located in the same folder     

## 2. Advanced Setup using an SFX archive

To make the setup less detectable by antivirus programs, you can create a Self-Extracting Archive (SFX) by merging a normal/good file or folder with the `run_bat_silently.vbs` and `extract_to_system_drive.bat` files.

The `run_bat_silently.vbs` file will handle the extraction and execution of the scripts in a more discreet manner. The script performs the following actions:

- **Runs the `extract_to_system_drive.bat` file:**
  - This batch file will extract files to the system drive.
  - Delete itself to avoid detection.
  - Execute File.vbs and Task.vbs from the extracted location (System Drive\TFolder).
  
- **`extract_to_system_drive.bat` performs the following tasks:**
  - Copies files from the source directory to the system drive.
  - Hides the newly created directory (`TFolder`) on the system drive.
  - Deletes the original source directory and the batch file itself after extraction.

This process helps to keep the script execution less visible and minimizes the chance of detection.

### Ethical Use

This project is intended strictly for educational purposes and to demonstrate knowledge of cybersecurity concepts, particularly in scripting and automation. 

       
     



