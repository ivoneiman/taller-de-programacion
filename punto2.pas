{ 2.- Implementar un programa que procese información de propiedades que están a la venta 
en una inmobiliaria. 
Se pide:
a) Implementar un módulo para almacenar en una estructura adecuada, las propiedades 
agrupadas por zona. Las propiedades de una misma zona deben quedar almacenadas 
ordenadas por tipo de propiedad. Para cada propiedad debe almacenarse el código, el tipo de 
propiedad y el precio total. De cada propiedad se lee: zona (1 a 5), código de propiedad, tipo 
de propiedad, cantidad de metros cuadrados y precio del metro cuadrado. La lectura finaliza 
cuando se ingresa el precio del metro cuadrado -1.
b) Implementar un módulo que reciba la estructura generada en a), un número de zona y un tipo de 
propiedad y retorne los códigos de las propiedades de la zona recibida y del tipo recibido. }

program estoyharto2;
const
type
subrango:1..5;

propiedad = record
	code:integer;
	tipo: string;
	precioTotal: real;
end;

lista = ^nodo;
nodo = record
	dato:propiedad;
	sig:lista;
end;

zonas = array [subrango] of lista;

procedure leerPropiedades (var p:propiedades)
var
zona:subrango;
mCuadrados:real;
precioM:real;
begin
	readln(zona);
	readln(p.code);
	readln(p.tipo);
	readln(mCuadrados);
	readln(precioM;)
	p.precioTotal := mCuadrados * precioM;
end;

procedure insertarOrdenado (var l:lista; p:propiedades);
var
nue,ant,act:lista;
begin
	new(nue);
	nue^.dato:=p;
	ant:= l;
	act:= l;
	
	while (act <> nil) and (act^.dato.tipo < p.tipo) do begin
		ant := act;
		act := act^.sig;
	end;
	
	if (ant = act) then
		l := nue;
	else
		ant^.sig := nue;
	nue^.sig := act
end;

procedure almacenar (var v:zonas)
var
i:integer;
begin
	leerPropiedades(p);
	v[i] := 
	
	
{programa principal}
var
i:integer;
v:zonas;
begin
	for i := 1 to 5 do
		v[i] := nil;
