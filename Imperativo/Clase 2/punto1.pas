program punto1;
const
	dimf=10;
type
	vector = array[1..dimf] of char;
	
	lista=^nodo;
	nodo = record
		dato:char;
		sig:lista;
	end;
	
	{	a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los
			almacene en un vector con dimensión física igual a 10 y retorne el vector.}
	procedure incisoA (var v:vector; var diml:integer);
	var
		s:char;
	begin
		writeln('---');
		writeln('Ingrese un caracter');
		readln(s);
		if (diml <= dimf) and (s <> '.') then begin
			v[diml] := s;
			writeln('---');
			writeln('Se agrego un elemento al vector en la posicion ', diml);
			diml:=diml+1;
			incisoA(v,diml);
		end;
	end;
	
	{b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.}
	procedure incisoB (v:vector;diml:integer; i:integer);
	begin
		for i:= 1 to diml do
			writeln('valor: ', v[i]);
	end;
	
	{c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.}
	procedure incisoC (v:vector;diml:integer; i:integer);
	begin
		if (i <= diml) then begin
			writeln(v[i]);
			i:=i+1;
			incisoB(v,diml,i);
		end;
	end;
	
	{d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
	retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.}
	
	function incisoD ():integer;
	var
		c:char;
	begin
		writeln('---');
		writeln ('ingrese un nuevo caracter');
		readln (c);
		if (c <> '.') then
			incisoD := 1 + incisoD()
		else
			incisoD:=0;
	end;
	
	{e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
	retorne una lista con los caracteres leídos.

	f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el
	mismo orden que están almacenados.
	g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de
	la lista en orden inverso al que están almacenados.}
	
	procedure CargarLista (var l:lista);
	var caracter: char;
    nuevo: lista;
	begin
		write ('Ingrese un caracter para la lista: ');
		readln(caracter);  
		if (caracter <> '.' )  
		then begin
			 CargarLista (l);
			 new (nuevo);
			 nuevo^.dato:= caracter;
			 nuevo^.sig:= l;
			 l:= nuevo;
			 writeln('se agergo un nuevo caracter a la lista')
		end
		else
			l:= nil
	end;
	
	procedure imprimirEnOrden (l:lista);
	begin
		if (l <> nil) then begin
			writeln(l^.dato);
			imprimirEnOrden(l^.sig);
		end;
	end;
	
	procedure imprimirInverso (l:lista);
	begin
		if (l <> nil) then begin
			imprimirInverso(l^.sig);
			writeln(l^.dato);
		end;
	end;
	
				
	
	
	
var
	diml:integer;
	v:vector;
	i:integer;
	l:lista;
begin
	i:=1;
	diml:=0;
	l:=nil;
	incisoA(v,diml);
	writeln('---');
	writeln('imprimir vector: ');
	incisoB(v,diml,i);
	writeln('---');
	writeln('imprivir vector C: ');
	incisoC(v,diml,i);
	writeln('---');
	writeln(incisoD(),' Es la cantidad de caracteres leidos en el inciso D');
	CargarLista(l);
	writeln('Imprimir en orden: ');
	imprimirEnOrden(l);
	writeln('Imprimir en orden inverso: ');
	imprimirInverso(l)
End.
			
