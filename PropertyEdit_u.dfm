object frmPropertyEdit: TfrmPropertyEdit
  Left = 0
  Top = 0
  Caption = 'PropertyEdit'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object edtDoC: TLabel
    Left = 280
    Top = 276
    Width = 104
    Height = 15
    Caption = 'Date of Completion'
  end
  object dbPropertyView: TDBGrid
    Left = 8
    Top = 8
    Width = 608
    Height = 233
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btnReturn: TButton
    Left = 545
    Top = 409
    Width = 75
    Height = 25
    Caption = 'Back'
    TabOrder = 1
  end
  object btnEnter: TButton
    Left = 8
    Top = 408
    Width = 105
    Height = 25
    Caption = 'Enter information'
    TabOrder = 2
  end
  object edtLocation: TEdit
    Left = 8
    Top = 247
    Width = 121
    Height = 23
    TabOrder = 3
    Text = 'Location'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 238
    Top = 247
    Width = 186
    Height = 23
    Date = 45398.000000000000000000
    Time = 0.610498611109505900
    TabOrder = 4
  end
  object edtValue: TEdit
    Left = 8
    Top = 276
    Width = 121
    Height = 23
    TabOrder = 5
    Text = 'Value'
  end
  object edtArea: TEdit
    Left = 8
    Top = 305
    Width = 121
    Height = 23
    TabOrder = 6
    Text = 'Area'
  end
  object edtPerimeter: TEdit
    Left = 8
    Top = 334
    Width = 121
    Height = 23
    TabOrder = 7
    Text = 'Perimeter'
  end
  object chkbxForSale: TCheckBox
    Left = 8
    Top = 363
    Width = 97
    Height = 17
    Caption = 'For Sale'
    TabOrder = 8
  end
  object chkbxRent: TCheckBox
    Left = 8
    Top = 385
    Width = 97
    Height = 17
    Caption = 'For Rent'
    TabOrder = 9
  end
  object cmbID: TComboBox
    Left = 471
    Top = 247
    Width = 145
    Height = 23
    TabOrder = 10
    Text = 'PropertyNo'
  end
end