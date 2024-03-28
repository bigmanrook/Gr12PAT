unit LoginScreen_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Database_dm, SignUp_u, User_cls;

type
  TfrmLoginScreen = class(TForm)
    btnLogin: TButton;
    edtAccount: TEdit;
    lblAccount: TLabel;
    edtPassword: TEdit;
    lblPassword: TLabel;
    btnSignup: TButton;
    btnResetPassword: TButton;
    procedure btnLoginClick(Sender: TObject);
    procedure btnSignupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    sPassword, sUserAcc : String;
    User : TUser;
  end;

var
  frmLoginScreen: TfrmLoginScreen;


implementation

uses MainMenu_u ;

{$R *.dfm}

procedure TfrmLoginScreen.btnLoginClick(Sender: TObject);
var
bLogin : boolean;
sMissing : String;
begin
  bLogin := False;
 with Database_dm.DataModule1 do
  begin
  if (edtAccount.Text = '') OR (edtPassword.Text = '') then
    begin
      ShowMessage('Please enter in valid details')
    end
    else
    begin
      while NOT TblAcc.Eof do
        begin

         if BLogin = True then
          begin
            exit
          end;

         if ((edtAccount.Text = TblAcc['Account']) OR (edtAccount.Text = TblAcc['User Alias'])) AND (edtPassword.Text = tblAcc['Password']) then
          begin
            if edtAccount.Text = TblAcc['Account'] then
              begin

                sMissing := tblAcc['User Alias'];
                User := TUser.Create(sUserAcc, sMissing, sPassword, tblAcc['Property No'], tblAcc['Net Value'], tblAcc['Renting']);
                BLogin := true;
                frmLoginScreen.Visible := False;
                frmMainMenu.Visible := True;
                //Make object attributes equal to their corresponding variables, to create a User object, or even assign everything to an string array and then convert to respective values...
               end;
            if edtAccount.Text = TblAcc['User Alias'] then
              begin

                sMissing := tblAcc['Account'];
                User := TUser.Create(sMissing, sUserAcc, sPassword, tblAcc['Property No'], tblAcc['Net Value'], tblAcc['Renting']);
                BLogin := true;
                frmLoginScreen.Visible := False;
                frmMainMenu.Visible := True;


              end;

          end
          else
          begin

           tblAcc.Next;

          end;

        end;



     if BLogin = false then
      begin
        ShowMessage('Perhaps you have not registered with us? Or your details are incorrect');
      end;


    end;
  end;

end;

procedure TfrmLoginScreen.btnSignupClick(Sender: TObject);
begin
frmLoginScreen.Visible := False;
frmSignUp.Visible := True;
end;

end.
