@ECHO OFF

@REM ############# Script Assmption ###############
@REM Onenote backups all target onenote files to the local drive. 
@REM This script will set read-only to the backuped files, and then read them with onenote application. 
@REM For latest Windows 10 Users, before you run, may need to turn off "Controlled folder access" under Ransomware protection in Windows Security
@REM Also check Onenote backup directory under File->Options->Save & Backup->Backup folder
@REM Currently this script sets the backup location to "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\". 

@REM set backup_file_path="C:\Users\malwa\Documents\backup"
@REM set note_path=OSCPNote
@REM set current_file_path="C:\Users\malwa\OneDrive\Documents\OneNote Notebooks"
@REM set file_file_path="C:\Users\malwa\OneDrive\Documents\OneNote Notebooks"

@REM Remember the current batch file location
set mypath=%cd%

@REM delete all existing files
del /Q /F /S "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\*"
del /Q /F /S "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\OneNote_RecycleBin"

@REM copy OneNote files
xcopy "C:\Users\malwa\Documents\backup\16.0\Backup\OSCPNote\*" "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks" /E
echo "Copying completed"

@REM set read-only
attrib +r "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\"*.* /s
echo "Setting Read-only completed"

@REM 
@REM we assume that the file name is no longer than 50 characters.
@REM check https://superuser.com/questions/475874/how-does-the-windows-rename-command-interpret-wildcards 
cd "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\"
rename ??????????????????????????????????????????????????.one.* ??????????????????????????????????????????????????.one
dir "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\"

cd %mypath%

@REM open onenote with targetted files

"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\EnumExploit.one"
"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\Shell.one"
"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\BruteForce.one"
"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\FileTransfer.one"
"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\BufferOverflow.one"
"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\InteractiveShell.one"
"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\LinuxPrivilegeEscalation.one"
"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\WindowsPrivilegeEscalation.one"
"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\Metasploit.one"
"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\ActiveDirectory.one"
"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\PostExploit.one"
"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\tmux.one"
"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\HTB.one"
"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\VulnHub.one"
"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\OSCP.one"
"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\OSPG.one"
"C:\Program Files\Microsoft Office\root\Office16\onenote.exe" -t "C:\Users\malwa\OneDrive\Documents\OneNote Notebooks\THM.one"

@REM Go and check "Open Section" in onenote
