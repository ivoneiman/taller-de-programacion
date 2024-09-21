
program parcial;

type

	compraCliEspecifico = record
		codigoCliente:integer;
		dia:integer;
		cantidadProductos:integer;
		montoPagado:real;
	end;
	
	compra = record
		dia:integer;
		cantProd:integer;
		monto:real;
	end;
	
	
	lista=^nodo;
	nodo = record
		dato:compra;
		sig:lista;
	end;
	
	
	cliente = record
		code:integer;
		compras:lista;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: cliente;
		HI:arbol;
		HD:arbol;
	end;
	
	
	
		
		procedure agregarAdelante (var l:lista; c:compra);
		var
			nue:lista;
		begin
			new(nue);
			nue^.dato := c;
			nue^.sig := l;
			l:=nue;
			writeln('Se agrego a la lista de compras una nueva compra');
		end;
	
	
	procedure cargarArbol (var a:arbol);
			
		procedure leerCompraCliEspecifico (var c:compraCliEspecifico);
		begin
			writeln('---');
			writeln('Ingrese una cantidad de productos mientras sea distinta de 0');
			readln(c.cantidadProductos);
			if (c.cantidadProductos <> 0) then begin
				c.dia := Random (31)+1;
				c.codigoCliente := Random (2)+1;
				c.montoPagado := Random (10000)+1;
			end;
		end;
		
		procedure igualarCompra (var comp:compra; compCliEsp:compraCliEspecifico);
		begin
			writeln('---');
			writeln('Se iguala la compra');
			comp.dia := compCliEsp.dia;
			comp.cantProd := compCliEsp.cantidadProductos;
			comp.monto := compCliEsp.montoPagado;
		end;
		
		procedure cargarClienteEnArbol (var a:arbol; var cli:cliente; c:compra);
		begin
			if (a = nil) then begin
				new(a);
				cli.compras:=nil;
				agregarAdelante(cli.compras,c);
				a^.dato:=cli;
				a^.HI:=nil;
				a^.HD:=nil;
				writeln('Se agrego un cliente al arbol');
				writeln('---');
			end
			else if (a^.dato.code = cli.code) then begin
				agregarAdelante(a^.dato.compras,c);
				writeln('Se agrego una compra del cliente',a^.dato.code,' a la lista');
			end
			else if (a^.dato.code >= cli.code) then
				cargarClienteEnArbol(a^.HI,cli,c)
			else
				cargarClienteEnArbol(a^.HD,cli,c)
		end;
	
	var
		c:cliente;
		compraEspecifica: compraCliEspecifico;
		comp:compra;
	begin
		leerCompraCliEspecifico(compraEspecifica);
		while (compraEspecifica.cantidadProductos <> 0) do begin
			igualarCompra(comp,compraEspecifica);
			c.code := compraEspecifica.codigoCliente;
			writeln('Codigo de cliente: ', c.code);
			cargarClienteEnArbol(a,c,comp);
			leerCompraCliEspecifico(compraEspecifica);
		end;
	end;
	
	procedure cargarListaDos(var l2:lista; l:lista);
	var
		c:compra;
	begin
		if (l <> nil) then begin
			c:=l^.dato;
			agregarAdelante(l2, c);
			cargarListaDos(l2,l^.sig);
		end;
	end;
	
	
	procedure devolverCompras (a:arbol; var l2:lista; x:integer);
	begin
		if (a <> nil) then begin
			if (a^.dato.code = x) then begin
				if (a^.dato.compras <> nil) then begin
					writeln('cargando lista dos de ',x);
					cargarListaDos(l2,a^.dato.compras);
				end;
			end
			else if (a^.dato.code <= x) then
				devolverCompras(a^.HI,l2,x)
			else
				devolverCompras(a^.HD,l2,x)
		end;
	end;
			
	function maximo (l:lista; var max:real):real;	
	begin
		if (l <> nil) then begin
			maximo := maximo (l^.sig,max);
			if (l^.dato.monto>=max) then begin
				max:=l^.dato.monto;
			end;
		end;
		maximo := max;
	end;
					
	
	
	
	
	var
		a:arbol;
		lista2:lista;
		x:integer;
		max:real;
		act:lista;
	begin
		a:=nil;
		cargarArbol(a);
		lista2:=nil;
		x:= random(2)+1;
		writeln('x:',x);
		devolverCompras(a,lista2,x);
		act:=lista2;
		while (act<>nil) do begin
			writeln('Lista nueva: dia: ',act^.dato.dia);
			writeln('cantidad de productos: ',act^.dato.cantProd);
			writeln('Monto: ',act^.dato.monto);
			act:=act^.sig;
		end;
		max:=-1;
		writeln ('el monto maximo de la lista dos fue:', maximo(lista2,max));
	End.
		
		
