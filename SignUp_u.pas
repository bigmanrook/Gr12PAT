unit SignUp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Database_dm;

type
  TfrmSignUp = class(TForm)
    btnSignup: TButton;
    edtAccount: TEdit;
    edtName: TEdit;
    edtPassword: TEdit;
    lblAccount: TLabel;
    lblPassword: TLabel;
    lblUserName: TLabel;
    lblUserType: TLabel;
    btnTrue: TCheckBox;
    procedure btnSignupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignUp: TfrmSignUp;

implementation

uses LoginScreen_u ;

{$R *.dfm}

procedure TfrmSignUp.btnSignupClick(Sender: TObject);

var
BExists : Boolean ;

begin
//if Admin is true, then inputbox a passcode which is determined once by me


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

         if BExists = True then
          begin
            ShowMessage('This user already exists')
          end;

         if ((edtAccount.Text = TblAcc['Account']) OR (edtAccount.Text = TblAcc['User Alias'])) AND (edtPassword.Text = 'Password') then
          begin

            BExists := True;
            frmLoginScreen.Visible := True;
            frmSignUp.Visible := True;

          end
          else
          begin

           tblAcc.Next;

          end;

        end;

     if BExists = false then
      begin
        TblAcc.Edit;
        TblAcc.Append;
        TblAcc['Account'] := edtAccount.Text;
        TblAcc['User Alias'] := edtName.Text;
        TblAcc['Password'] := edtPassword.Text;
        if btnTrue.Enabled then
        begin
          btnTrue.Caption := 'True';
          TblAcc['Admin'] := True;
        end;
        TblAcc.Post;

      end;


    end;
  end;

end;

end.
