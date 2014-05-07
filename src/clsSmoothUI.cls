VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsSmoothUI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' ¡¶¿€ ø§∑√

Private Type ctlArray
    Name As String
    Direction As String
    Speed As Double
    UIMode As Long
    orgPosition As Long
End Type

Private myControls() As ctlArray
Private Count As Long

Public Sub show(targetForm As Form, Name As String, Direction As Long, Optional Speed As Double = 0.12)
    Dim orgPosition As Long
    With targetForm
        Select Case Direction
            Case UI_DIR_LEFT:
                orgPosition = .controls(Name).Left
                .controls(Name).Left = -.controls(Name).Width
            Case UI_DIR_RIGHT:
                orgPosition = .controls(Name).Left
                .controls(Name).Left = .ScaleWidth + .controls(Name).Width
            Case UI_DIR_TOP:
                orgPosition = .controls(Name).Top
                .controls(Name).Top = -.controls(Name).Height
            Case UI_DIR_BOTTOM:
                orgPosition = .controls(Name).Top
                .controls(Name).Top = .ScaleHeight + .controls(Name).Height
        End Select
    End With
    
    If Count = 0 Then GoTo ExPass
    For i = 0 To (Count - 1)
        If myControls(i).Name = Name Then
            myControls(i).Direction = Direction
            myControls(i).UIMode = UI_MOD_SHOW
            myControls(i).Speed = Speed
            Exit Sub
        End If
    Next i
ExPass:
    ReDim Preserve myControls(Count)
    myControls(UBound(myControls)).Name = Name
    myControls(UBound(myControls)).Direction = Direction
    myControls(UBound(myControls)).orgPosition = orgPosition
    myControls(UBound(myControls)).Speed = Speed
    myControls(UBound(myControls)).UIMode = UI_MOD_SHOW
    Count = Count + 1
End Sub

Public Sub hide(targetForm As Form, Name As String, Direction As Long, Optional Speed As Double = 0.12)
    Dim orgPosition As Long
    With targetForm
        Select Case Direction
            Case UI_DIR_LEFT:
                orgPosition = .controls(Name).Left
            Case UI_DIR_RIGHT:
                orgPosition = .controls(Name).Left
            Case UI_DIR_TOP:
                orgPosition = .controls(Name).Top
            Case UI_DIR_BOTTOM:
                orgPosition = .controls(Name).Top
        End Select
    End With
    
    If Count = 0 Then GoTo ExPass
    For i = 0 To (Count - 1)
        If myControls(i).Name = Name Then
            myControls(i).Direction = Direction
            myControls(i).UIMode = UI_MOD_HIDE
            myControls(i).Speed = Speed
            Exit Sub
        End If
    Next i
ExPass:
    ReDim Preserve myControls(Count)
    myControls(UBound(myControls)).Name = Name
    myControls(UBound(myControls)).Direction = Direction
    myControls(UBound(myControls)).orgPosition = orgPosition
    myControls(UBound(myControls)).Speed = Speed
    myControls(UBound(myControls)).UIMode = UI_MOD_HIDE
    Count = Count + 1
End Sub

Public Sub AllUnload()
    For i = 0 To Count - 1
        If myControls(i).UIMode = UI_MOD_SHOW Then myControls(i).UIMode = UI_MOD_UNLOAD
    Next i
