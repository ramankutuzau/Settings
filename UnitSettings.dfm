object FormSettings: TFormSettings
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 661
  ClientWidth = 1024
  Color = clWhite
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'SF UI Display'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1024
    Height = 661
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      object ScrollBoxSettings: TScrollBox
        Left = 0
        Top = 0
        Width = 1016
        Height = 631
        VertScrollBar.Position = 875
        Align = alClient
        TabOrder = 0
        OnMouseWheelDown = ScrollBoxSettingsMouseWheelDown
        OnMouseWheelUp = ScrollBoxSettingsMouseWheelUp
        object GroupBox4: TGroupBox
          Left = 0
          Top = -875
          Width = 995
          Height = 385
          Align = alTop
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
          Color = clWhite
          ParentBackground = False
          ParentColor = False
          TabOrder = 0
          object DBGridUsers: TDBGrid
            Left = 3
            Top = 56
            Width = 982
            Height = 321
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            PopupMenu = PopupMenuUsers
            TabOrder = 0
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'SF UI Display'
            TitleFont.Style = []
            OnDblClick = DBGridUsersDblClick
          end
          object ButtonAddUser: TButton
            Left = 16
            Top = 17
            Width = 209
            Height = 33
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
            TabOrder = 1
            OnClick = ButtonAddUserClick
          end
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = -124
          Width = 995
          Height = 385
          Align = alTop
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1080' '#1084#1086#1076#1091#1083#1080
          TabOrder = 1
          object Label1: TLabel
            Left = 24
            Top = 24
            Width = 66
            Height = 15
            Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080':'
          end
          object Label2: TLabel
            Left = 320
            Top = 24
            Width = 132
            Height = 15
            Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1085#1099#1077' '#1084#1086#1076#1091#1083#1080':'
          end
          object Label3: TLabel
            Left = 576
            Top = 24
            Width = 150
            Height = 15
            Caption = #1053#1077' '#1076#1086#1073#1072#1074#1083#1077#1085#1085#1099#1077' '#1084#1086#1076#1091#1083#1080':'
          end
          object Label4: TLabel
            Left = 366
            Top = 340
            Width = 385
            Height = 15
            AutoSize = False
            Caption = #1044#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103'/'#1091#1076#1072#1083#1077#1085#1080#1103' '#1076#1074#1086#1081#1085#1086#1081' '#1082#1083#1080#1082', '#1083#1077#1074#1086#1081' '#1082#1085#1086#1087#1082#1086#1081' '#1084#1099#1096#1080
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'SF UI Display'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object DBLookupListBoxCategory: TDBLookupListBox
            Left = 16
            Top = 45
            Width = 233
            Height = 289
            PopupMenu = PopupMenuCategory
            TabOrder = 0
            OnClick = DBLookupListBoxCategoryClick
          end
          object Button1: TButton
            Left = 16
            Top = 340
            Width = 233
            Height = 34
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1082#1072#1090#1077#1075#1086#1088#1080#1102
            TabOrder = 1
            OnClick = Button1Click
          end
          object DBLookupListBoxModuleAdded: TDBLookupListBox
            Left = 304
            Top = 45
            Width = 233
            Height = 289
            TabOrder = 2
            OnDblClick = DBLookupListBoxModuleAddedDblClick
          end
          object DBLookupListBoxModuleNotAdded: TDBLookupListBox
            Left = 560
            Top = 45
            Width = 233
            Height = 289
            TabOrder = 3
            OnDblClick = DBLookupListBoxModuleNotAddedDblClick
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 261
          Width = 995
          Height = 366
          Align = alTop
          Caption = #1042#1099#1076#1072#1095#1072' '#1084#1086#1076#1091#1083#1077#1081' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1085#1099#1084' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103#1084
          Color = 16773887
          ParentBackground = False
          ParentColor = False
          TabOrder = 2
          object Label5: TLabel
            Left = 24
            Top = 24
            Width = 86
            Height = 15
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080':'
          end
          object Label6: TLabel
            Left = 320
            Top = 24
            Width = 132
            Height = 15
            Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1085#1099#1077' '#1084#1086#1076#1091#1083#1080':'
          end
          object Label7: TLabel
            Left = 576
            Top = 24
            Width = 150
            Height = 15
            Caption = #1053#1077' '#1076#1086#1073#1072#1074#1083#1077#1085#1085#1099#1077' '#1084#1086#1076#1091#1083#1080':'
          end
          object Label8: TLabel
            Left = 366
            Top = 340
            Width = 385
            Height = 15
            AutoSize = False
            Caption = #1044#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103'/'#1091#1076#1072#1083#1077#1085#1080#1103' '#1076#1074#1086#1081#1085#1086#1081' '#1082#1083#1080#1082', '#1083#1077#1074#1086#1081' '#1082#1085#1086#1087#1082#1086#1081' '#1084#1099#1096#1080
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'SF UI Display'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object DBLookupListBoxUsersModule: TDBLookupListBox
            Left = 16
            Top = 45
            Width = 233
            Height = 289
            TabOrder = 0
            OnClick = DBLookupListBoxUsersModuleClick
          end
          object DBLookupListBoxUsersAddedModule: TDBLookupListBox
            Left = 304
            Top = 45
            Width = 233
            Height = 289
            TabOrder = 1
            OnDblClick = DBLookupListBoxUsersAddedModuleDblClick
          end
          object DBLookupListBoxUsersNotAddedModule: TDBLookupListBox
            Left = 560
            Top = 45
            Width = 233
            Height = 289
            TabOrder = 2
            OnDblClick = DBLookupListBoxUsersNotAddedModuleDblClick
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = -490
          Width = 995
          Height = 366
          Align = alTop
          Caption = #1055#1088#1072#1074#1072' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
          Color = 16773887
          ParentBackground = False
          ParentColor = False
          TabOrder = 3
          object Label9: TLabel
            Left = 24
            Top = 24
            Width = 86
            Height = 15
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080':'
          end
          object Label10: TLabel
            Left = 320
            Top = 24
            Width = 181
            Height = 15
            Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1085#1099#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1088#1072#1074':'
          end
          object Label11: TLabel
            Left = 576
            Top = 24
            Width = 199
            Height = 15
            Caption = #1053#1077' '#1076#1086#1073#1072#1074#1083#1077#1085#1085#1099#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1088#1072#1074':'
          end
          object Label12: TLabel
            Left = 366
            Top = 340
            Width = 385
            Height = 15
            AutoSize = False
            Caption = #1044#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103'/'#1091#1076#1072#1083#1077#1085#1080#1103' '#1076#1074#1086#1081#1085#1086#1081' '#1082#1083#1080#1082', '#1083#1077#1074#1086#1081' '#1082#1085#1086#1087#1082#1086#1081' '#1084#1099#1096#1080
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'SF UI Display'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object DBLookupListBoxUsers: TDBLookupListBox
            Left = 16
            Top = 45
            Width = 233
            Height = 289
            TabOrder = 0
            OnClick = DBLookupListBoxUsersClick
          end
          object DBLookupListBoxCategoryAdded: TDBLookupListBox
            Left = 304
            Top = 45
            Width = 233
            Height = 289
            TabOrder = 1
            OnDblClick = DBLookupListBoxCategoryAddedDblClick
          end
          object DBLookupListBoxCategoryNotAdded: TDBLookupListBox
            Left = 560
            Top = 45
            Width = 233
            Height = 289
            TabOrder = 2
            OnDblClick = DBLookupListBoxCategoryNotAddedDblClick
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1063#1090#1086'-'#1090#1086
      ImageIndex = 1
    end
  end
  object PopupMenuCategory: TPopupMenu
    Left = 668
    Top = 50
    object N1: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = N2Click
    end
  end
  object MySQLDatabaseSettings: TMySQLDatabase
    DatabaseName = 'romashka'
    UserName = 'romashka'
    UserPassword = 'romashka1234'
    Host = '135.181.40.238'
    ConnectOptions = [coCompress]
    Params.Strings = (
      'Port=3306'
      'TIMEOUT=30'
      'Host=135.181.40.238'
      'UID=romashka'
      'PWD=romashka1234'
      'DatabaseName=romashka')
    SSLProperties.TLSVersion = tlsAuto
    DatasetOptions = []
    Left = 36
    Top = 32
  end
  object PopupMenuUsers: TPopupMenu
    Left = 588
    Top = 53
    object N3: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = N3Click
    end
  end
  object DataSourceCategory: TDataSource
    Left = 236
    Top = 221
  end
  object DataSourceCategory0: TDataSource
    Left = 556
    Top = 109
  end
  object DataSourceCategory1: TDataSource
    Left = 404
    Top = 109
  end
  object DataSourceDBGrid: TDataSource
    Left = 348
    Top = 53
  end
  object DataSourceModule0: TDataSource
    Left = 556
    Top = 213
  end
  object DataSourceModule1: TDataSource
    Left = 404
    Top = 221
  end
  object DataSourceUsers: TDataSource
    Left = 244
    Top = 109
  end
  object DataSourceUsersModule: TDataSource
    Left = 236
    Top = 341
  end
  object DataSourceUsersModule0: TDataSource
    Left = 556
    Top = 333
  end
  object DataSourceUsersModule1: TDataSource
    Left = 404
    Top = 333
  end
  object MySQLQueryCategory: TMySQLQuery
    Database = MySQLDatabaseSettings
    Left = 236
    Top = 262
  end
  object MySQLQueryCategory0: TMySQLQuery
    Database = MySQLDatabaseSettings
    Left = 556
    Top = 158
  end
  object MySQLQueryCategory1: TMySQLQuery
    Database = MySQLDatabaseSettings
    Left = 404
    Top = 150
  end
  object MySQLQueryDBGrid: TMySQLQuery
    Database = MySQLDatabaseSettings
    Left = 244
    Top = 54
  end
  object MySQLQueryModule0: TMySQLQuery
    Database = MySQLDatabaseSettings
    Left = 556
    Top = 262
  end
  object MySQLQueryModule1: TMySQLQuery
    Database = MySQLDatabaseSettings
    Left = 404
    Top = 262
  end
  object MySQLQueryUsers: TMySQLQuery
    Database = MySQLDatabaseSettings
    Left = 244
    Top = 150
  end
  object MySQLQueryUsersModule: TMySQLQuery
    Database = MySQLDatabaseSettings
    Left = 236
    Top = 390
  end
  object MySQLQueryUsersModule0: TMySQLQuery
    Database = MySQLDatabaseSettings
    Left = 556
    Top = 382
  end
  object MySQLQueryUsersModule1: TMySQLQuery
    Database = MySQLDatabaseSettings
    Left = 404
    Top = 382
  end
  object MySQLQueryUpdate: TMySQLQuery
    Database = MySQLDatabaseSettings
    Left = 84
    Top = 239
  end
end
