Set objArgs = WScript.Arguments
If objArgs.Count > 0 Then
    path = objArgs(0)
    Set objFSO = CreateObject("Scripting.FileSystemObject")
    
    ' Check if path is a folder; if so, append a backslash
    If objFSO.FolderExists(path) Then
        If Right(path, 1) <> "\" Then
            path = path & "\"
        End If
    End If
    
    Set objShell = CreateObject("WScript.Shell")
    ' Run via PowerShell hidden to avoid any flickering and ensure clipboard stability
    objShell.Run "powershell -NoProfile -Command ""Set-Clipboard -Value '" & path & "'""", 0, True
End If