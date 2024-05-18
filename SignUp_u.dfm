object frmSignUp: TfrmSignUp
  Left = 0
  Top = 0
  Caption = 'Sign Up'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 15
  object lblAccount: TLabel
    Left = 192
    Top = 163
    Width = 45
    Height = 15
    Caption = 'Account'
  end
  object lblPassword: TLabel
    Left = 192
    Top = 211
    Width = 50
    Height = 15
    Caption = 'Password'
  end
  object lblUserName: TLabel
    Left = 192
    Top = 115
    Width = 53
    Height = 15
    Caption = 'Username'
  end
  object lblUserType: TLabel
    Left = 192
    Top = 259
    Width = 36
    Height = 15
    Caption = 'Admin'
  end
  object btnSignup: TButton
    Left = 278
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Sign Up'
    TabOrder = 0
    OnClick = btnSignupClick
  end
  object edtAccount: TEdit
    Left = 328
    Top = 160
    Width = 121
    Height = 23
    TabOrder = 1
    Text = 'Account '
  end
  object edtName: TEdit
    Left = 328
    Top = 112
    Width = 121
    Height = 23
    TabOrder = 2
    Text = 'Username'
  end
  object edtPassword: TEdit
    Left = 328
    Top = 208
    Width = 121
    Height = 23
    TabOrder = 3
    Text = 'Password'
  end
  object btnTrue: TCheckBox
    Left = 328
    Top = 259
    Width = 97
    Height = 17
    Caption = 'False'
    TabOrder = 4
  end
end
