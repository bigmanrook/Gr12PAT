unit PropertyView_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Database_dm,
  Vcl.Grids, Vcl.StdCtrls, User_cls, Vcl.DBGrids, LoginScreen_u;

type
  TfrmPropertyView = class(TForm)
    btnReturn: TButton;
    dbPropertyView: TDBGrid;
    procedure LoadProperties(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPropertyView: TfrmPropertyView;

implementation

{$R *.dfm}

procedure TfrmPropertyView.btnReturnClick(Sender: TObject);
begin
frmPropertyView.Visible := False;
frmLoginScreen.Visible := True;
end;

procedure TfrmPropertyView.LoadProperties(Sender: TObject);

var
sAccount : String;

begin
//Use relationships and SQL to load Properties under user account attribute
with Database_dm.DataModule1, LoginScreen_u.frmLoginScreen do
begin

sAccount := User.getName();

qryP4A.DataSource := dscAcc;

qryP4A.SQL.Clear;
qryP4A.Open;
qryP4A.SQL.Add('SELECT Account.Account, Properties.Owner, Properties.PropertyNo FROM Account, Properties WHERE Account.Account = ''' + sAccount + ''' AND Account.Account = Properties.Owner ORDER BY Properties.PropertyNumber');


qryP4A.ExecSQL;
qryP4A.Close;






end;
end;

end.
