program Properties4all;

uses
  Vcl.Forms,
  LoginScreen_u in 'LoginScreen_u.pas' {fLoginScreen};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfLoginScreen, fLoginScreen);
  Application.Run;
end.
