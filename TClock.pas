unit TClock;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Graphics;

type
  TStyle = (tpStyleNigth,tpStyleWhite,tpStyleGray, tpStyleBlue,tpStyleRed);

type
  TBClock = class(TLabel)
  private
    { Private declarations }
    FTimer : TTimer;
    Fativo: boolean;
    FMyStyle: TStyle;
    procedure doTimer(Sender : TObject);
    procedure StyleNigth;
    procedure StyleWhite;
    procedure StyleGray;
    procedure StyleBlue;
    procedure StyleRed;
    procedure SetAtivo(const Value: boolean);
    procedure ChangeStyleScreen(vStyle : TStyle );
    procedure SetMyStyle(const Value: TStyle);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(Aowner: TComponent); override;
    destructor Destroy; Override;
  published
    { Published declarations }
    property Ativo : boolean read Fativo  write SetAtivo ;
    property MyStyle : TStyle  read FMyStyle write SetMyStyle;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('BoscoComps', [TBClock]);
end;

{ TBClock }

procedure TBClock.ChangeStyleScreen(vStyle: TStyle);
begin
  if (vStyle = tpStyleNigth) then
    StyleNigth
  else
  if (vStyle = tpStyleWhite) then
    StyleWhite
  else
  if (vStyle = tpStyleGray) then
    StyleGray
  else
  if (vStyle = tpStyleBlue) then
    StyleBlue
  else
  if (vStyle = tpStyleRed) then
    StyleRed;
end;

constructor TBClock.Create(Aowner: TComponent);
begin
  inherited;
  FTimer := TTimer.Create(Self);
  FTimer.OnTimer := doTimer;
  FTimer.Interval:= 1000;
  doTimer(nil);
end;

destructor TBClock.Destroy;
begin
   FreeAndNil(FTimer);
  inherited;
end;

procedure TBClock.doTimer(Sender: TObject);
begin
  if (FAtivo)  then
    Caption := FormatDateTime('HH:MM:SS', Now)
  else
    Caption := '-OFF-';

  ChangeStyleScreen(FMyStyle);
end;

procedure TBClock.SetAtivo(const Value: boolean);
begin
  Fativo := Value;
end;

procedure TBClock.SetMyStyle(const Value: TStyle);
begin
  FMyStyle := Value;
end;

procedure TBClock.StyleBlue;
begin
  Transparent := Boolean(0);
  Font.Size := 20;
  color := clBtnFace;
  Font.Color := clBlue;
end;

procedure TBClock.StyleGray;
begin
  Transparent := Boolean(0);
  Font.Size := 20;
  color := clBtnFace;
  Font.Color := clGray;
end;

procedure TBClock.StyleNigth;
begin
  Transparent := Boolean(0);
  Font.Size := 20;
  color := clBlack;
  Font.Color := clLime;
end;

procedure TBClock.StyleRed;
begin
  Transparent := Boolean(0);
  Font.Size := 20;
  color := clYellow;
  Font.Color := clRed;
end;

procedure TBClock.StyleWhite;
begin
  Transparent := Boolean(0);
  Font.Size := 20;
  color := clBtnFace;
  Font.Color := clwhite;
end;

end.
