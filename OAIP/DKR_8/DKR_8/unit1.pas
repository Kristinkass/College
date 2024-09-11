unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BChist: TButton;
    BSchet: TButton;
    Button1: TButton;
    Button2: TButton;
    CB1: TComboBox;
    Pve: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Mas: TEdit;
    ObBrus: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure BChistClick(Sender: TObject);
    procedure BSchetClick(Sender: TObject);
    procedure CB1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure MasChange(Sender: TObject);
    procedure ObBrusKeyPress(Sender: TObject; var Key: char);
    procedure PveChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.CB1Change(Sender: TObject);
begin
  // Задаем плотность материала в зависимости от выбора в CB1
  case CB1.ItemIndex of
    0: Pve.Text := '2700';
    1: Pve.Text := '2300';
    2: Pve.Text := '19300';
    3: Pve.Text := '900';
    4: Pve.Text := '8000';
    5: Pve.Text := '2300';
    6: Pve.Text := '7300';
    7: Pve.Text := '21500';
    8: Pve.Text := '7800';
    9: Pve.Text := '7100';
  end;
end;

procedure TForm1.BSchetClick(Sender: TObject);
  var
  a, b, c: extended;

begin
  a:= StrToFloatDef(ObBrus.Text,0);
  b:= StrToFloatDef(Pve.Text,0);
  c:= a * b;

  if a = 0 then
    Mas.Text := ''
  else
    Mas.Text := FloatToStr(c);  // Выводим результат в Mas

end;

procedure TForm1.BChistClick(Sender: TObject);
begin
  // Стираем значение в Mas
  Mas.Text := '';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.MasChange(Sender: TObject);
begin
  Mas.ReadOnly:= true;
end;



procedure TForm1.ObBrusKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'.. '9','.', #8]) then Key := #0;
end;

procedure TForm1.PveChange(Sender: TObject);
begin
  Pve.ReadOnly:= true;
end;



end.

