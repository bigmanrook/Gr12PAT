program Properties4all;

uses
  Vcl.Forms,
  LoginScreen_u in 'LoginScreen_u.pas' {fLoginScreen},
  MainMenu_u in 'MainMenu_u.pas' {frmMainMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfLoginScreen, fLoginScreen);
  Application.CreateForm(TfrmMainMenu, frmMainMenu);
  Application.Run;
end.
