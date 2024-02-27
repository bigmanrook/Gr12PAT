unit LoginScreen_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfLoginScreen = class(TForm)
    btnLogin: TButton;
    edtName: TEdit;
    lblUserName: TLabel;
    edtAccount: TEdit;
    lblAccount: TLabel;
    edtPassword: TEdit;
    lblPassword: TLabel;
    btnSignup: TButton;
    btnResetPassword: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLoginScreen: TfLoginScreen;

implementation

{$R *.dfm}

end.
