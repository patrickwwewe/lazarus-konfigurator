unit Unit2;
//Türe

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

const
  MIN_HOEHE      = 1800;
  MAX_HOEHE      = 3000;
  MIN_BREITE     = 600;
  MAX_BREITE     = 1200;

  GRUNDPREIS     = 500;
  ZUSCHLAG_UEBERHOEHE  = 180;
  ZUSCHLAG_UEBERBREITE = 120;

  ZUSCHLAG_MAT_HOLZ  = 150;
  ZUSCHLAG_MAT_MDF   = 50;
  ZUSCHLAG_MAT_STAHL = 300;

  ZUSCHLAG_MOD_MODERN  = 100;
  ZUSCHLAG_MOD_PREMIUM = 200;

type

  TMaterial = (matHolz, matMDF, matStahl);
  TModell   = (modStandard, modModern, modPremium);
  TTuer = class
  private
    FHoehe  : Integer;
    FBreite : Integer;
    FPreis  : Integer;
    FGueltig: Boolean;
    FMaterial: TMaterial;
    FModell  : TModell;
  public
    constructor CreateStandard;
    procedure SetAbmessungen(AHoehe, ABreite: Integer);
    procedure SetMaterial(AMaterial: TMaterial);
    procedure SetModell(AModell: TModell);
    procedure PruefeAbmessungen;
    procedure BerechnePreis;

    property Hoehe: Integer read FHoehe;
    property Breite: Integer read FBreite;
    property Preis: Integer read FPreis;
    property Gueltig: Boolean read FGueltig;
    property Material: TMaterial read FMaterial;
    property Modell: TModell read FModell;
  end;

implementation

constructor TTuer.CreateStandard;
begin
  inherited Create;
  FHoehe   := 2100;
  FBreite  := 900;
  FPreis   := 0;
  FGueltig := False;
    FMaterial := matHolz;
  FModell  := modStandard;
end;

procedure TTuer.SetAbmessungen(AHoehe, ABreite: Integer);
begin
  FHoehe  := AHoehe;
  FBreite := ABreite;
end;
procedure TTuer.SetMaterial(AMaterial: TMaterial);
begin
  FMaterial := AMaterial;
end;

procedure TTuer.SetModell(AModell: TModell);
begin
  FModell := AModell;
end;


procedure TTuer.PruefeAbmessungen;
begin
  if (FHoehe < MIN_HOEHE) or (FHoehe > MAX_HOEHE)
  or (FBreite < MIN_BREITE) or (FBreite > MAX_BREITE) then
    FGueltig := False
  else
    FGueltig := True;
end;
procedure TTuer.BerechnePreis;
begin
  if not FGueltig then
  begin
    FPreis := 0;
    Exit;
  end;

  // 1. Grundpreis
  FPreis := GRUNDPREIS;

  // 2. Material
  case FMaterial of
    matHolz:  Inc(FPreis, ZUSCHLAG_MAT_HOLZ);
    matMDF:   Inc(FPreis, ZUSCHLAG_MAT_MDF);
    matStahl: Inc(FPreis, ZUSCHLAG_MAT_STAHL);
  end;

  // 3. Modell
  case FModell of
    modModern:  Inc(FPreis, ZUSCHLAG_MOD_MODERN);
    modPremium: Inc(FPreis, ZUSCHLAG_MOD_PREMIUM);
  end;

  // 4. Abmessungszuschläge
  if FHoehe > 2300 then
    Inc(FPreis, ZUSCHLAG_UEBERHOEHE);

  if FBreite > 1000 then
    Inc(FPreis, ZUSCHLAG_UEBERBREITE);
end;



end.

