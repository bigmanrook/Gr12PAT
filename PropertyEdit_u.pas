unit PropertyEdit_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Database_dm, LoginScreen_u, Vcl.ComCtrls;

type
  TfrmPropertyEdit = class(TForm)
    dbPropertyView: TDBGrid;
    btnReturn: TButton;
    btnEnter: TButton;
    edtLocation: TEdit;
    DateTimePicker1: TDateTimePicker;
    edtValue: TEdit;
    edtArea: TEdit;
    edtPerimeter: TEdit;
    chkbxForSale: TCheckBox;
    chkbxRent: TCheckBox;
    cmbID: TComboBox;
    edtDoC: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPropertyEdit: TfrmPropertyEdit;

implementation

{$R *.dfm}

procedure TfrmPropertyEdit.FormShow(Sender: TObject);

var
sAccount : String;
iRecords, I : Integer;

begin
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
    //Add the Property numbers to the combolist
    //iRecords := ;       How to get the number of records in table, and then for each row get the Property No ?



       while not qryP4A.Eof do
  begin
    cmbID.Items.Add(qryP4A['Property_Number']);
    qryP4A.Next;
  end;


end;
end;

end.
