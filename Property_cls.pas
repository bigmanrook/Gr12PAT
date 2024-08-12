unit Property_cls;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls ;


type
  TProperty = class(TObject)

  private
    { Private declarations }
    fPropertyNo : Integer;
    fOwner : String;
    fCompletionDate : TDateTime;
    fPropertyLocation : String;
    fPropertyValue : String;
    fPropertyArea : Real;
    fPropertyPerimeter : Real;
    fForSale : Boolean;
    fToLet : Boolean;


  public
    { Public declarations }
   constructor Create(iPropNo : Integer; sPropertyOwner, sPropertyLocation  : String; TCompleteDate : TDateTime; sPropertyValue : String;  rPropertyArea, rPropertyPerimeter : Real; bforSale, btoLet : Boolean);
   function ToString(): String;
   procedure setPropertyArea(rPropertyArea : Real);
   procedure setPropertyPerimeter(rPropertyPerimeter : Real);
   function calculateValue (rPropertyArea : Real) : String;

  end;


implementation

{ TProperty }

function TProperty.calculateValue(rPropertyArea: Real): String;
begin
 //Calculate property value per m^2 (Let us say constant R/m^2 = R10000)

 Result := floattostr(10000 * rPropertyArea);

end;

constructor TProperty.Create(iPropNo : integer; sPropertyOwner,
  sPropertyLocation: String; TCompleteDate: TDateTime; sPropertyValue: String;
  rPropertyArea, rPropertyPerimeter: Real; bforSale, btoLet: Boolean);
begin
    fPropertyNo := iPropNo;
    fOwner := sPropertyOwner;
    fCompletionDate := TCompleteDate;
    fPropertyLocation := sPropertyLocation;
    fPropertyValue := sPropertyValue;
    fPropertyArea := rPropertyArea;
    fPropertyPerimeter := rPropertyPerimeter;
    fForSale := bforSale;
    fToLet := btoLet;

end;

procedure TProperty.setPropertyArea(rPropertyArea: Real);
begin
  //Whatever area the user decides, area cannot be greater than the square of perimeter/4
  //Will not add this - rather useless procedure
end;

procedure TProperty.setPropertyPerimeter(rPropertyPerimeter: Real);
begin
  //Whatever perimeter the user decides. area cannot be greater than the square of perimeter/4
    //Will not add this - rather useless procedure
end;

function TProperty.ToString: String;
begin
  //Return a summary of properties under each name

  Result := 'Location: ' + #10 + fPropertyLocation + #13 + 'Value: ' + fPropertyValue + #13 + 'Date of completion: ' + DateTimetoStr(fCompletionDate);

end;

end.
