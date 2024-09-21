program punto3;

type
	generos = 1..8;
	
	peliculas = record
		codigo:integer;
		genero:generos;
		puntaje:real;
	end;
	
	critica = record
		codigo:integer;
		puntaje:integer;
	end;
	
	lista=^nodo;
	nodo=record
		dato:peliculas;
		sig:lista;
	end;
	
	vector = array [generos] of critica;
	
	procedure cargarLista (var l:lista);
	
		procedure insertarOrdenado (var l:lista; p:peliculas);
		var
			nue,act,ant:lista;
		begin
			new(nue);
			nue^.dato := p;
			act:=l;
			ant:=l;
			
			while (act <> nil) and (act^.dato.genero < p.genero) do begin
				ant:=act;
				act:=act^.sig;
			end;
			
			if (ant = act) then
				l := nue
			else
				ant^.sig := nue;
			nue^.sig := act;
		end;
		
		procedure leerPeliculas (var p:peliculas);
		begin
			writeln('Lea un codigo de pelicula: ');
			readln(p.codigo);
			if (p.codigo <> -1) then begin
				p.genero := Random (8)+1;
				p.puntaje := Random (11);
			end;
		end;
		
	var
		p:peliculas;
	begin
		l:=nil;
		leerPeliculas (p);
		while (p.codigo <> -1) do begin
			insertarOrdenado(l,p);
			leerPeliculas(p);
		end;
	end;
	
	procedure incisoB (l:lista; var v:vector);
	
		
	
		procedure recorrerMaximo (l:lista,var c:critica, i:integer);
		var
			max:integer;
		begin
			max := -1;
			while (l <> nil) do begin
				if (l^.dato.genero = i) then
					if (l^.dato.puntaje > max) then begin
						max:= l^.dato.puntaje;
						c.codigo := l^.dato.codigo; c.puntaje:=l^.dato.puntaje;
					end;
				end;
				l:=l^.sig;
			end;
		end;
		
		procedure insercion (var v:vector)
		var
			i,j:integer: actual:critica;
		begin
			for i:= 2 to 8 do begin
				actual := v[i];
				j := i-1;
				while (j > 0) and (v[j].puntaje < actual.puntaje) do begin
					v[j+1] := v[j];
					j:= j-1;
				end;
				
				v[j+1] := actual;
			end;
		end;
					
		
	var
		c:critica;
		i:integer;
	begin
		for i := 1 to 8 do begin
			recorrerMaximo(l,c,i);
			v[i] := c;
		end;
	end;
	
	
	// pp
	var
		l:lista;
	begin
		cargarLista(l);
	End.
