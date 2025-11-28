//Konstanten, Typen,  STandartwerte von Türen
unit UNIT1;

{$mode ObjFPC}{$H+}   //Moderner Free Pascal Modus

interface

uses
  Classes, SysUtils;
// ---------- Konstanten (Stammdaten) ----------

const
  MIN_HOEHE      = 1800;
  MAX_HOEHE      = 3000;
  MIN_BREITE     = 600;
  MAX_BREITE     = 1200;

  GRUNDPREIS     = 500;

  ZUSCHLAG_MAT_HOLZ  = 150;
  ZUSCHLAG_MAT_MDF   = 50;
  ZUSCHLAG_MAT_STAHL = 300;

  ZUSCHLAG_MOD_MODERN  = 100;
  ZUSCHLAG_MOD_PREMIUM = 200;

  ZUSCHLAG_UEBERHOEHE  = 180;
  ZUSCHLAG_UEBERBREITE = 120;

  ZUSCHLAG_KOMBI_HOLZ_PREMIUM      = 90;
  ZUSCHLAG_KOMBI_STAHL_UEBERHOEHE  = 250;







// ---------- Aufzählungstypen für Material & Modell ----------

type
  TMaterial = (matUnbekannt, matHolz, matMDF, matStahl);   //Aufzählungstyp Enum
  TModell   = (modUnbekannt, modClassic, modModern, modPremium);


// ---------- Klasse TTuer ----------
// In der Klasse haben wir:
//   - private Felder (intern gespeichert)
//   - public Methoden (Funktionen/Prozeduren der Tür)
//   - Properties (sauberer Zugriff von außen)
  TTuer = class
    private
      FBreite   : Integer;
      FHoehe    : Integer;
      FMaterial : TMaterial; // Aufzählungstyp (matHolz, matMDF, matStahl, ...)
      FModell   : TModell;   // Aufzählungstyp (modClassic, modModern, modPremium, ...)
      FPreis    : Integer;
      FGueltig  : Boolean;
    public
      constructor CreateStandard;  // Konstruktor: wird aufgerufen, wenn ein neues TTuer-Objekt erzeugt wird
       //Methoden/Aktionen der Tür
       procedure PruefeAbmessungen; //Prüft Höhe/Breite, setzt FGueltig
       procedure BerechnePreis; //rechnet den Preis mit allen Regeln aus
       procedure GibKonfigurationAus;    //Schreibt die Werte auf die Konsole
         // Properties: Zugriff von außen auf Breite/Höhe/Material/Modell
    // -> damit muss man Fxxx nicht direkt verwenden
    property Breite   : Integer   read FBreite   write FBreite;
    property Hoehe    : Integer   read FHoehe    write FHoehe;
    property Material : TMaterial read FMaterial write FMaterial;
    property Modell   : TModell   read FModell   write FModell;
    property Preis    : Integer   read FPreis;
    property Gueltig  : Boolean    read FGueltig;
end;




implementation
// ---------- Hilfsfunktionen für Text-Ausgabe ----------
// Diese Funktion macht aus dem Aufzählungstyp TMaterial einen String.
// So wird später schön "Holz", "MDF", ... ausgeben.
function MaterialToStr(M: TMaterial): string;
begin
  case M of
  matUnbekannt: Result := 'Unbekannt';
  matHolz     : Result := 'Holz';
  matMDF      : Result := 'MDF';
  matStahl    : Result := 'Stahl';
  else
    Result    := 'Unbekannt'
  end;
end;

// Gibt den Modellnamen als Text zurück
function ModellToStr(M: TModell): string;
begin
  case M of
  modUnbekannt  : Result := 'Unbekannnt'
  modClassic    : Result := 'Classic'
  modModern     : Result := 'Modern'
  modPremium    : Result := 'Premium'
  esle
  Result := 'unbekannt'
  end;
end;

// ---------- Implementierung der Klasse TTuer ----------
// Standardwerte der Tuer im Konfigurator
constructor  TTuer.CreateStandard;
begin
  inerhit Create;
  FBreite      := 900;
  FHohe        :=2100;
  FMaterial    := matHolz;
  FModell      := modClassiv;
  FPreis       := 150;
  FGueltig     :=False;
end;

procedure TTuer.PruefeAbmessungen;
begin
  //Prüfen ob die hoehe und breite innerhalb der Stammdaten-Grenten liegen
  if (FHoehe <MIN_HOEHE) or (FBreite > MAX_BREITE)
  or (FHoehe > MAX_HOEHE) or (FBreite < MIN_BREITE)
  begin
          FGueltig := False;
          Writeln('*** FEHLER: Maße ungeultig***');
          Writeln('Hoehe erlaubt : ', MIN_HOEHE, ' - ', MAX_HOEHE, ' mm');
          Writeln('Breite erlaubt: ', MIN_BREITE, ' - ', MAX_BREITE, ' mm');
  end
  esle
  begin
    FGueltig := True;
    Writeln('Maße sind gueltig')
  end;
  end;

//Berechne Preis
procedure TTuer.BerechnePreis;
var Preis: Integer;
begin
  if not Fgueltig then
    Writeln('Kann Preis nicht berechnen: Maße sind ungueltig.');
    Exit;
end;

Preis = FPreis;
//Materialzuschläge
case FMaterial of
     modModern :



end.
