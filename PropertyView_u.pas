unit PropertyView_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Database_dm,
  Vcl.Grids, Vcl.StdCtrls, User_cls, Vcl.DBGrids, LoginScreen_u;

type
  TfrmPropertyView = class(TForm)
    btnReturn: TButton;
    dbPropertyView: TDBGrid;
    procedure LoadProperties(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPropertyView: TfrmPropertyView;

implementation

uses MainMenu_u;

{$R *.dfm}

procedure TfrmPropertyView.btnReturnClick(Sender: TObject);
begin
  frmPropertyView.Visible := False;
  with MainMenu_u.frmMainMenu do
  frmMainMenu.Visible := True;
end;

procedure TfrmPropertyView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TfrmPropertyView.LoadProperties(Sender: TObject);

var
  sAccount: String;

begin
  // Use relationships and SQL to load Properties under user account attribute
  with Database_dm.DataModule1, LoginScreen_u.frmLoginScreen do
  begin

    sAccount := User.getAcc();
    //SHowmessage(sAccount);

    qryP4A.Close;
    qryP4A.SQL.Clear;
    qryP4A.SQL.Add('SELECT * FROM Properties as P WHERE P.Owner = ''' + sAccount + '''');
    //qryP4A.SQL.add('SELECT * FROM Account');     WHERE P.Owner = ''' + sAccount + '''
    qryP4A.ExecSQL;
    qryP4A.Open;

    dbPropertyView.DataSource := SQLDatasource;

  end;
end;

end.
