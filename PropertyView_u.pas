unit PropertyView_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Database_dm,
  Vcl.Grids, Vcl.StdCtrls, User_cls, Vcl.DBGrids, LoginScreen_u, Vcl.ComCtrls,
  Property_cls;

type
  TfrmPropertyView = class(TForm)
    btnReturn: TButton;
    dbPropertyView: TDBGrid;
    btnSummarize: TButton;
    redSummary: TRichEdit;
    cmbID: TComboBox;
    btnSortLocations: TButton;
    procedure LoadProperties(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSummarizeClick(Sender: TObject);
    procedure btnSortLocationsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPropertyView: TfrmPropertyView;
  PropertyObj: TProperty;
  sAccount: String;

implementation

uses MainMenu_u;

{$R *.dfm}

procedure TfrmPropertyView.btnReturnClick(Sender: TObject);
begin
  frmPropertyView.Visible := False;
  with MainMenu_u.frmMainMenu do
    frmMainMenu.Visible := True;
end;

procedure TfrmPropertyView.btnSortLocationsClick(Sender: TObject);
begin
  with Database_dm.DataModule1, LoginScreen_u.frmLoginScreen do
  begin

    sAccount := User.getAcc();

    qryP4A.Close;
    qryP4A.SQL.Clear;
    qryP4A.SQL.Add('SELECT * FROM Properties as P WHERE P.Owner = ''' + sAccount
      + ''' ORDER BY Property_Location ASC');
    qryP4A.ExecSQL;
    qryP4A.Open;

    dbPropertyView.DataSource := SQLDatasource;
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

procedure TfrmPropertyView.btnSummarizeClick(Sender: TObject);

var
  bRent, bSale: Boolean;
  rArea, rPerimeter: Real;
  sLocation, sAccount, sValue: String;
  TCompleteDate: TDateTime;
  iPropNo: Integer;

begin
  // For loop, value, area, Location, Rent & Buy status

  with Database_dm.DataModule1, LoginScreen_u.frmLoginScreen do
  begin

    While not tblProperties.Eof do
    begin

      if tblProperties['Property_Number'] = cmbID.Text then
      begin
        iPropNo := tblProperties['Property_Number'];
        sLocation := tblProperties['Property_Location'];
        rArea := StrtoFloat(tblProperties['Area']);
        rPerimeter := StrtoFloat(tblProperties['Perimeter']);
        sValue := tblProperties['Property_Value'];
        bRent := tblProperties['To_Let'];
        bSale := tblProperties['For_Sale'];
        sAccount := User.getAcc();
        TCompleteDate := tblProperties['Date_Of_Completion'];

        PropertyObj := TProperty.Create(iPropNo, sAccount, sLocation,
          TCompleteDate, sValue, rArea, rPerimeter, bSale, bRent);

        redSummary.Lines.Add(PropertyObj.ToString);
      end;

      tblProperties.Next;

    end;

  end;

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

    qryP4A.Close;
    qryP4A.SQL.Clear;
    qryP4A.SQL.Add('SELECT * FROM Properties as P WHERE P.Owner = ''' +
      sAccount + '''');
    qryP4A.ExecSQL;
    qryP4A.Open;

    while not qryP4A.Eof do
    begin
      cmbID.Items.Add(qryP4A['Property_Number']);
      qryP4A.Next;
    end;

    dbPropertyView.DataSource := SQLDatasource;
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
