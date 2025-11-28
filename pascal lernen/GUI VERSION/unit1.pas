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
<<<<<<< Updated upstream
=======
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MaterialChange(Sender: TObject);
    procedure ModellChange(Sender: TObject);
>>>>>>> Stashed changes
  private
  public
  end;

var
  Form1: TForm1;
<<<<<<< Updated upstream
  hoehe, breite : Integer;
  sHoehe, sBreite : String;
=======
  hoehe, breite : Integer;   // globale Integer
  sHoehe, sBreite : String;  // globale Strings
  Tuer: TTuer;               // EINE Tür für das ganze Formular
>>>>>>> Stashed changes

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Tür-Objekt einmalig erzeugen
  Tuer := TTuer.CreateStandard;

  // ComboBoxen füllen
  Material.Items.Clear;
  Material.Items.Add('Holz');
  Material.Items.Add('MDF');
  Material.Items.Add('Stahl');
  Material.ItemIndex := 0;           // Standardauswahl

  Modell.Items.Clear;
  Modell.Items.Add('Standard');
  Modell.Items.Add('Modern');
  Modell.Items.Add('Premium');
  Modell.ItemIndex := 0;             // Standardauswahl
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Tuer.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
<<<<<<< Updated upstream
  bhoehe, bbreite : Integer;
=======
  bHoehe, bBreite : Integer;
>>>>>>> Stashed changes
begin
  Memo1.Clear;

  // Texte aus den Edit-Feldern holen
  sHoehe  := Edit1.Text;
  sBreite := Edit2.Text;

  // Versuch: Text aus den Edits in Zahlen umwandeln
  if TryStrToInt(sHoehe, bHoehe) and TryStrToInt(sBreite, bBreite) then
  begin
<<<<<<< Updated upstream
    Memo1.Lines.Add('Eingegebene Werte:');
    Memo1.Lines.Add('Höhe  : ' + (shoehe) + ' mm');
    Memo1.Lines.Add('Breite: ' + (sbreite) + ' mm');
=======
    hoehe  := bHoehe;
    breite := bBreite;

    Memo1.Lines.Add('Eingegebene Werte:');
    Memo1.Lines.Add('Höhe  : ' + sHoehe  + ' mm');
    Memo1.Lines.Add('Breite: ' + sBreite + ' mm');

    // Abmessungen in die Tür schreiben
    Tuer.SetAbmessungen(hoehe, breite);

    // Maße prüfen
    Tuer.PruefeAbmessungen;

    // Wenn gültig -> Preis berechnen
    if Tuer.Gueltig then
    begin
      Tuer.BerechnePreis;
      Memo1.Lines.Add('');
      Memo1.Lines.Add('Maße sind gültig.');
      Memo1.Lines.Add('Material: ' + Tuer.MaterialText);
      Memo1.Lines.Add('Modell  : ' + Tuer.ModellText);
      Memo1.Lines.Add('Berechneter Preis: ' + IntToStr(Tuer.Preis) + ' EUR');
    end
    else
    begin
      Memo1.Lines.Add('');
      Memo1.Lines.Add('*** FEHLER: Maße ungültig ***');
      Memo1.Lines.Add('Preis kann nicht berechnet werden.');
    end;
>>>>>>> Stashed changes
  end
  else
  begin
    Memo1.Lines.Add('Fehler: Bitte gültige ganze Zahlen eingeben!');
  end;
end;

<<<<<<< Updated upstream
=======
procedure TForm1.MaterialChange(Sender: TObject);
begin
  case Material.ItemIndex of
    0: Tuer.SetMaterial(matHolz);
    1: Tuer.SetMaterial(matMDF);
    2: Tuer.SetMaterial(matStahl);
  end;
end;

procedure TForm1.ModellChange(Sender: TObject);
begin
  case Modell.ItemIndex of
    0: Tuer.SetModell(modStandard);
    1: Tuer.SetModell(modModern);
    2: Tuer.SetModell(modPremium);
  end;
end;

>>>>>>> Stashed changes
end.

