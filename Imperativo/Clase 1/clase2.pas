program ejer1;

type 

	
	subrango = 1..15;
	cantidad = 1..99;
	
	venta = record
		dia:integer;
		codigo: subrango;
		cant:cantidad;
	end;
	

		
	vector = array[1..50] of venta;
	
		procedure recorrer (v:vector; diml:integer);
		var i:integer;
		begin
			for i:= 1 to diml do begin
				writeln ('dia: ',v[i].dia);
				writeln ('codigo: ',v[i].codigo); 
				writeln ('cant: ',v[i].cant);
			end;
		end;
		
	
	procedure incisoAyB (var v:vector; var vent:venta; var diml:integer);
	
	
		procedure leerVenta (var v:venta);
		begin
			writeln('Insertar un dia');
			readln(v.dia);
			if (v.dia <> 0) then begin
				Randomize;
				v.codigo := Random (15)+1;
				v.cant := Random (99)+1;
			end;
		end;
	begin
		diml:=0;
		leerVenta(vent);
		while (vent.dia <> 0) do begin
			diml:=diml+1;
			v[diml]:= vent;
			leerVenta(vent);
		end;
		writeln('Vector DESORDENADO');
		recorrer(v,diml);
	end;
	
		procedure seleccion(var v:vector; var diml:integer);
		var
			i,j,pos:integer; item:subrango;
		begin
			for i := 1 to diml-1 do begin
				pos := i;
				for j:= i+1 to diml do begin
					if (v[j].codigo < v[pos].codigo) then
						pos := j;
				end;
				
				item := v[pos].codigo;
				v[pos]:= v[i];
				v[i].codigo := item;
			end;
		end;
		
		procedure EliminarOcurrencias(var v:vector; var diml:integer;num1:integer;num2:integer);
		var
			posIni,cant,i:integer;
		begin
			cant:=0;
			i:=1;
			writeln('--------------');
			writeln('num1: ',num1);
			writeln('num2:', num2);
			writeln('--------------');
			while (i <= diml) and (v[i].codigo < num1) do
				i:=i+1;
			
			if (i <= diml) and (v[i].codigo <= num2) then begin
				posIni:=i;
				while (v[i].codigo <= num2) do begin
					cant:=cant+1;
					i:=i+1;
				end;
			end;
			
			for i:= posIni to diml-cant do 
				v[i] := v[i+cant];
		
		diml:=diml-cant;
		end;
		
		
		
		
		
		

var
	v:vector; diml:integer; vent:venta; num1,num2:subrango;
begin
	incisoAyB(v,vent,diml);
	seleccion(v,diml);
	writeln('--------------');
	writeln('Vector ORDENADO');
	recorrer(v,diml);
	num1:= Random (7)+1;
	num2 := Random (7)+8;
	EliminarOcurrencias(v,diml,num1,num2);
	writeln('--------------');
	writeln('Vector eliminado');
	recorrer(v,diml);
end.
	
