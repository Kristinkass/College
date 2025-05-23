unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfMain }

  TfMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    procedure MyPrivat; //предварительное объявление процедуры
    procedure MyDouble; //удвоение глобальной переменной
  public

  end;

var
  fMain: TfMain;
  MyNum: real;// глобыльные

implementation

{$R *.lfm}

{ TfMain }
procedure Udvoenie(st: string);
var
  r: real;
begin
   //полученную строку преобразуем в число:
   r:= StrToFloat(st);
   //теперь удвоим его:
   r:= r * 2;
   //теперь выведем результат в сообщении:
   ShowMessage(FloatToStr(r));
end;
function FuncUdvoenie(st: string): string;
var
  r: real;
begin
   //полученную строку сначала преобразуем в число:
   r:= StrToFloat(st);
   //теперь удвоим его:
   r:= r * 2;
   //теперь вернем результат в виде строки:
   Result:= FloatToStr(r);
end;


procedure TfMain.Button1Click(Sender: TObject);
begin
  Udvoenie(Edit1.Text);
end;

procedure TfMain.Button2Click(Sender: TObject);
begin
  ShowMessage(FuncUdvoenie(Edit1.Text));
end;

procedure UdvoeniePoSsilke(var r: real);
begin
  r:= r * 2;
end;

procedure TfMain.Button3Click(Sender: TObject);
var
  myReal: real;
begin
  myReal:= StrToFloat(Edit1.Text);
  UdvoeniePoSsilke(myReal);
  ShowMessage(FloatToStr(myReal));
end;

procedure TfMain.Button4Click(Sender: TObject);
begin
  MyPrivat;
end;

procedure TfMain.Button5Click(Sender: TObject);
begin
    MyNum:= StrToFloat(Edit1.Text);
  //теперь удвоим его:
  MyDouble;
  //выводим результат на экран:
  ShowMessage(FloatToStr(MyNum));
end;

procedure TfMain.MyPrivat;
var
  r: real;
begin
    //преобразуем в число то, что ввел пользователь:
  r:= StrToFloat(Edit1.Text);
  //теперь удвоим его:
  r:= r * 2;
  //теперь выведем результат в сообщении:
  ShowMessage(FloatToStr(r));
end;

procedure TfMain.MyDouble;
begin
  //удвоим глобальную переменную:
  MyNum:= MyNum * 2;
end;

end.

