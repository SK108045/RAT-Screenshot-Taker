Dim objShell
Dim objFSO
Dim scriptPath
Dim scriptFolder
Dim strCommand
Dim taskName
Dim taskTime
Dim i

' Get the directory of the current script
Set objFSO = CreateObject("Scripting.FileSystemObject")
scriptPath = WScript.ScriptFullName
scriptFolder = objFSO.GetParentFolderName(scriptPath)

' Create scheduled tasks for each hour from 07:00 to 16:00
For i = 7 To 8
    taskTime = Right("0" & i, 2) & ":36"
    taskName = "HelloWorldTask_" & Right("0" & i, 2) & "36"
    strCommand = "schtasks /create /tn " & taskName & " /tr ""cscript //nologo """ & scriptFolder & "\File.vbs"""" /sc daily /st " & taskTime
    Set objShell = CreateObject("WScript.Shell")
    objShell.Run strCommand, 0, True
Next

' Clean up
Set objShell = Nothing
Set objFSO = Nothing
