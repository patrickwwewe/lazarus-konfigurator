// Konstanten, Typen,  Standardwerte von Türen
unit Unit1;

{$mode ObjFPC}{$H+}   // Moderner Free Pascal Modus

interface

uses
  Classes, SysUtils;

// ---------------------------------------------
// ---------- Konstanten (Stammdaten) ----------
// ---------------------------------------------

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

// ------------------------------------------------------------
// ---------- Aufzählungstypen für Material & Modell ----------
// ------------------------------------------------------------

type
  TMaterial = (matUnbekannt, matHolz, matMDF, matStahl);   // Aufzählungstyp Enum
  TModell   = (modUnbekannt, modClassic, modModern, modPremium);

// ----------------------------------
// ---------- Klasse TTuer ----------
// ----------------------------------

  TTuer = class
  private
    FBreite   : Integer;
    FHoehe    : Integer;
    FMaterial : TMaterial;
    FModell   : TModell;
    FPreis    : Integer;
    FGueltig  : Boolean;
  public
    constructor CreateStandard;
    procedure PruefeAbmessungen;
    procedure BerechnePreis;
    procedure GibKonfigurationAus;

    property Breite   : Integer   read FBreite   write FBreite;
    property Hoehe    : Integer   read FHoehe    write FHoehe;
    property Material : TMaterial read FMaterial write FMaterial;
    property Modell   : TModell   read FModell   write FModell;
    property Preis    : Integer   read FPreis;
    property Gueltig  : Boolean   read FGueltig;
  end;

implementation

// ------------------------------------------------------
// ---------- Hilfsfunktionen für Text-Ausgabe ----------
// ------------------------------------------------------

function MaterialToStr(M: TMaterial): string;
begin
  case M of
    matUnbekannt: Result := 'Unbekannt';
    matHolz     : Result := 'Holz';
    matMDF      : Result := 'MDF';
    matStahl    : Result := 'Stahl';
  else
    Result := 'Unbekannt';
  end;
end;

function ModellToStr(M: TModell): string;
begin
  case M of
    modUnbekannt  : Result := 'Unbekannt';
    modClassic    : Result := 'Classic';
    modModern     : Result := 'Modern';
    modPremium    : Result := 'Premium';
  else
    Result := 'Unbekannt';
  end;
end;

// ------------------------------------------------------
// ---------- Implementierung der Klasse TTuer ----------
// ------------------------------------------------------

constructor TTuer.CreateStandard;
begin
  inherited Create;
  FBreite   := 900;
  FHoehe    := 2100;
  FMaterial := matHolz;
  FModell   := modClassic;
  FPreis    := GRUNDPREIS;
  FGueltig  := False;
end;

procedure TTuer.PruefeAbmessungen;
begin
  // Prüfen, ob die Höhe und Breite innerhalb der Stammdaten-Grenzen liegen
  if (FHoehe < MIN_HOEHE) or (FHoehe > MAX_HOEHE) or
     (FBreite < MIN_BREITE) or (FBreite > MAX_BREITE) then
  begin
    FGueltig := False;
    Writeln('*** FEHLER: Maße ungueltig ***');
    Writeln('Hoehe erlaubt : ', MIN_HOEHE, ' - ', MAX_HOEHE, ' mm');
    Writeln('Breite erlaubt: ', MIN_BREITE, ' - ', MAX_BREITE, ' mm');
  end
  else
  begin
    FGueltig := True;
    Writeln('Maße sind gueltig');
  end;
end;

//-----------------------------------------------------
// ---------- ZUSCHLÄGE bzw. PREISBERECHNUNG ----------
//-----------------------------------------------------

procedure TTuer.BerechnePreis;
var
  NeuerPreis: Integer;
begin
  if not FGueltig then
  begin
    Writeln('Kann Preis nicht berechnen: Maße sind ungueltig.');
    Exit;
  end;

  // Basispreis
  NeuerPreis := GRUNDPREIS;

  // Materialzuschläge
  case FMaterial of
    matHolz  : Inc(NeuerPreis, ZUSCHLAG_MAT_HOLZ);
    matMDF   : Inc(NeuerPreis, ZUSCHLAG_MAT_MDF);
    matStahl : Inc(NeuerPreis, ZUSCHLAG_MAT_STAHL);
  end;

  // Modellzuschläge
  case FModell of
    modModern  : Inc(NeuerPreis, ZUSCHLAG_MOD_MODERN);
    modPremium : Inc(NeuerPreis, ZUSCHLAG_MOD_PREMIUM);
  end;

  // Überhöhe / Überbreite
  if FHoehe > 2300 then
    Inc(NeuerPreis, ZUSCHLAG_UEBERHOEHE);

  if FBreite > 1000 then
    Inc(NeuerPreis, ZUSCHLAG_UEBERBREITE);

  // Kombinationsregeln
  if (FMaterial = matHolz) and (FModell = modPremium) then
    Inc(NeuerPreis, ZUSCHLAG_KOMBI_HOLZ_PREMIUM);

  if (FMaterial = matStahl) and (FHoehe > 2300) then
    Inc(NeuerPreis, ZUSCHLAG_KOMBI_STAHL_UEBERHOEHE);

  // Fertigen Preis ins Feld schreiben
  FPreis := NeuerPreis;
end;

//-----------------------------------------------------
// ---------- Ausgabe der Konfiguration ---------------
//-----------------------------------------------------

procedure TTuer.GibKonfigurationAus;
begin
  Writeln('==============================');
  Writeln('Tuerkonfiguration');
  Writeln('Breite   : ', FBreite, ' mm');
  Writeln('Hoehe    : ', FHoehe, ' mm');
  Writeln('Material : ', MaterialToStr(FMaterial));
  Writeln('Modell   : ', ModellToStr(FModell));
  if FGueltig then
    Writeln('Status   : GUELTIG')
  else
    Writeln('Status   : UNGUELTIG');
  Writeln('Preis    : ', FPreis, ' EUR');
  Writeln('==============================');
end;

end.