End Sub
Public Sub draw(targetForm As Form)
    With targetForm
        For i = 0 To UBound(myControls)
            Select Case myControls(i).UIMode
                Case UI_MOD_SHOW:
                    Select Case myControls(i).Direction
                    Case UI_DIR_LEFT:
                        If .controls(myControls(i).Name).Left <= myControls(i).orgPosition - 10 Then .controls(myControls(i).Name).Left = .controls(myControls(i).Name).Left + (myControls(i).orgPosition - .controls(myControls(i).Name).Left) * myControls(i).Speed
                    Case UI_DIR_RIGHT:
                        If .controls(myControls(i).Name).Left >= myControls(i).orgPosition - 10 Then .controls(myControls(i).Name).Left = .controls(myControls(i).Name).Left + (myControls(i).orgPosition - .controls(myControls(i).Name).Left) * myControls(i).Speed
                    Case UI_DIR_TOP:
                        If .controls(myControls(i).Name).Top <= myControls(i).orgPosition - 10 Then .controls(myControls(i).Name).Top = .controls(myControls(i).Name).Top + (myControls(i).orgPosition - .controls(myControls(i).Name).Top) * myControls(i).Speed
                    Case UI_DIR_BOTTOM:
                        If .controls(myControls(i).Name).Top >= myControls(i).orgPosition - 10 Then .controls(myControls(i).Name).Top = .controls(myControls(i).Name).Top + (myControls(i).orgPosition - .controls(myControls(i).Name).Top) * myControls(i).Speed
                    End Select
                Case UI_MOD_HIDE:
                    Select Case myControls(i).Direction
                    Case UI_DIR_LEFT:
                        If .controls(myControls(i).Name).Left >= -.controls(myControls(i).Name).Width Then .controls(myControls(i).Name).Left = .controls(myControls(i).Name).Left + (-.controls(myControls(i).Name).Width - 10 - .controls(myControls(i).Name).Left) * myControls(i).Speed
                    Case UI_DIR_RIGHT:
                         If .controls(myControls(i).Name).Left <= .ScaleWidth Then .controls(myControls(i).Name).Left = .controls(myControls(i).Name).Left + ((.ScaleWidth + 10) - .controls(myControls(i).Name).Left) * myControls(i).Speed
                    Case UI_DIR_TOP:
                        If .controls(myControls(i).Name).Top >= -.controls(myControls(i).Name).Height Then .controls(myControls(i).Name).Top = .controls(myControls(i).Name).Top + (-.controls(myControls(i).Name).Height - 10 - .controls(myControls(i).Name).Top) * myControls(i).Speed
                    Case UI_DIR_BOTTOM:
                        If .controls(myControls(i).Name).Top <= .ScaleHeight Then .controls(myControls(i).Name).Top = .controls(myControls(i).Name).Top + ((.ScaleHeight + 10) - .controls(myControls(i).Name).Top) * myControls(i).Speed
                    End Select
                Case UI_MOD_UNLOAD:
                    Select Case myControls(i).Direction
                    Case UI_DIR_LEFT:
                        If .controls(myControls(i).Name).Left >= -.controls(myControls(i).Name).Width Then .controls(myControls(i).Name).Left = .controls(myControls(i).Name).Left + (-.controls(myControls(i).Name).Width - 10 - .controls(myControls(i).Name).Left) * myControls(i).Speed Else unload targetForm
                    Case UI_DIR_RIGHT:
                         If .controls(myControls(i).Name).Left <= .ScaleWidth Then .controls(myControls(i).Name).Left = .controls(myControls(i).Name).Left + ((.ScaleWidth + 10) - .controls(myControls(i).Name).Left) * myControls(i).Speed Else unload targetForm
                    Case UI_DIR_TOP:
                        If .controls(myControls(i).Name).Top >= -.controls(myControls(i).Name).Height Then .controls(myControls(i).Name).Top = .controls(myControls(i).Name).Top + (-.controls(myControls(i).Name).Height - 10 - .controls(myControls(i).Name).Top) * myControls(i).Speed Else unload targetForm
                    Case UI_DIR_BOTTOM:
                        If .controls(myControls(i).Name).Top <= .ScaleHeight Then .controls(myControls(i).Name).Top = .controls(myControls(i).Name).Top + ((.ScaleHeight + 10) - .controls(myControls(i).Name).Top) * myControls(i).Speed Else unload targetForm
                    End Select
            End Select
        Next i
    End With
End Sub
