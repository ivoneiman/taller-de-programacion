
program ej2;

const
	dimF=300;
type
	oficina = record
		codigo:integer;
		dni:integer;
		expensa:integer;
	end;
	
	vector = array [1..dimF] of oficina;
	
	
	procedure cargarVector (var v:vector; var diml:integer);
		
		procedure leerOficina(var o:oficina);
		begin
			writeln('---');
			writeln('Leer código hasta -1: ');
			readln(o.codigo);
			if (o.codigo <> -1) then begin
				Randomize;
				o.dni := Random (9999)+1;
				o.expensa := Random (20000)+1;
			end;
		end;
		
	var
		o:oficina;
	begin
		leerOficina(o);
		diml:=0;
		while (o.codigo <> -1) do begin
			diml:=diml+1;
			v[diml]:= o;
			leerOficina(o);
		end;
	end;
	
	procedure insercion (var v:vector; diml:integer);
	var
		i,j:integer; actual:oficina;
	begin
		for i:= 2 to diml do begin
			actual := v[i];
			j := i-1;
			while (j>0) and (v[j].codigo > actual.codigo) do begin
				v[j+1]:= v[j];
				j:= j-1;
			end;
			v[j+1]:=actual;
		end;
	end;
	
	procedure seleccion (var v:vector; diml:integer);
	var
		i,j,pos:integer; item:oficina;
	begin
		for i:=1 to diml-1 do begin
			pos:=i;
			for j:= i+1 to diml do begin
				if (v[j].dni < v[pos].dni) then
					pos := j;
			end;
			
			item := v[pos];
			v[pos] := v[i];
			v[i]:= item;
		end;
	end;
	
	procedure recorrer (v:vector; diml:integer);
	var
		i:integer;
	begin
		for i:= 1 to diml do begin
			writeln('---');
			writeln('codigo: ',v[i].codigo);
			writeln('---');
			writeln('DNI: ',v[i].dni);
			writeln('---');
			writeln('Expensa: ',v[i].expensa);
			writeln('---');
		end;
	end;
		
	

	// programa principal
	var 
		v:vector; diml:integer;
	begin
	
		cargarVector(v,diml);
		insercion(v,diml);
		writeln('--- INSERCION ---');
		recorrer(v,diml);
		writeln('--- SELECCION ---');
		seleccion(v,diml);
		recorrer (v,diml);
	End.
				
	
	
	
	
