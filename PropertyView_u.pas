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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPropertyView: TfrmPropertyView;

implementation

{$R *.dfm}

procedure TfrmPropertyView.LoadProperties(Sender: TObject);

var
sAccount : String;

begin
//Use relationships and SQL to load Properties under user account attribute
with Database_dm.DataModule1, LoginScreen_u.frmLoginScreen do
begin

sAccount := User.getName();

qryP4A.SQL.Clear;
qryP4A.Open;
qryP4A.SQL.Add('SELECT Account.Account, Properties.Owner FROM Account INNER JOIN Properties ON Properties.Owner=' + '"' + sAccount + '"' + ' ORDER BY Property Number');
qryP4A.ExecSQL;
qryP4A.Close;

dbPropertyView.DataSource := dscAcc;




end;
end;

end.
