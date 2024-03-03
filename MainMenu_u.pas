unit MainMenu_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

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
    procedure OnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainMenu: TfrmMainMenu;

implementation

{$R *.dfm}

procedure TfrmMainMenu.OnClick(Sender: TObject);
begin
//Add Form for Profile only, net property value, places renting out, perhaps a list of those renting out to, earnings annually
end;

end.
