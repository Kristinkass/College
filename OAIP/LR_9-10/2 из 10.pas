﻿program z2_10;

type
  arr = array[1..8, 1..6] of integer;
  arr1 = array[1..8] of integer;

var
  array1: arr;
  array2: arr1;
  i, j: integer;

begin
  randomize;
  
  // заполняем массив случайными числами
  for i := 1 to 8 do
    for j := 1 to 6 do
      array1[i, j] := random(20) - 10;
  
  // выводим массив на экран
  writeln('Исходный массив:');
  for i := 1 to 8 do
  begin
    for j := 1 to 6 do
      write(array1[i, j], ' ');
    writeln();
  end;
  
  // проверяем каждую строку на наличие отрицательных чисел
  for i := 1 to 8 do
  begin
    array2[i] := 1;
    
    for j := 1 to 6 do
    begin
      if array1[i, j] < 0 then
      begin
        array2[i] := -1;
        break;
      end;
    end;
  end;
  
  // выводим одномерный массив на экран
  writeln();
  
  writeln('Результирующий массив:');
  for i := 1 to 8 do
    write(array2[i], ' ');
end.