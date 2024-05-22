object frmPropertyNew: TfrmPropertyNew
  Left = 0
  Top = 0
  Caption = 'PropertyNew'
  ClientHeight = 441
  ClientWidth = 624
  Color = clAppWorkSpace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object edtDoC: TLabel
    Left = 472
    Top = 276
    Width = 104
    Height = 15
    Caption = 'Date of Completion'
  end
  object btnEnter: TButton
    Left = 8
    Top = 408
    Width = 105
    Height = 25
    Caption = 'Enter information'
    TabOrder = 0
    OnClick = btnEnterClick
  end
  object btnReturn: TButton
    Left = 545
    Top = 409
    Width = 75
    Height = 25
    Caption = 'Back'
    TabOrder = 1
    OnClick = btnReturnClick
  end
  object chkbxForSale: TCheckBox
    Left = 8
    Top = 363
    Width = 97
    Height = 17
    Caption = 'For Sale'
    TabOrder = 2
  end
  object chkbxRent: TCheckBox
    Left = 8
    Top = 385
    Width = 97
    Height = 17
    Caption = 'For Rent'
    TabOrder = 3
  end
  object DateTimePicker1: TDateTimePicker
    Left = 430
    Top = 247
    Width = 186
    Height = 23
    Date = 45398.000000000000000000
    Time = 0.610498611109505900
    TabOrder = 4
  end
  object dbPropertyView: TDBGrid
    Left = 8
    Top = 8
    Width = 608
    Height = 233
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object edtArea: TEdit
    Left = 8
    Top = 305
    Width = 121
    Height = 23
    TabOrder = 6
    Text = 'Area'
  end
  object edtLocation: TEdit
    Left = 8
    Top = 247
    Width = 121
    Height = 23
    TabOrder = 7
    Text = 'Location'
  end
  object edtPerimeter: TEdit
    Left = 8
    Top = 334
    Width = 121
    Height = 23
    TabOrder = 8
    Text = 'Perimeter'
  end
  object edtValue: TEdit
    Left = 8
    Top = 276
    Width = 121
    Height = 23
    TabOrder = 9
    Text = 'Value'
  end
end
