program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes,
  Unit1, Unit2;
//var
  //Tuer: TTuer;
var
  hoehe, breite : Integer;



begin
  InitialisiereTuer(Tuer);

end.

