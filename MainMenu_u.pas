unit MainMenu_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, LoginScreen_u, system.Math, jpeg,
  Vcl.Imaging.pngimage, User_cls, Property_cls, PropertyView_u, PropertyEdit_u, PropertyNew_u, Database_dm;

type
  TfrmMainMenu = class(TForm)
    btnHelp: TButton;
    btnReturn: TButton;
    imgProfile: TImage;
    lblUsername: TLabel;
    lblAccountMM: TLabel;
    btnViewProperties: TButton;
    btnAddProperty: TSpeedButton;
    btnEditProperties: TButton;
    btnProperties: TButton;
    imgFrontal: TImage;
    imgKitchen: TImage;
    imgBedroom: TImage;
    imgBathroom: TImage;
    lblPFP: TLabel;
    procedure btnPropertiesClick(Sender: TObject);
    procedure btnViewPropertiesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditPropertiesClick(Sender: TObject);
    procedure btnAddPropertyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReturnClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainMenu: TfrmMainMenu;
//  arrBathrooms : array of TImage;
//  arrBedrooms : array of TImage;
//  arrKitchens : array of TImage;
//  arrFrontals : array of TImage;
//  arrFolder : array of String;
  sBathroom, sBedroom, sFrontal, sKitchen : String;
  I, J : Integer;
  tFile : TextFile;

implementation

{$R *.dfm}

procedure TfrmMainMenu.btnAddPropertyClick(Sender: TObject);
begin
frmMainMenu.Visible := False;

frmPropertyNew.Visible := True;

end;

procedure TfrmMainMenu.btnEditPropertiesClick(Sender: TObject);
begin
 with LoginScreen_u.frmLoginScreen, PropertyEdit_u.frmPropertyEdit do
    begin

    frmMainMenu.Visible := False;
    frmPropertyEdit.Visible := True;

    end;

end;

procedure TfrmMainMenu.btnHelpClick(Sender: TObject);

var
sLine, sString: String;

begin

  if NOT FileExists('Help.txt') then
    begin
      Rewrite(tFile, 'Help.txt');
    end
    else
    begin
      Assignfile(tFile, 'Help.txt');
      while NOT EOF(tFile) do
        begin
          Readln(tFile, sLine);
          sString := sString + #13#10 + sLine;
        end;
    end;

   ShowMessage(sString);


end;

procedure TfrmMainMenu.btnPropertiesClick(Sender: TObject);

var
  iCount, k : Integer;
  sAccount : String;
  arrPropNo : array of integer;
begin

//Add Form for Profile only, net property value, places renting out, perhaps a list of those renting out to, earnings annually
//Loop through textfile
iCount := 0;
AssignFile(tFile, 'Houses Dataset INFO/HousesInfo.txt');
Reset(tFile);
//ShowMessage('File Assigned');

 iCount := 535;



    I := RandomRange(1, iCount);


    with LoginScreen_u.frmLoginScreen, Property_cls.TProperty, Database_dm.DataModule1 do
    begin
    iCount := 0;
    sAccount := User.getAcc();
    //SHowmessage(sAccount);

    qryP4A.Close;
    qryP4A.SQL.Clear;
    qryP4A.SQL.Add('SELECT * FROM Properties as P WHERE P.Owner = ''' + sAccount + '''');
    qryP4A.ExecSQL;
    qryP4A.Open;


       while not qryP4A.Eof do
          begin
            iCount := iCount + 1;
            qryP4A.Next;
          end;
       SetLength(arrPropNo, iCount);
       qryP4A.First;
       for k := 1 to High(arrPropNo) do

          begin
            arrPropNo[k] := qryP4A['Property_Number'];
            qryP4A.Next;
          end;


    end;


    if J = 0 then
     begin
      J := arrPropNo[RandomRange(1, Length(arrPropNo))];
     end;




    if J <> I  then
    begin

      if btnProperties.Caption = 'View your properties/property'  then
      begin

           sBathroom := 'Houses Dataset/' + inttostr(J) + '_bathroom.jpg';
         if FileExists(sBathroom) then
         begin
          imgBathroom.Picture.LoadFromFile(sBathroom);
         end;

         sBedroom := 'Houses Dataset/' + inttostr(J) + '_bedroom.jpg';
         if FileExists(sBedroom) then
         begin
          imgBedroom.Picture.LoadFromFile(sBedroom);
         end;

         sKitchen := 'Houses Dataset/' + inttostr(J) + '_kitchen.jpg';
         if FileExists(sKitchen) then
         begin
         imgKitchen.Picture.LoadFromFile(sKitchen);
         end;

         sFrontal := 'Houses Dataset/' + inttostr(J) + '_frontal.jpg';
         if FileExists(sFrontal) then
         begin
          imgFrontal.Picture.LoadFromFile(sFrontal);
          //ShowMessage('images loaded');
         end;

       btnProperties.Caption := 'View available properties';
      end;

      if btnProperties.Caption = 'View available properties'  then
     begin

       sBathroom := 'Houses Dataset/' + inttostr(I) + '_bathroom.jpg';
       if FileExists(sBathroom) then
       begin
        imgBathroom.Picture.LoadFromFile(sBathroom);
       end;

       sBedroom := 'Houses Dataset/' + inttostr(I) + '_bedroom.jpg';
       if FileExists(sBedroom) then
       begin
        imgBedroom.Picture.LoadFromFile(sBedroom);
       end;

       sKitchen := 'Houses Dataset/' + inttostr(I) + '_kitchen.jpg';
       if FileExists(sKitchen) then
       begin
       imgKitchen.Picture.LoadFromFile(sKitchen);
       end;

       sFrontal := 'Houses Dataset/' + inttostr(I) + '_frontal.jpg';
       if FileExists(sFrontal) then
       begin
        imgFrontal.Picture.LoadFromFile(sFrontal);
       end;

     btnProperties.Caption := 'View your properties/property';
     end;

     end
   else
    begin
       I := RandomRange(1, strtoint(floattostr(iCount)));
    end;


    end;







procedure TfrmMainMenu.btnReturnClick(Sender: TObject);
begin

   with LoginScreen_u.frmLoginScreen do
    begin

    frmMainMenu.Visible := False;
    frmLoginScreen.Visible := True;

    end;

end;

procedure TfrmMainMenu.btnViewPropertiesClick(Sender: TObject);
begin
 with LoginScreen_u.frmLoginScreen do
    begin

    frmMainMenu.Visible := False;
    frmPropertyView.Visible := True;

    end;



end;
procedure TfrmMainMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TfrmMainMenu.FormShow(Sender: TObject);
begin
     with LoginScreen_u.frmLoginScreen do
    begin
    lblPFP.Caption := User.getInit;
    lblAccountMM.Caption := User.getAcc;
    lblUsername.Caption := User.getUsername;
    end;
end;

end.
