object FMain: TFMain
  Left = 0
  Top = 0
  Caption = #1056#1072#1089#1087#1086#1079#1085#1072#1074#1072#1085#1080#1077' '#1089#1080#1084#1074#1086#1083#1086#1074'...'
  ClientHeight = 183
  ClientWidth = 310
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF009999
    9999999999999999999999999999999999999999999999999999999999999900
    0000000000000000000000000099990000009999999999999999000000999900
    0000999999999999999900000099990000009999999999999999000000999900
    0000999999999999999900000099990000009999900000009999000000999900
    0000999990000000999900000099990000009999900000009999000000999900
    0000999990000000999900000099990000009999900099999999000000999900
    0000999990009999999900000099990000009999900099999999000000999900
    0000999990009999999900000099990000009999900099999999000000999900
    0000999990000000000000000099990000009999900000000000000000999900
    0000999990000000000000000099990000009999900000000000000000999900
    0000999990000000000000000099990000009999900000009999000000999900
    0000999990000000999900000099990000009999900000009999000000999900
    0000999990000000999900000099990000009999999999999999000000999900
    0000999999999999999900000099990000009999999999999999000000999900
    0000999999999999999900000099990000000000000000000000000000999999
    9999999999999999999999999999999999999999999999999999999999990000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 10
    Top = 8
    Width = 88
    Height = 118
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
  end
  object Label1: TLabel
    Left = 104
    Top = 130
    Width = 45
    Height = 13
    Caption = #1057#1080#1084#1074#1086#1083#1099
  end
  object Label2: TLabel
    Left = 102
    Top = 143
    Width = 3
    Height = 13
  end
  object Label3: TLabel
    Left = 229
    Top = 102
    Width = 14
    Height = 13
    Caption = 'h='
  end
  object Panel1: TPanel
    Left = 136
    Top = 6
    Width = 25
    Height = 25
    TabOrder = 0
    OnClick = Panel1Click
  end
  object Panel2: TPanel
    Left = 167
    Top = 6
    Width = 25
    Height = 25
    TabOrder = 1
    OnClick = Panel1Click
  end
  object Panel3: TPanel
    Left = 198
    Top = 6
    Width = 25
    Height = 25
    TabOrder = 2
    OnClick = Panel1Click
  end
  object Panel4: TPanel
    Left = 136
    Top = 37
    Width = 25
    Height = 25
    TabOrder = 3
    OnClick = Panel1Click
  end
  object Panel5: TPanel
    Left = 167
    Top = 37
    Width = 25
    Height = 25
    TabOrder = 4
    OnClick = Panel1Click
  end
  object Panel6: TPanel
    Left = 198
    Top = 37
    Width = 25
    Height = 25
    TabOrder = 5
    OnClick = Panel1Click
  end
  object Panel7: TPanel
    Left = 136
    Top = 68
    Width = 25
    Height = 25
    TabOrder = 6
    OnClick = Panel1Click
  end
  object Panel8: TPanel
    Left = 167
    Top = 68
    Width = 25
    Height = 25
    TabOrder = 7
    OnClick = Panel1Click
  end
  object Panel9: TPanel
    Left = 198
    Top = 68
    Width = 25
    Height = 25
    TabOrder = 8
    OnClick = Panel1Click
  end
  object Panel10: TPanel
    Left = 136
    Top = 99
    Width = 25
    Height = 25
    TabOrder = 9
    OnClick = Panel1Click
  end
  object Panel11: TPanel
    Left = 167
    Top = 99
    Width = 25
    Height = 25
    TabOrder = 10
    OnClick = Panel1Click
  end
  object Panel12: TPanel
    Left = 198
    Top = 99
    Width = 25
    Height = 25
    TabOrder = 11
    OnClick = Panel1Click
  end
  object BTeach: TButton
    Left = 227
    Top = 6
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1086#1084#1085#1080#1090#1100
    TabOrder = 12
    OnClick = BTeachClick
  end
  object BRecognition: TButton
    Left = 229
    Top = 37
    Width = 75
    Height = 25
    Caption = #1056#1072#1089#1087#1086#1079#1085#1072#1090#1100
    TabOrder = 13
    OnClick = BRecognitionClick
  end
  object BClear: TButton
    Left = 227
    Top = 68
    Width = 75
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 14
    OnClick = BClearClick
  end
  object BPicture: TButton
    Left = 104
    Top = 56
    Width = 26
    Height = 25
    Caption = '>'
    TabOrder = 15
    OnClick = BPictureClick
  end
  object TrackBar1: TTrackBar
    Left = 8
    Top = 132
    Width = 90
    Height = 37
    Max = 20
    Min = 5
    Position = 5
    TabOrder = 16
    OnChange = TrackBar1Change
  end
  object Edit1: TEdit
    Left = 249
    Top = 99
    Width = 51
    Height = 21
    TabOrder = 17
    Text = '50'
    OnChange = Edit1Change
  end
end
