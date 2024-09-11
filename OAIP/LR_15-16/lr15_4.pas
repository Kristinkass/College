program lr15_4;


type
  PNode = ^Node;
  Node = record
    data: integer;
    next: PNode;
  end;

var
  head, current: PNode;
  n, i, minValue, maxValue: integer;

begin
  // Создание списка
  writeln('Введите количество элементов в списке:');
  readln(n);

  writeln('Введите элементы списка:');
  new(head);
  readln(head^.data);
  head^.next := nil;
  current := head;

  for i := 2 to n do
  begin
    new(current^.next);
    current := current^.next;
    readln(current^.data);
    current^.next := nil;
  end;

  // Поиск минимального и максимального элементов
  minValue := head^.data;
  maxValue := head^.data;
  current := head^.next;

  while current <> nil do
  begin
    if current^.data < minValue then
      minValue := current^.data;

    if current^.data > maxValue then
      maxValue := current^.data;

    current := current^.next;
  end;

  // Вывод результатов
  writeln('Минимальный элемент списка: ', minValue);
  writeln('Максимальный элемент списка: ', maxValue);

  // Освобождение памяти
  current := head;
  while current <> nil do
  begin
    head := current^.next;
    dispose(current);
    current := head;
  end;
end.
