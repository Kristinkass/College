program lr15_1;
var i: integer; //целочисленная переменная
    i_ptr: ^integer; //указатель
 begin
   i:=2;
   i_ptr:=@i;
   writeln('Значение по адресу i_ptr: ', i_ptr^)
 end.
