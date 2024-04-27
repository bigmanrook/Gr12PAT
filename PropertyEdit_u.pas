unit PropertyEdit_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Database_dm, LoginScreen_u, Vcl.ComCtrls, Property_cls;

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
    btnDelete: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPropertyEdit: TfrmPropertyEdit;

implementation

{$R *.dfm}

procedure TfrmPropertyEdit.btnEnterClick(Sender: TObject);
var
sOwner, sProperty_Location  : String;
TDate_of_Completion : TDateTime;
rProperty_Value, rArea, rPerimeter : Real;
bFor_Sale, bTo_Let : boolean;

begin


 if (edtArea.Text = '') OR (edtDoC.Caption = '') OR (edtLocation.Text = '') OR (edtValue.Text = '') OR (edtPerimeter.Text = '') OR (edtValue.Text = '') then
  begin
    ShowMessage('Please fill out all empty text fields');
  end
  else
  begin
   with Database_dm.DataModule1, LoginScreen_u.frmLoginScreen do
    begin
      // SQL insertion
      sOwner := User.getAcc();
      sProperty_Location := edtLocation.Text;
      TDate_of_Completion := DateTimePicker1.DateTime;
      rProperty_Value := StrtoFloat(edtValue.Text);
      rArea := StrtoFloat(edtArea.Text);
      rPerimeter := StrtoFloat(edtPerimeter.Text);
      bFor_Sale := chkbxForSale.Checked;
      bTo_Let := chkbxRent.Checked;

      qryP4A.SQL.Clear;
      qryP4A.SQL.Add('UPDATE Properties');
      qryP4A.SQL.Add('(Owner, Property_Location, Date_of_Completion, Property_Value, Area, Perimeter, For_Sale, To_Let)');
      qryP4A.SQL.Add('VALUES (:Owner, :Property_Location, :Date_of_Completion, :Property_Value, :Area, :Perimeter, :For_Sale, :To_Let)');
      qryP4A.Parameters.ParamByName('Owner').Value := sOwner;
      qryP4A.Parameters.ParamByName('Property_Location').Value := sProperty_Location;
      qryP4A.Parameters.ParamByName('Date_of_Completion').Value := TDate_Of_Completion;
      qryP4A.Parameters.ParamByName('Property_Value').Value := rProperty_Value;
      qryP4A.Parameters.ParamByName('Area').Value := rArea;
      qryP4A.Parameters.ParamByName('Perimeter').Value := rPerimeter;
      qryP4A.Parameters.ParamByName('For_Sale').Value := bFor_Sale;
      qryP4A.Parameters.ParamByName('To_Let').Value := bTo_Let;
      qryP4A.ExecSQL;
      qryP4A.SQL.Clear;
      qryP4A.SQL.Add('SELECT * FROM Properties WHERE Owner=(:Owner) ');
      qryP4A.Parameters.ParamByName('Owner').Value := sOwner;
      qryP4A.Open;



    end;
  end;
end;

procedure TfrmPropertyEdit.FormShow(Sender: TObject);

var
sAccount : String;
iRecords, I : Integer;
UserProperty : TProperty;

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
