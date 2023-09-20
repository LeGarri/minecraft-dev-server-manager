#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         LeGarri

 Script Function:
	Manage minecraft server and transfer maven jar build to plugin folder.

#ce ----------------------------------------------------------------------------

; Script Start

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <AutoItConstants.au3>
#include <FileConstants.au3>


#Region ### GUI ###
$Form1 = GUICreate("Server DEV - MANAGER | by LeGarri", 562, 503, 198, 124)
$GroupPlugin = GUICtrlCreateGroup("Plugin", 8, 0, 265, 281)
$ButtonTransfer = GUICtrlCreateButton("Transfer", 28, 223, 219, 41)
$StateGUI = GUICtrlCreateLabel("Waiting", 68, 191, 49, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$StateLabel = GUICtrlCreateLabel("State:", 28, 191, 38, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$GroupDestination = GUICtrlCreateGroup("Destination", 28, 103, 225, 81)
$InputDestination = GUICtrlCreateInput("Click here !", 40, 150, 201, 21)
$LabelDestination = GUICtrlCreateLabel("Click to select server plugin folder", 40, 126, 203, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$GroupSource = GUICtrlCreateGroup("Source", 28, 15, 225, 81)
$InputSource = GUICtrlCreateInput("Click here !", 40, 62, 201, 21)
$LabelSource = GUICtrlCreateLabel("Click to select compiled jar", 40, 38, 163, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$GroupServer = GUICtrlCreateGroup("Server", 288, 0, 265, 281)
$GroupScript = GUICtrlCreateGroup("Script", 308, 15, 225, 81)
$InputScript = GUICtrlCreateInput("Click here !", 320, 62, 201, 21)
$LabelScript = GUICtrlCreateLabel("Click to select script file", 320, 38, 141, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$ButtonStart = GUICtrlCreateButton("Start server", 308, 111, 219, 41)
$ButtonStop = GUICtrlCreateButton("Stop server", 308, 159, 219, 41)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Console = GUICtrlCreateEdit("", 8, 288, 545, 209)
GUICtrlSetData(-1, "")
GUISetState(@SW_SHOW)
#EndRegion ### GUI ###

$Run = Null
$ServerStarted = False
$ConsoleOutput = ""

While 1
	$nMsg = GUIGetMsg()
	
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
			
		Case $ButtonStart
			StartServer()
			
		Case $InputScript
			OpenScriptBrowser()

	EndSwitch
	
	If $ServerStarted = True Then
		$ConsoleOutput &= StdoutRead($Run, True)
		$ConsoleOutput &= StderrRead($Run, True)
	EndIf
WEnd

Func StartServer()
	$Run = Run(@ComSpec & " /c " & './' & GUICtrlRead($InputScript), "", @SW_MINIMIZE, $STDOUT_CHILD)
	$ServerStarted = True
EndFunc

Func OpenScriptBrowser()
	Local $FileBrowser = FileOpenDialog("Select start server script", @WindowsDir & "\", "All (*.*)", $FD_FILEMUSTEXIST)
	GUICtrlSetData($InputScript, $FileBrowser)
EndFunc

























































