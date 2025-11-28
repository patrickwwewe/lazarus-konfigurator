unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  hoehe, breite : Integer;
  sHoehe, sBreite : String;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  bhoehe, bbreite : Integer;
begin
  Memo1.Clear;
   // Texte aus den Edit-Feldern holen
  sHoehe  := Edit1.Text;
  sBreite := Edit2.Text;
  // Versuch: Text aus den Edits in Zahlen umwandeln
  if TryStrToInt(Edit1.Text, bHoehe) and TryStroToInt(Edit2.Text, bBreite) then
  begin
    Memo1.Lines.Add('Eingegebene Werte:');
    Memo1.Lines.Add('Höhe  : ' + (shoehe) + ' mm');
    Memo1.Lines.Add('Breite: ' + (sbreite) + ' mm');
  end
  else
  begin
    Memo1.Lines.Add('Fehler: Bitte gültige ganze Zahlen eingeben!');
  end;
end;

end.

