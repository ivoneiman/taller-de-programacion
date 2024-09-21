program ej2p5;
type
rubros = 1..10;

	producto = record
		code:integer;
		rubro:rubros;
		stock:integer;
		precio:real;
	end;
	
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato:producto;
		HI:arbol;
		HD:arbol;
	end;
	
	vector = array [rubros] of arbol;
	
	procedure leerProducto (var p:producto);
	begin
		writeln('Leer codigo de un producto');
		readln(p.code);
		if (p.code <> -1) then begin
			p.rubro := Random (10)+1;
			p.stock := Random (30);
			p.precio := Random (500);
		end;
	end;
	
	procedure cargarVector (var v:vector);
	
		procedure cargarArbol (var a:arbol; p:producto);
		begin
			if (a=nil)then begin
				new(a);
				a^.dato := p;
				a^.HI:=nil;
				a^.HD:=nil;
			end
			else if (p.code <= a^.dato.code) then
				cargarArbol(a^.HI,p)
			else
				cargarArbol(a^.HD,p)
		end;
		
		procedure inicializarArboles (var v:vector; var diml:integer);
		begin
			if (diml <= 10) then begin
				v[diml] := nil;
				writeln('x');
				diml := diml+1;
				inicializarArboles(v,diml);
			end;
		end;
		
	var
		p:producto; diml:integer;
	begin
		diml:=0;
		inicializarArboles(v,diml);
		leerProducto(p);
		while (p.code <> -1) do begin
			cargarArbol(v[p.rubro],p);
			leerProducto(p);
		end;
	end;
	
	
	function esta (a:arbol; x:integer):boolean;
	begin
		if (a <> nil) then begin
			if (a^.dato.code = x) then
				esta:= true
			else if (a^.dato.code <= x) then
				esta := esta(a^.HI,x)
			else
				esta := esta(a^.HD,x)
		end
		else
			esta := false;
	end;
	
	
	function incisoB (v:vector; r:integer; x:integer):boolean;
	begin
		if (v[r] <> nil) then
			if (esta(v[r],x)) then
				incisoB := true
		else
			incisoB := false;
	end;
	
	
		procedure incisoC (v:vector; var r2:integer);
			procedure buscarMax (a:arbol; var max:integer; var cod:integer; var stockeado:integer);
			begin
				if (a<>nil) then begin
					buscarMax(a^.HD,max,cod,stockeado);
					if (a^.dato.code > max) then begin
						max := a^.dato.code;
						cod := a^.dato.code;
						stockeado := a^.dato.stock;
					end;
				end;
			end;
		var
			max:integer;
			cod,stockeado:integer;
		begin
			if (r2 <= 10) then begin
				if  (v[r2] <> nil) then begin
					max := -1;
					buscarMax(v[r2],max,cod,stockeado);
					if (max <> -1) then
						writeln('el maximo de el rubro: ',r2,' devolvio cod: ',cod,' stock:',stockeado)
					else
						writeln('--no hubo maximo en: ',r2);
				end;
			end;
			r2:= r2+1;
			if (r2<10)then
				incisoC (v,r2);
		end;
	
	
	procedure incisoD (v:vector; c1,c2:integer;r:integer);
		
		function cantidadProductos (a:arbol; c1,c2:integer):integer;
		begin
			if (a<>nil) then begin
				if (a^.dato.code >= c1) and (a^.dato.code <= c2) then
				cantidadProductos := 1 + cantidadProductos(a^.HI,c1,c2) + cantidadProductos(a^.HD,c1,c2)
				else if (a^.dato.code < c1) then
					cantidadProductos := cantidadProductos(a^.HD,c1,c2)
				else if (a^.dato.code > c2) then
					cantidadProductos := cantidadProductos(a^.HI,c1,c2)
			end
			else
				cantidadProductos:=0;
		end;
		
	
	begin
		if (r <= 10) and (v[r] <> nil) then
			writeln('La cantidad de productos para el rubro n ',r,' es de ',cantidadProductos(v[r],c1,c2));
		r:=r+1;
		if (r<= 10) then
			incisoD(v,c1,c2,r);
	end;
			
			
		
	
	
	
	
	
	//pp
	
	var
		v:vector;
		x:integer;
		c1,c2,r:integer;
	begin
		cargarVector(v);
		
		r:= Random (10)+1;
		x:=1;
		if (incisoB (v,r,x)) then
			writeln ('esta')
		else
			writeln('no esta');
			
		r:=1;
		incisoC(v,r);
		
		r:=1;
		c1:=2;
		c2:=4;
		incisoD (v,c1,c2,r)
			
		
	End.

