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
    edtValue: TEdit;
    chkbxForSale: TCheckBox;
    chkbxRent: TCheckBox;
    cmbID: TComboBox;
    btnDelete: TButton;
    btnUpdateValue: TButton;
    btnUpdate: TButton;
    btnUpdateValues: TButton;
    edtPerimeter: TEdit;
    edtArea: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnUpdateValueClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReturnClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnUpdateValuesClick(Sender: TObject);
    procedure ErasePerimeter(Sender: TObject);
    procedure EraseArea(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPropertyEdit: TfrmPropertyEdit;

implementation

uses MainMenu_u;

{$R *.dfm}

procedure TfrmPropertyEdit.btnDeleteClick(Sender: TObject);

var
sOwner : String;

begin
  with Database_dm.DataModule1, LoginScreen_u.frmLoginScreen do

      begin

        sOwner := User.getAcc();

        qryP4A.SQL.Clear;
        qryP4A.SQL.Add('UPDATE Properties');
        qryP4A.ExecSQL;
        qryP4A.SQL.Clear;
        qryP4A.SQL.Add('SELECT * FROM Properties WHERE Owner=(:Owner) ');
        qryP4A.Parameters.ParamByName('Owner').Value := sOwner;
        qryP4A.Open;
      end;
end;

procedure TfrmPropertyEdit.btnReturnClick(Sender: TObject);
begin
  frmPropertyEdit.Visible := False;
  with MainMenu_u.frmMainMenu do
  frmMainMenu.Visible := True;
end;

procedure TfrmPropertyEdit.btnUpdateClick(Sender: TObject);
var
sOwner, sPropertyID  : String;
rProperty_Value : Real;
bFor_Sale, bTo_Let : boolean;

begin



      with Database_dm.DataModule1, LoginScreen_u.frmLoginScreen do
    begin
      // SQL insertion
      sOwner := User.getAcc();
      sPropertyID := cmbID.Text;
      bFor_Sale := chkbxForSale.Checked;
      bTo_Let := chkbxRent.Checked;


      qryP4A.SQL.Clear;
      qryP4A.SQL.Add('UPDATE Properties');
      qryP4A.SQL.Add('SET Owner=(:Owner), For_Sale=(:For_Sale), To_Let=(:To_Let)');
      qryP4A.SQL.Add('WHERE Property_Number= (:Property_Number)');
      qryP4A.Parameters.ParamByName('Property_Number').Value := sPropertyID;
      qryP4A.Parameters.ParamByName('Owner').Value := sOwner;
      qryP4A.Parameters.ParamByName('For_Sale').Value := bFor_Sale;
      qryP4A.Parameters.ParamByName('To_Let').Value := bTo_Let;


      qryP4A.ExecSQL;
      qryP4A.SQL.Clear;
      qryP4A.SQL.Add('SELECT * FROM Properties WHERE Owner=(:Owner) ');
      qryP4A.Parameters.ParamByName('Owner').Value := sOwner;
      qryP4A.Open;



    end;

end;

procedure TfrmPropertyEdit.btnUpdateValueClick(Sender: TObject);
var
sOwner, sProperty_Location, sID  : String;
TDate_of_Completion : TDateTime;
rProperty_Value, rArea, rPerimeter : Real;
bFor_Sale, bTo_Let : boolean;

begin


 if (edtValue.Text = '') then
  begin
    ShowMessage('Please fill out all empty text fields');
  end
  else
  begin
   with Database_dm.DataModule1, LoginScreen_u.frmLoginScreen do
    begin
      // SQL insertion
      sOwner := User.getAcc();
      rProperty_Value := StrtoFloat(edtValue.Text);

      qryP4A.SQL.Clear;
      qryP4A.SQL.Add('UPDATE Properties');
      qryP4A.SQL.Add('SET Owner=(:Owner), Property_Value=(:Property_Value)');
      qryP4A.SQL.Add('WHERE Property_Number= (:Property_Number)');
      qryP4A.Parameters.ParamByName('Property_Number').Value := cmbID.Text;
      qryP4A.Parameters.ParamByName('Owner').Value := sOwner;
      qryP4A.Parameters.ParamByName('Property_Value').Value := rProperty_Value;

      qryP4A.ExecSQL;
      qryP4A.SQL.Clear;
      qryP4A.SQL.Add('SELECT * FROM Properties WHERE Owner=(:Owner) ');
      qryP4A.Parameters.ParamByName('Owner').Value := sOwner;
      qryP4A.Open;



    end;
  end;
end;

procedure TfrmPropertyEdit.btnUpdateValuesClick(Sender: TObject);

var
rArea, rPerimeter : Real;
sOwner : String;

begin

    if (edtArea.Text = '') OR (edtPerimeter.Text = '') then
  begin
    ShowMessage('Please fill out all empty text fields');
  end
  else
  begin
   with Database_dm.DataModule1, LoginScreen_u.frmLoginScreen do
    begin
      // SQL insertion
      sOwner := User.getAcc();
      rPerimeter := StrtoFloat(edtPerimeter.Text);
      rArea := StrtoFloat(edtArea.Text);

      qryP4A.SQL.Clear;
      qryP4A.SQL.Add('UPDATE Properties');
      qryP4A.SQL.Add('SET Owner=(:Owner), Property_Value=(:Property_Value), Area=(:Area), Perimeter=(:Perimeter)');
      qryP4A.SQL.Add('WHERE Property_Number= (:Property_Number)');
      qryP4A.Parameters.ParamByName('Property_Number').Value := cmbID.Text;
      qryP4A.Parameters.ParamByName('Owner').Value := sOwner;
      qryP4A.Parameters.ParamByName('Perimeter').Value := rPerimeter;
      qryP4A.Parameters.ParamByName('Area').Value := rArea;


      qryP4A.ExecSQL;
      qryP4A.SQL.Clear;
      qryP4A.SQL.Add('SELECT * FROM Properties WHERE Owner=(:Owner) ');
      qryP4A.Parameters.ParamByName('Owner').Value := sOwner;
      qryP4A.Open;



    end;
  end;

end;

procedure TfrmPropertyEdit.EraseArea(Sender: TObject);
begin
edtArea.Text := '';
end;

procedure TfrmPropertyEdit.ErasePerimeter(Sender: TObject);
begin
edtPerimeter.Text := '';
end;

procedure TfrmPropertyEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
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
    qryP4A.ExecSQL;
    qryP4A.Open;

    dbPropertyView.DataSource := SQLDatasource;



       while not qryP4A.Eof do
  begin
    cmbID.Items.Add(qryP4A['Property_Number']);
    qryP4A.Next;
  end;

 //Change item width

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
