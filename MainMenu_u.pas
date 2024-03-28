unit MainMenu_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, LoginScreen_u, system.Math, jpeg,
  Vcl.Imaging.pngimage;

type
  TfrmMainMenu = class(TForm)
    btnHelp: TButton;
    btnReturn: TButton;
    imgProfile: TImage;
    lblUsername: TLabel;
    lblAccount: TLabel;
    lblUser: TLabel;
    btnViewProperties: TButton;
    btnAddProperty: TSpeedButton;
    btnEditProperties: TButton;
    btnProperties: TButton;
    imgFrontal: TImage;
    imgKitchen: TImage;
    imgBedroom: TImage;
    imgBathroom: TImage;
    Label1: TLabel;
    procedure btnPropertiesClick(Sender: TObject);
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

procedure TfrmMainMenu.btnPropertiesClick(Sender: TObject);

var
  iCount : Real;
begin

//Add Form for Profile only, net property value, places renting out, perhaps a list of those renting out to, earnings annually
//Loop through textfile
iCount := 0;
AssignFile(tFile, 'Houses Dataset INFO/HousesInfo.txt');
Reset(tFile);
ShowMessage('File Assigned');

 iCount := 535;

  ShowMessage('iCount established');

    I := RandomRange(1, strtoint(floattostr(iCount)));
    J := RandomRange(1, strtoint(floattostr(iCount)));


    if J <> I  then
    begin

   if btnProperties.Caption= 'View available properties'  then
    begin

     btnProperties.Caption := 'View your properties/property';

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
        ShowMessage('images loaded');
       end;

    end
   else

      btnProperties.Caption := 'View available properties';

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
      ShowMessage('images loaded');
     end;

   end
   else
    begin
       J := RandomRange(1, strtoint(floattostr(iCount)));
    end;
end;


end.
