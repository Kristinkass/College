program lr15_3;

const
  n = 10; // размер массива

var
  a: array[1..n] of integer;
  i: integer;

begin
  // Ввод списка
  writeln('Введите список из ', n, ' чисел:');
  for i := 1 to n do
  begin
    readln(a[i]);
  end;

  // Вывод списка на экран
  writeln('Список:');
  for i := 1 to n do
  begin
    writeln(a[i]);
  end;

  // Вывод только четных элементов списка
  writeln('Четные элементы:');
  for i := 1 to n do
  begin
    if a[i] mod 2 = 0 then
    begin
      writeln(a[i]);
    end;
  end;
end.
