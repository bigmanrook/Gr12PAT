object frmMainMenu: TfrmMainMenu
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Main Menu'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  TextHeight = 15
  object imgProfile: TImage
    Left = 8
    Top = 8
    Width = 105
    Height = 105
  end
  object lblUsername: TLabel
    Left = 8
    Top = 136
    Width = 53
    Height = 15
    Caption = 'Username'
  end
  object lblAccount: TLabel
    Left = 8
    Top = 157
    Width = 45
    Height = 15
    Caption = 'Account'
  end
  object lblUser: TLabel
    Left = 8
    Top = 178
    Width = 23
    Height = 15
    Caption = 'User'
  end
  object btnAddProperty: TSpeedButton
    Left = 8
    Top = 280
    Width = 89
    Height = 22
    Caption = 'Add Property'
  end
  object btnHelp: TButton
    Left = 568
    Top = 392
    Width = 52
    Height = 42
    Caption = '?'
    TabOrder = 0
  end
  object btnReturn: TButton
    Left = 8
    Top = 409
    Width = 137
    Height = 25
    Caption = 'Return to Login Screen'
    TabOrder = 1
  end
  object btnViewProperties: TButton
    Left = 8
    Top = 216
    Width = 89
    Height = 25
    Caption = 'View Properties'
    TabOrder = 2
  end
  object btnEditProperties: TButton
    Left = 8
    Top = 247
    Width = 89
    Height = 25
    Caption = 'Edit Properties'
    TabOrder = 3
  end
  object imglsProperties: TImageList
    Left = 184
    Top = 144
  end
end