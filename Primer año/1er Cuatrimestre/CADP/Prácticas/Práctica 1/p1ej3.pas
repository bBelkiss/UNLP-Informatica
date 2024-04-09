{ Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir: 12 4 -10 }


program p1ej3;
var
	num1, num2, num3, max1, max2, max3: integer;
begin
   write('Ingrese el primer numero: ');
   readln(num1);
   write('Ingrese el segundo numero: ');
   readln(num2);
   write('Ingrese el tercer numero: ');
   readln(num3);
   if (num1 > num2) and (num1 > num3) then
   begin
      max1 := num1;
      if num2 > num3 then
      begin
         max2 := num2;
         max3 := num3;
      end
      else
      begin
         max2 := num3;
         max3 := num2;
      end;
   end
   else if (num2 > num1) and (num2 > num3) then
   begin
      max1 := num2;
      if num1 > num3 then
      begin
         max2 := num1;
         max3 := num3;
      end
      else
      begin
         max2 := num3;
         max3 := num1;
      end;
   end
   else
   begin
      max1 := num3;
      if num1 > num2 then
      begin
         max2 := num1;
         max3 := num2;
      end
      else
      begin
         max2 := num2;
         max3 := num1;
      end;
   end;
   writeln(max1,' ',max2,' ',max3);
end.