unit MainMenu_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, LoginScreen_u;

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
    imglsProperties: TImageList;
    btnProperties: TButton;
    procedure btnPropertiesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainMenu: TfrmMainMenu;
  arrBathrooms : array of TImage;
  arrBedrooms : array of TImage;
  arrKitchens : array of TImage;
  arrFrontal : array of TImage;
  arrFolder : array of String;
  sBathroom, sBedroom, sFrontal, sKitchen : String;
  tFile : TextFile;

implementation

{$R *.dfm}

procedure TfrmMainMenu.btnPropertiesClick(Sender: TObject);

var
  I, iCount: Integer;

begin

//Add Form for Profile only, net property value, places renting out, perhaps a list of those renting out to, earnings annually
//Loop through textfile
iCount := 0;
AssignFile(tFile, 'Debug/Houses Dataset INFO/HousesInfo.txt');
Reset(tFile);
ShowMessage('File Assigned');


  while NOT EOF(tFile) do
    begin
      inc(iCount);
    end;


 for I := 1 to iCount do
  begin

   sBathroom := 'Houses-dataset\Houses Dataset\ ' + inttostr(I) + '_bathroom.jpg';
   if FileExists(sBathroom) then
   begin
     arrBathrooms[I].Picture.LoadFromFile(sBathroom);
   end;

   sBedroom := 'Houses-dataset\Houses Dataset\ ' + inttostr(I) + '_bedroom.jpg';
   if FileExists(sBedroom) then
   begin
     arrBathrooms[I].Picture.LoadFromFile(sBedroom);
   end;

   sKitchen := 'Houses-dataset\Houses Dataset\ ' + inttostr(I) + '_kitchen.jpg';
   if FileExists(sKitchen) then
   begin
     arrBathrooms[I].Picture.LoadFromFile(sKitchen);
   end;

   sFrontal := 'Houses-dataset\Houses Dataset\ ' + inttostr(I) + '_frontal.jpg';
   if FileExists(sFrontal) then
   begin
     arrBathrooms[I].Picture.LoadFromFile(sFrontal);
   end;


  ShowMessage('Arrays populated');


end;
end;

end.
