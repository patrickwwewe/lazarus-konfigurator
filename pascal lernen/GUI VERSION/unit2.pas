unit Unit2;

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

type
  TTuer = class
  private
    FHoehe  : Integer;
    FBreite : Integer;
    FPreis  : Integer;
    FGueltig: Boolean;
  public
    constructor CreateStandard;
    procedure SetAbmessungen(AHoehe, ABreite: Integer);
    procedure PruefeAbmessungen;
    procedure BerechnePreis;

    property Hoehe: Integer read FHoehe;
    property Breite: Integer read FBreite;
    property Preis: Integer read FPreis;
    property Gueltig: Boolean read FGueltig;
  end;

implementation

constructor TTuer.CreateStandard;
begin
  inherited Create;
  FHoehe   := 2100;
  FBreite  := 900;
  FPreis   := 0;
  FGueltig := False;
end;

procedure TTuer.SetAbmessungen(AHoehe, ABreite: Integer);
begin
  FHoehe  := AHoehe;
  FBreite := ABreite;
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

  FPreis := GRUNDPREIS;

  if FHoehe > 2300 then
    Inc(FPreis, ZUSCHLAG_UEBERHOEHE);
  if FBreite > 1000 then
    Inc(FPreis, ZUSCHLAG_UEBERBREITE);
end;

end.

