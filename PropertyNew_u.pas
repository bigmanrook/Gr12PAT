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
    procedure FormShow(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReturnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPropertyNew: TfrmPropertyNew;
  UserProperty: TProperty;

implementation

uses MainMenu_u;

{$R *.dfm}

procedure TfrmPropertyNew.btnEnterClick(Sender: TObject);

var
sOwner, sProperty_Location  : String;
TDate_of_Completion : TDateTime;
rProperty_Value, rArea, rPerimeter : Real;
bFor_Sale, bTo_Let : boolean;
iPropNo : Integer;

begin


 if (edtArea.Text = '') OR (edtDoC.Caption = '') OR (edtLocation.Text = '') OR (edtPerimeter.Text = '')  then
  begin
    ShowMessage('Please fill out all empty text fields');
  end
  else
  begin
   with Database_dm.DataModule1, LoginScreen_u.frmLoginScreen, Property_cls.TProperty do
    begin
      // SQL insertion
      sOwner := User.getAcc();
      sProperty_Location := edtLocation.Text;
      TDate_of_Completion := DateTimePicker1.DateTime;
      rArea := StrtoFloat(edtArea.Text);
      rProperty_Value := 0;
      rPerimeter := StrtoFloat(edtPerimeter.Text);
      bFor_Sale := chkbxForSale.Checked;
      bTo_Let := chkbxRent.Checked;


      qryP4A.SQL.Clear;
      qryP4A.SQL.Add('INSERT INTO Properties');
      qryP4A.SQL.Add('(Owner, Property_Location, Date_of_Completion, Property_Value, Area, Perimeter, For_Sale, To_Let)');
      qryP4A.SQL.Add('VALUES (:Owner, :Property_Location, :Date_of_Completion, :Property_Value, :Area, :Perimeter, :For_Sale, :To_Let)');
      qryP4A.Parameters.ParamByName('Owner').Value := sOwner;
      qryP4A.Parameters.ParamByName('Property_Location').Value := sProperty_Location;
      qryP4A.Parameters.ParamByName('Date_of_Completion').Value := Datetostr(TDate_Of_Completion);
      qryP4A.Parameters.ParamByName('Property_Value').Value := floattostr(rProperty_Value);
      qryP4A.Parameters.ParamByName('Area').Value := floattostr(rArea);
      qryP4A.Parameters.ParamByName('Perimeter').Value := floattostr(rPerimeter);
      qryP4A.Parameters.ParamByName('For_Sale').Value := booltostr(bFor_Sale);
      qryP4A.Parameters.ParamByName('To_Let').Value := booltostr(bTo_Let);
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

      iPropNo := tblProperties['Property_Number'];
      UserProperty := TProperty.Create(iPropNo,sOwner, sProperty_Location, TDate_Of_Completion, floattostr(rProperty_Value), rArea, rPerimeter, bFor_Sale, bTo_Let);

      rProperty_Value := strtofloat(UserProperty.calculateValue(rArea));





    end;



  end;



end;

procedure TfrmPropertyNew.btnReturnClick(Sender: TObject);
begin
  frmPropertyNew.Visible := False;

  with MainMenu_u.frmMainMenu do
  frmMainMenu.Visible := True;
end;

procedure TfrmPropertyNew.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
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

  dbPropertyView.Columns[0].Width := 50;
  dbPropertyView.Columns[1].Width := 150;
  dbPropertyView.Columns[2].Width := 100;
  dbPropertyView.Columns[3].Width := 100;
  dbPropertyView.Columns[4].Width := 50;
  dbPropertyView.Columns[5].Width := 50;
  dbPropertyView.Columns[6].Width := 50;
  dbPropertyView.Columns[7].Width := 50;


end;
end;

end.
