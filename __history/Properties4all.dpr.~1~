program Properties4all;

uses
  Vcl.Forms,
  LoginScreen_u in 'LoginScreen_u.pas' {frmLoginScreen},
  MainMenu_u in 'MainMenu_u.pas' {frmMainMenu},
  Database_dm in 'Database_dm.pas' {DataModule1: TDataModule},
  Property_cls in 'Property_cls.pas',
  User_cls in 'User_cls.pas',
  SignUp_u in 'SignUp_u.pas' {frmSignUp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLoginScreen, frmLoginScreen);
  Application.CreateForm(TfrmMainMenu, frmMainMenu);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmSignUp, frmSignUp);
  Application.Run;
end.
