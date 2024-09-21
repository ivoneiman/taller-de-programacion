program repaso;
const
	dimF = 300;
type
	oficina = record
		code:integer;
		dniProp:integer;
		expensa:integer;
	end;
	
	vector = array [1..dimF] of oficina;
	
	procedure cargarVector (var v:vector; var diml:integer);
		procedure leerOficina (var o:oficina);
		begin
			writeln('Leer un codigo de oficina');
			readln(o.code);
			if(o.code <> -1) then begin
				o.dniProp := Random(99)+1;
				writeln('dni del propietario ',o.code,': ',o.dniProp);
				o.expensa := Random(1000);
				writeln('expensa: ',o.expensa);
			end;
		end;
		
	var
		o:oficina;
	begin
		leerOficina(o);
		if (diml <= dimF) and (o.code <> -1) then begin
			v[diml] := o;
			diml:=diml+1;
			cargarVector(v,diml);
		end;
	end;
	
	
	procedure insercion (var v:vector; diml:integer);
	var
		i,j:integer;
		actual:oficina;
	begin
		for i := 2 to diml do begin
			actual := v[i];
			j := i-1;
			while (j>0) and (v[j].code > actual.code) do begin
				v[j+1] := v[j];
				j:=j-1;
			end;
			
			v[j+1] := actual;
		end;
	end;
	
	procedure busquedaDicotomica (v:vector; x:integer; var cod:integer; diml:integer);
	var
		pri,ult,medio:integer;
	begin
		cod:=0;
		pri := 1;
		ult := diml;
		medio := (pri+ult) div 2;
		while (pri <= ult) and (x <> v[medio].code) do begin
			if (x < v[medio].code) then
				ult := medio-1
			else
				pri := medio+1;
			medio := (pri+ult) div 2;
		end;
		
		if (pri <= ult) then 
			cod:=v[medio].dniProp
		else
			cod:=0;
	end;
	
	function retornarExpensas (v:vector; diml:integer; i:integer):integer;
	begin
		if (i <= diml) then
			retornarExpensas := v[i].expensa + retornarExpensas(v,diml,i+1);
	end;
			
	// programa principal
	var
		i,cod,x,diml:integer;
		v:vector;
	begin
		diml:=1;
		cargarVector(v,diml);
		insercion(v,diml);
		x := 3;
		busquedaDicotomica(v,x,cod,diml);
		if (cod <> 0) then
			writeln('codigo a buscar: ',x,' | dni del propietario ',x,' : ',cod)
		else
			writeln('No se encontro en la oficina el proietario: ',x);
		i := 1;
		writeln('El total de expensas fue de: ',retornarExpensas(v,diml,i));
	End.
		
