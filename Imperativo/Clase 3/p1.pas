program punto1;
type
	socio = record
		numero:integer;
		nom:integer;
		edad:integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato:socio;
		HD: arbol;
		HI: arbol;
	end;
	
		procedure cargarArbol (var a:arbol);
		
			procedure leerSocio (var s:socio);
			begin
				writeln ('Ingrese un numero de socio: ');
				readln(s.numero);
				if (s.numero <> 0) then begin
					s.nom:= random (12)+500; 
					s.edad:= random (80)+1;
				end;
			end;
			
			procedure agregarAlArbol(var a:arbol; s:socio);
			begin
				if (a = nil) then begin
					new (a);
					a^.dato := s;
					a^.HI := nil; a^.HD := nil
				end
				else if (a^.dato.numero >= s.numero) then
					agregarAlArbol(a^.HI, s)
				else
					agregarAlArbol(a^.HD, s)
			end;
			
		var
			s:socio; cant:integer;
		begin
			cant:=0;
			a:=nil;
			leerSocio(s);
			while (s.numero <> 0) do begin
				agregarAlArbol(a,s);
				cant:= cant+1;
				writeln('---');
				writeln('Se agrego un socio al arbol, cantidad de socios acutal: ',cant);
				leerSocio(s);
			end;
		end;
		
		
		function maximo (a : arbol; var max : integer):integer;
		begin
			if (a<>nil) then begin
				maximo := maximo(a^.HD,max);
				if (a^.dato.numero > max) then 
					max:= a^.dato.numero;
			end;
			maximo := max;
		end;
		
		procedure informarDatosDelSocio (s:socio);
		begin
			writeln ('Socio numero: ',s.numero);
			writeln ('Nombre: ',s.nom);
			writeln ('Edad: ',s.edad);
		end;
		
		function minimo (a:arbol; var min:integer; var minAct: socio): socio;
		begin
			if (a<>nil) then begin
				minimo := minimo(a^.HI,min,minAct);
				if (a^.dato.numero < min) then begin
					min := a^.dato.numero;
					minAct:= a^.dato;
				end;
			end;
			minimo := minAct;
		end;
					
		procedure aumentarEdad (var a:arbol);
		begin
			if (a <> nil) then begin
				aumentarEdad(a^.HI);
				aumentarEdad(a^.HD);
				writeln('---');
				informarDatosDelSocio(a^.dato);
				writeln('---');
				a^.dato.edad := a^.dato.edad + 1;
				writeln('Se aumento la edad del socio: ');
				informarDatosDelSocio(a^.dato);
			end;
		end;
		
		
		
		
	var
		min,max:integer; a:arbol; minAct:socio;
	begin
		cargarArbol(a);
		max:=0; min:= 999;
		
		writeln('El numero de socio mas alto es: ',maximo(a,max)); // 1)b)i)
		writeln('---');
		writeln('El socio con numero de socio mas chico es: '); // ii)
		informarDatosDelSocio(minimo(a,min,minAct));
		aumentarEdad(a); // iv)
	End.

