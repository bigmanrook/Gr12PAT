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
  object edtValue: TEdit
    Left = 471
    Top = 279
    Width = 145
    Height = 23
    TabOrder = 2
    Text = 'Value'
  end
  object chkbxForSale: TCheckBox
    Left = 8
    Top = 247
    Width = 97
    Height = 17
    Caption = 'For Sale'
    TabOrder = 3
  end
  object chkbxRent: TCheckBox
    Left = 8
    Top = 270
    Width = 97
    Height = 17
    Caption = 'For Rent'
    TabOrder = 4
  end
  object cmbID: TComboBox
    Left = 471
    Top = 247
    Width = 145
    Height = 23
    TabOrder = 5
    Text = 'PropertyNo'
  end
  object btnDelete: TButton
    Left = 264
    Top = 408
    Width = 113
    Height = 25
    Caption = 'Delete record/row'
    TabOrder = 6
  end
  object btnUpdateValue: TButton
    Left = 496
    Top = 310
    Width = 90
    Height = 25
    Caption = 'Update Value'
    TabOrder = 7
    OnClick = btnUpdateValueClick
  end
  object btnUpdate: TButton
    Left = 8
    Top = 310
    Width = 113
    Height = 25
    Caption = 'Update Availability'
    TabOrder = 8
    OnClick = btnUpdateClick
  end
end
