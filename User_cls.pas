unit User_cls;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Property_cls;

type
  TUser = class(TProperty)

  private
    { Private declarations }
     fAccount : String;
     fPropertyNo : Integer;
     fUsername : String;
     fPassword : String;
     fNetValue : Real;
     fRent : Boolean;
  public
    { Public declarations }
  constructor Create(sAccount, sUsername, sPassword : String ; iPropertyNo : Integer; rNetValue : Real ; bRent : Boolean);
  function getProperties(sAccount : String) : Integer;
  procedure setProfile(sAccount, sUsername, sPassword : String);
  end;


implementation

end.
