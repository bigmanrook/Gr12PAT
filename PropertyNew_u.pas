unit PropertyNew_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Property_cls, Database_dm, LoginScreen_u;

type
  TfrmPropertyNew = class(TForm)
    btnEnter: TButton;
    btnReturn: TButton;
    chkbxForSale: TCheckBox;
    chkbxRent: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    dbPropertyView: TDBGrid;
    edtArea: TEdit;
    edtDoC: TLabel;
    edtLocation: TEdit;
    edtPerimeter: TEdit;
    edtValue: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPropertyNew: TfrmPropertyNew;
  UserProperty: TProperty;

implementation

{$R *.dfm}

procedure TfrmPropertyNew.btnEnterClick(Sender: TObject);

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

      sOwner := User.getAcc();
      sProperty_Location := edtLocation.Text;
      TDate_of_Completion := DateTimePicker1.DateTime;
      rProperty_Value := StrtoFloat(edtValue.Text);
      rArea := StrtoFloat(edtArea.Text);
      rPerimeter := StrtoFloat(edtPerimeter.Text);
      bFor_Sale := chkbxForSale.Checked;
      bTo_Let := chkbxRent.Checked;

      qryP4A.Close;
      qryP4A.SQL.Clear;
      qryP4A.SQL.Add('INSERT INTO Properties (Owner, Property_Location, Date_of_Completion, Property_Value, Area, Perimeter, For_Sale, To _Let) VALUES (''' + sOwner + '''), (''' + sProperty_Location + '''), (''' + DatetoStr(TDate_Of_Completion) + '''),(''' + DatetoStr(TDate_Of_Completion) + ''');');
      qryP4A.ExecSQL;
      qryP4A.Open;
       //qryP4A.SQL.Add

    end;
   // SQL insertion


  end;




// qryP4A.SQL.Add();

//  Object filling
// with Property_cls.TProperty do
// begin
//  UserProperty.Create();
// end;



end;

procedure TfrmPropertyNew.FormShow(Sender: TObject);

var
sAccount : String;

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




end;
end;

end.
