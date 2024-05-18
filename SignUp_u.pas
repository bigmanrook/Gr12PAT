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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
sCode : String;

begin
//if Admin is true, then inputbox a passcode which is determined once by me
  BExists := False;

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
            ShowMessage('This user already exists');

            frmLoginScreen.Visible := True;
            frmSignUp.Visible := False;
            exit
          end;

         if ((edtAccount.Text = TblAcc['Account']) OR (edtAccount.Text = TblAcc['User Alias'])) then
          begin

            BExists := True;

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
          sCode:= InputBox('Enter the code provided by the software admin', 'Enter code', '');

            if sCode = 'Jude@PHA' then
            begin
              TblAcc['Admin'] := btnTrue.Enabled;
            end
            else
            begin
              ShowMessage('Incorrect code');
              exit
            end;

        end;
        TblAcc.Post;
        ShowMessage('Account registered')

      end;


    end;
  end;

end;

procedure TfrmSignUp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

end.
