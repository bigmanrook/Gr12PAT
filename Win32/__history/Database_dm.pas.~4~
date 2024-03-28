unit Database_dm;

interface

uses
  System.SysUtils, System.Classes, ADODB, DB;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
  procedure DataModuleSetup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    ConP4A : TADOConnection;
    TblP4A : TADOTable;
    dscP4A : TDataSource;


  end;

var
  DataModule1: TDataModule1;




implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DataModuleSetup(Sender: TObject);
begin

 conP4A := TADOConnection.Create( DataModule1 );
 tblP4A := TADOTable.Create( DataModule1 );
 dscP4A := TDataSource.Create( DataModule1 );

 ConP4A.ConnectionString := '';
  //Connect Database
end;

end.
