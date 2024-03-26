object frmLoginScreen: TfrmLoginScreen
  Left = 0
  Top = 0
  Caption = 'Login Screen'
  ClientHeight = 429
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblAccount: TLabel
    Left = 192
    Top = 163
    Width = 103
    Height = 15
    Caption = 'Account/Username'
  end
  object lblPassword: TLabel
    Left = 192
    Top = 211
    Width = 50
    Height = 15
    Caption = 'Password'
  end
  object btnLogin: TButton
    Left = 192
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Login'
    TabOrder = 0
    OnClick = btnLoginClick
  end
  object edtAccount: TEdit
    Left = 328
    Top = 160
    Width = 121
    Height = 23
    TabOrder = 1
    Text = 'Account/Username'
  end
  object edtPassword: TEdit
    Left = 328
    Top = 208
    Width = 121
    Height = 23
    TabOrder = 2
    Text = 'Password'
  end
  object btnSignup: TButton
    Left = 382
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Sign Up'
    TabOrder = 3
    OnClick = btnSignupClick
  end
  object btnResetPassword: TButton
    Left = 273
    Top = 344
    Width = 103
    Height = 25
    Caption = 'Forgot stuff...?'
    TabOrder = 4
  end
end
