unit Database_dm;

interface

uses
  System.SysUtils, System.Classes, ADODB, DB;

type
  TDataModule1 = class(TDataModule)
  procedure DataModuleSetup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    ConP4A : TADOConnection;
    TblAcc : TADOTable;
    TblProperties : TADOTable;
    qryP4A : TADOQuery;
    dscAcc : TDataSource;
    dscProperties : TDataSource;


  end;

var
  DataModule1: TDataModule1;




implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DataModuleSetup(Sender: TObject);
begin

 conP4A := TADOConnection.Create( DataModule1 );
 tblAcc := TADOTable.Create( DataModule1 );
 dscAcc := TDataSource.Create( DataModule1 );
 tblProperties := TADOTable.Create( DataModule1 );
 qryP4A := TADOQuery.Create(DataModule1);

 ConP4A.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Properties4All.mdb;Persist Security Info=False';
 ConP4A.LoginPrompt := False;
 ConP4A.Open;

 tblAcc.Connection := conP4A;
 tblAcc.TableName := 'Account';
 dscAcc.DataSet := tblAcc;
 tblProperties.Connection := conP4A;
 tblProperties.TableName := 'Properties';
 dscProperties.DataSet := tblAcc;
 qryP4A.DataSource := dscAcc;

 tblAcc.Open;
 tblProperties.Open;

end;

end.
