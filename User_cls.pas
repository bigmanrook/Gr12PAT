unit User_cls;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Property_cls, Database_dm;

type
  TUser = class(TProperty)

  private
    { Private declarations }
     fAccount : String;
     fUsername : String;
     fPassword : String;
     fNetValue : String;
     fRent : Boolean;
     fAdmin : Boolean;
  public
    { Public declarations }

  arrProperties : array of Integer;
  constructor Create(sAccount, sUsername, sPassword : String ; sNetValue : String ; bRent, bAdmin : Boolean);
  function getName() : string;
  procedure setProfile(sAccount, sUsername, sPassword, bAdmin : String);
  function calculateNet(sAccount : String) : String;

  end;


implementation

{ TUser }

function TUser.calculateNet(sAccount: String): String;
begin
 //Should take property No, and sum all the values of each property corresponding with the account name, MAINMENU
end;

constructor TUser.Create(sAccount, sUsername, sPassword, sNetValue: String;
  bRent, bAdmin: Boolean);
begin
  //Add values LOGIN

     fAccount := sAccount;
     fUsername := sUsername;
     fPassword := sPassword;
     fNetValue := sNetValue;
     fRent := bRent;
     fAdmin := bAdmin;

end;

function TUser.getName: string;
begin
 result := fAccount;
end;


procedure TUser.setProfile(sAccount, sUsername, sPassword, bAdmin: String);
begin
  //LOGIN, used in MAINMENU
end;

end.
