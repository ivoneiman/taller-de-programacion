program parcialtema1;
type

	compra = record
		codCli : integer;
		dia:integer;
		cantProd:integer;
		monto:real;
	end;
	
	
	{ Leer compras, generar y retornar una estructura para la busqueda
	por codigo del cliente
	*para cada cliente se almacenan sus compras: (dia,cantProd,monto
	}
	
	lista = ^nodo;
	nodo = record
		dato:compra;
		sig:lista;
	end;
	
	
	cliente = record
		codigo:integer;
		compras: lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato:cliente;
		HI:arbol;
		HD:arbol;
	end;
	
	procedure incisoA (var a:arbol);
	
		procedure agregarAdelante (var l:lista; c:compra);
		var
			nue:lista;
		begin
			new(nue);
			nue^.dato:=c;
			nue^.sig:=l;
			l:=nue;
		end;
		
		procedure leerCompra (var c:compra);
		begin
			writeln('---');
			writeln('Leer una cantidad de productos: ');
			readln (c.cantProd);
			if (c.cantProd <> 0) then begin
				c.codCli := Random (5)+1;
				c.dia := Random (31)+1;
				c.monto := Random (1000);
			end;
		end;
		
		procedure igualarCliente (var cli:cliente; c:compra);
		begin
			cli.codigo := c.codCli;
			cli.compras := nil;
		end;
		
		procedure agregarAlArbol (var a:arbol; c:compra);
		var
			cli:cliente;
		begin
			if (a = nil) then begin
				new (a);
				igualarCliente(cli,c);
				agregarAdelante(cli.compras,c);
				a^.dato := cli;
				a^.HI := nil;
				a^.HD := nil;
				writeln('Se agrego un cliente al arbol');
			end
			else if (c.codCli = a^.dato.codigo) then begin
				agregarAdelante(a^.dato.compras,c);
				writeln('Se agrego una compra nueva a la lista del cliente ',c.codCli);
			end
			else if (c.codCli < a^.dato.codigo) then
				agregarAlArbol(a^.HI, c)
			else
				agregarAlArbol(a^.HD, c)
		end;
				

	var
		c:compra;
	begin
		a:=nil;
		leerCompra(c);
		while (c.cantProd <> 0) do begin
			agregarAlArbol(a,c);
			leerCompra(c);
		end;
	end;
	
	
	// Recibir el arbol y un cod cliente y devolver la lista con sus compras
	procedure incisoB (a:arbol; var l:lista; x:integer);
	begin
		if (a<>nil) then begin
			if (a^.dato.codigo = x) then begin
				l := a^.dato.compras;
				writeln('se igualo : = lista de compras');
			end
			else if (x < a^.dato.codigo) then
				incisoB (a^.HI,l,x)
			else
				incisoB (a^.HD,l,x)
		end;
	end;
	
	function incisoC (l:lista; max:integer):real;
	begin
		if (l <> nil) then begin
			incisoC (l^.sig,max);
			if (l^.dato.cantProd > max) then begin
				max:=l^.dato.cantProd;
				incisoC := l^.dato.monto;
			end;
		end
		else
			incisoC := 0;
	end;
					
		
// PP
var
	a:arbol;
	l:lista;
	max,x:integer;
begin
	incisoA(a);
	l:=nil;
	x:=3;
	incisoB(a,l,x);
	max:=-1;
	writeln (' el monto de la compra con mayor cantidad de productos fue: ',incisoC(l,max));
End.
