
program punto2;
	
	procedure imprimirDigitos(num:integer);
	var
		dig:integer;
	begin
		if (num <> 0) then begin
			dig := num mod 10;
			num := num div 10;
			imprimirDigitos(num);
			writeln (dig);
		end;
	end;

var
	num:integer;
begin
	writeln('lea un numero');
	readln(num);
	while (num<>0) do begin
		imprimirDigitos(num);
		writeln('lea un numero');
		readln(num);
	end;
End.
		
