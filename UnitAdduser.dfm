object FormAddUser: TFormAddUser
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 213
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox: TGroupBox
    Left = 0
    Top = 0
    Width = 264
    Height = 213
    Align = alClient
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object LabelLogin: TLabel
      Left = 16
      Top = 22
      Width = 42
      Height = 15
      Caption = #1051#1086#1075#1080#1085' :'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'SF UI Display'
      Font.Style = []
      ParentFont = False
    end
    object LabelName: TLabel
      Left = 16
      Top = 56
      Width = 30
      Height = 15
      Caption = #1048#1084#1103' :'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'SF UI Display'
      Font.Style = []
      ParentFont = False
    end
    object LabelPass: TLabel
      Left = 16
      Top = 93
      Width = 50
      Height = 15
      Caption = #1055#1072#1088#1086#1083#1100' :'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'SF UI Display'
      Font.Style = []
      ParentFont = False
    end
    object LabelPass1: TLabel
      Left = 16
      Top = 128
      Width = 54
      Height = 15
      Caption = #1055#1072#1088#1086#1083#1100' 2'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'SF UI Display'
      Font.Style = []
      ParentFont = False
    end
    object EditLogin: TEdit
      Left = 128
      Top = 19
      Width = 121
      Height = 23
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'SF UI Display'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = EditLoginKeyPress
    end
    object EditName: TEdit
      Left = 128
      Top = 53
      Width = 121
      Height = 23
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'SF UI Display'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = EditNameKeyPress
    end
    object MaskEditPass: TMaskEdit
      Left = 128
      Top = 90
      Width = 121
      Height = 23
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'SF UI Display'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
      Text = ''
      OnKeyPress = MaskEditPassKeyPress
    end
    object MaskEditPass1: TMaskEdit
      Left = 128
      Top = 125
      Width = 121
      Height = 23
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'SF UI Display'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 3
      Text = ''
      OnKeyPress = MaskEditPass1KeyPress
    end
    object ButtonCreate: TButton
      Left = 24
      Top = 168
      Width = 209
      Height = 33
      Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'SF UI Display'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = ButtonCreateClick
    end
  end
  object MySQLQueryUser: TMySQLQuery
    Database = FormSettings.MySQLDatabaseSettings
    Left = 104
    Top = 128
  end
end
