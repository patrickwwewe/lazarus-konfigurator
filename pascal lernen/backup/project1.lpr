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
  Writeln('--- Einfacher Tür-Konfigurator (Test) ---');
  Writeln;

  Write('Bitte Höhe der Tür in mm eingeben: ');
  Readln(hoehe);

  Write('Bitte Breite der Tür in mm eingeben: ');
  Readln(breite);

  Writeln;
  Writeln('Du hast folgende Werte eingegeben:');
  Writeln('  Höhe  : ', hoehe, ' mm');
  Writeln('  Breite: ', breite, ' mm');

  Writeln;
  Writeln('Zum Beenden Enter drücken...');
  Readln;

end.

