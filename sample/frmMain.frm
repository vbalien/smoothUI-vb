VERSION 5.00
Begin VB.Form frmMain 
   BackColor       =   &H00C0C000&
   BorderStyle     =   0  'None
   Caption         =   "¿¬°ü°Ë»ö¾î"
   ClientHeight    =   5175
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9735
   BeginProperty Font 
      Name            =   "¸¼Àº °íµñ"
      Size            =   9
      Charset         =   129
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   5175
   ScaleWidth      =   9735
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command1 
      Caption         =   "Click!"
      BeginProperty Font 
         Name            =   "¸¼Àº °íµñ"
         Size            =   15.75
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4080
      TabIndex        =   5
      Top             =   3360
      Width           =   3855
   End
   Begin VB.TextBox Text2 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "¸¼Àº °íµñ"
         Size            =   20.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4080
      TabIndex        =   4
      Text            =   "Text2"
      Top             =   2400
      Width           =   3855
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "¸¼Àº °íµñ"
         Size            =   20.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4080
      TabIndex        =   3
      Text            =   "Text1"
      Top             =   1440
      Width           =   3855
   End
   Begin VB.ListBox List1 
      Appearance      =   0  'Flat
      Height          =   3630
      Left            =   480
      TabIndex        =   2
      Top             =   1200
      Width           =   2655
   End
   Begin VB.Timer tmrUI 
      Interval        =   10
      Left            =   3120
      Top             =   2400
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Hello!"
      BeginProperty Font 
         Name            =   "¸¼Àº °íµñ"
         Size            =   26.25
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   705
      Left            =   3120
      TabIndex        =   6
      Top             =   240
      Width           =   1395
   End
   Begin VB.Image Image1 
      Height          =   3615
      Left            =   3240
      Picture         =   "frmMain.frx":0000
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   6015
   End
   Begin VB.Label labClose 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Close"
      BeginProperty Font 
         Name            =   "¸¼Àº °íµñ"
         Size            =   12
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   8880
      TabIndex        =   1
      Top             =   120
      Width           =   720
   End
   Begin VB.Label labTitle 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Title"
      BeginProperty Font 
         Name            =   "¸¼Àº °íµñ"
         Size            =   36
         Charset         =   129
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   975
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   1395
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00808000&
      Height          =   5175
      Left            =   0
      Top             =   0
      Width           =   9735
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ReleaseCapture Lib "user32.dll" () As Long
Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByRef lParam As Any) As Long
Dim UI As New clsSmoothUI

Private Sub Command1_Click()
    Call UI.hide(Me, "Text1", UI_DIR_TOP)
    Call UI.hide(Me, "Text2", UI_DIR_TOP)
    Call UI.hide(Me, "Command1", UI_DIR_RIGHT)
    Call UI.show(Me, "Image1", UI_DIR_RIGHT)
    Call UI.show(Me, "Label1", UI_DIR_TOP)
End Sub

Private Sub Form_Load()
    Call UI.show(Me, "labTitle", UI_DIR_LEFT)
    Call UI.show(Me, "labClose", UI_DIR_TOP)
    Call UI.show(Me, "List1", UI_DIR_LEFT)
    Call UI.show(Me, "Text1", UI_DIR_TOP)
    Call UI.show(Me, "Text2", UI_DIR_TOP)
    Call UI.show(Me, "Command1", UI_DIR_RIGHT)
    Call UI.hide(Me, "Image1", UI_DIR_RIGHT, 1)
    Call UI.hide(Me, "Label1", UI_DIR_TOP, 1)
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then
        ReleaseCapture
        SendMessage hWnd, &HA1, 2, ByVal 0&
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

Private Sub labClose_Click()
    Call UI.AllUnload
End Sub

Private Sub labTitle_Click()
    Call UI.hide("labTitle", UI_DIR_LEFT)
End Sub

Private Sub labTitle_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then
        ReleaseCapture
        SendMessage hWnd, &HA1, 2, ByVal 0&
    End If
End Sub

Private Sub tmrUI_Timer()
    Call UI.draw(Me)
End Sub
