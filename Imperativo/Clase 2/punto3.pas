program punto3;
type
	lista = ^nodo;
	nodo = record
		dato:integer;
		sig:lista;
	end;
	
	function crearNumero ():integer;
	var
		num:integer;
	begin
		num:= Random (10);
		crearNumero := num;
	end;
	
	procedure cargarLista (var l:lista);
	var
		nue:lista; x:integer;
	begin
		x := crearNumero();
		writeln (' x = ',x);
		if (x <> 0) then begin
			new (nue);
			nue^.dato := x;
			nue^.sig := l;
			l := nue;
			writeln('se agrego el numero ',x,' a la lista');
			cargarLista(l);
		end;
	end;
	
	procedure minimo (l:lista; var min:integer);
	begin
		if (l <> nil) then begin
			if (l^.dato < min) then
				min := l^.dato;
			minimo(l^.sig,min);
		end;
	end;
	
	procedure maximo (l:lista; var max:integer);
	begin
		if (l <> nil) then begin
			if (l^.dato > max) then
				max := l^.dato;
			maximo(l^.sig,max);
		end;
	end;
	
	function encontrarValor (l:lista;x:integer):boolean;
	begin
		if (l <> nil) then begin
			encontrarValor := encontrarValor(l^.sig,x);
			if (l^.dato = x) then
				encontrarValor := true
		end;
	end;
	
	
	
	var
		l:lista; min,max,x:integer;
	begin
		l:=nil;
		cargarLista(l);
		min:=999;
		minimo(l,min);
		writeln (' el numero minimo de la lista es: ',min);
		max:=-1;
		maximo(l,max);
		writeln (' el numero maximo de la lista es: ',max);
		x:=8;
		if (encontrarValor(l,x)) then
			writeln (x,' se encuentra en la lista')
		else
			writeln (x,' no se encuentra en la lista')
	End.
