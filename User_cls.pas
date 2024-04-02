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
  procedure getProperties(sAccount : String);
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

procedure TUser.getProperties(sAccount: String);

var
iProperties : Integer;

begin
  //Find all properties under account name, MAINMENU
 with DataModule1.TblAcc , DataModule1.TblProperties do
   begin

      iProperties := 0;

       while NOT DataModule1.TblProperties.EOF do
      begin

        if DataModule1.tblProperties['Owner'] = DataModule1.tblAcc['User Alias'] then
          begin

            inc(iProperties);
            arrProperties[iProperties] := DataModule1.tblProperties['Property Number'];

          end;

      end;

      setLength(arrProperties, iProperties);


   end;
end;

procedure TUser.setProfile(sAccount, sUsername, sPassword, bAdmin: String);
begin
  //LOGIN, used in MAINMENU
end;

end.
