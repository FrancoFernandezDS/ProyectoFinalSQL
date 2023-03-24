create schema negociosql;
use negociosql;
-- TABLA CLIENTES
create table clientes(
Cliente_id int not null auto_increment unique,
Nombre varchar(80) not null,
Apellido varchar(80) not null,
DNI int not null,
Email varchar(100),
Dirección varchar(80),
Teléfono varchar(25),
primary key (Cliente_id)
);
-- TABLA EMPLEADOS
create table empleados(
Empleado_id int not null auto_increment unique,
Nombre varchar(80) not null,
Apellido varchar(80) not null,
DNI int not null,
Teléfono varchar(25),
Email varchar(100),
primary key (Empleado_id)
);
-- TABLA PRODUCTOS
create table productos(
Producto_id int not null auto_increment unique,
Tipo_producto varchar(100) not null,
Precio int,
Stock_producto int,
primary key (Producto_id)
);
-- TABLA DATOS DEL NEGOCIO 
create table datos_negocio(
negocio_id int not null auto_increment unique,
cuit int not null,
dirección varchar(20) not null,
localidad varchar(80) not null,
codigo_postal int not null,
Email varchar(50),
celular int,
primary key (negocio_id)
);
-- TABLA PROVEEDORES
create table proveedores(
proveedor_id int not null auto_increment unique,
nombre varchar(80),
prov_de varchar(80),
celular int,
Email varchar(80),
primary key (proveedor_id)
);
-- TABLA COMPRAS
create table compras(
Compras_id int not null auto_increment unique,
Cliente_id int not null,
Producto_id int not null,
Fecha_compra date,
Precio_producto int,
cantidad int,
primary key (Compras_id),
foreign key (Cliente_id) references clientes (Cliente_id),
foreign key (Producto_id) references productos (Producto_id)
);
-- TABLA RECLAMOS
create table reclamos(
reclamo_id int not null auto_increment unique,
Cliente_id int not null,
Producto_id int not null,
falla_producto varchar(80), 
numero_fac int,
primary key (reclamo_id),
foreign key (Cliente_id) references clientes (Cliente_id),
foreign key (Producto_id) references productos (Producto_id)
);
-- TABLA PEDIDOS
create table pedidos(
pedido_id int not null auto_increment unique,
proveedor_id int not null,
pedido varchar(20),
cantidad int,
primary key (pedido_id),
foreign key (proveedor_id) references proveedores(proveedor_id)
);
-- TABLA CUOTAS ADEUDADAS
create table cuotas_adeudadas(
deuda_id int not null auto_increment unique,
compra_id int not null,
cant_cuotas int,
cuotas_vencidas int,
monto_cuotas int,
primary key (deuda_id),
foreign key (compra_id) references compras(Compras_id)
);
-- TABLA CLIENTES MOROSOS 
create table clientes_morosos(
moroso_id int not null auto_increment unique,
deuda_id int not null,
cliente_id int not null,
monto_deuda int,
fecha_deuda date,
primary key (moroso_id),
foreign key (deuda_id) references cuotas_adeudadas(deuda_id),
foreign key (cliente_id) references clientes (Cliente_id)
);
-- TABLA BITACORA
create table bitacora (
id int not null auto_increment primary key,
accion varchar(50),
fecha datetime,
id_insert int,
usuario varchar(50),
modificación_realizada varchar(25) 
);
-- INSERCIÓN DE DATOS 
-- DATOS TABLA CLIENTES
insert into clientes(Nombre, Apellido, DNI, Email, Dirección, Teléfono)
values('Denise','Jurado','40091945','denise@jurado.com','16 n 1324','2147483647');
insert into clientes(Nombre, Apellido, DNI, Email, Dirección, Teléfono)
values('Theo','Fernandez','45673332','theo@fernandez.com','56 n 798','2156723452');
insert into clientes(Nombre, Apellido, DNI, Email, Dirección, Teléfono)
values('Facundo','Chanes','40345629','facundo@chanes.com','33 n 201','2189456382');
insert into clientes(Nombre, Apellido, DNI, Email, Dirección, Teléfono)
values('Federico','Forciniti','38654039','federico@forciniti.com','32 n 445','2131642380');

-- DATOS TABLA EMPLEADOS
insert into empleados(Nombre, Apellido, DNI, Teléfono,Email)
values('Franco','Fernandez','41546032','2245687935','franco@fernandez.com');
insert into empleados(Nombre, Apellido, DNI, Teléfono,Email)
values('Dario','Andrik','32564043','2231958763','dario@andrik.com');
insert into empleados(Nombre, Apellido, DNI, Teléfono,Email)
values('Rogelio','Gaitan','27689440','2298302398','rogelio@gaitan.com');
insert into empleados(Nombre, Apellido, DNI, Teléfono,Email)
values('Juan','Aguero','42801098','2265398999','juan@aguero.com');

-- DATOS TABLA PRODUCTOS
insert into productos(Tipo_producto, Precio, Stock_producto)
values('Cocina Morelli ACERO','87000','50');
insert into productos(Tipo_producto, Precio, Stock_producto)
values('Termotanque 80lts','75000','38');
insert into productos(Tipo_producto, Precio, Stock_producto)
values('Cocina Longvie BLANCA','79000','68');
insert into productos(Tipo_producto, Precio, Stock_producto)
values('Led smart 50" TCL','125000','22');
insert into productos(Tipo_producto, Precio, Stock_producto)
values('Termotanque 50lts','59000','45');
insert into productos(Tipo_producto, Precio, Stock_producto)
values('Notebook Asus I7','295000','12');
insert into productos(Tipo_producto, Precio, Stock_producto)
values('Led smart 65" Samsung','235000','10');
insert into productos(Tipo_producto, Precio, Stock_producto)
values('Notebook Lenovo I3','198000','15');
insert into productos(Tipo_producto, Precio, Stock_producto)
values('Colchon Cannon 2p','99000','12');
insert into productos(Tipo_producto, Precio, Stock_producto)
values('Led smart 32" TCL','68000','50');

-- DATOS TABLA DATOS NEGOCIO
insert into datos_negocio(cuit, dirección, localidad, codigo_postal, Email, celular)
values('2020111222', 'calle 24 n 342', 'General Belgrano', '7223', 'negocio@gmail.com', '222134543');

-- DATOS TABLA PROVEEDORES
insert into proveedores(nombre, prov_de, celular, Email)
values('Juan Conte','televisores y nootebook','224321332','juan@conte.com');
insert into proveedores(nombre, prov_de, celular, Email)
values('Adrian Juares','termotanques y cocinas','112332122','adrian@juares.com');
insert into proveedores(nombre, prov_de, celular, Email)
values('Mauricio Bastian','colchones','112132119','mauricio@bastian.com');

-- DATOS TABLA COMPRAS
insert into compras(Cliente_id, Producto_id, Fecha_compra, Precio_producto, cantidad)
values('2','4','2023-01-01','125000','1');
insert into compras(Cliente_id, Producto_id, Fecha_compra, Precio_producto, cantidad)
values('1','6','2023-01-03','295000','1');
insert into compras(Cliente_id, Producto_id, Fecha_compra, Precio_producto,cantidad)
values('4','2','2023-01-05','75000','1');
insert into compras(Cliente_id, Producto_id, Fecha_compra, Precio_producto, cantidad)
values('2','1','2023-01-07','87000','1');
insert into compras(Cliente_id, Producto_id, Fecha_compra, Precio_producto,cantidad)
values('3','7','2023-01-07','235000','1');
insert into compras(Cliente_id, Producto_id, Fecha_compra, Precio_producto,cantidad)
values('1','10','2023-01-12','68000','1');
insert into compras(Cliente_id, Producto_id, Fecha_compra, Precio_producto,cantidad)
values('2','10','2023-01-15','68000','1');
insert into compras(Cliente_id, Producto_id, Fecha_compra, Precio_producto,cantidad)
values('4','9','2023-01-15','99000','1');
insert into compras(Cliente_id, Producto_id, Fecha_compra, Precio_producto,cantidad)
values('3','5','2023-01-15','59000','1');
insert into compras(Cliente_id, Producto_id, Fecha_compra, Precio_producto,cantidad)
values('3','8','2023-01-20','198000','1');
insert into compras(Cliente_id, Producto_id, Fecha_compra, Precio_producto,cantidad)
values('1','4','2023-01-21','125000','1');
insert into compras(Cliente_id, Producto_id, Fecha_compra, Precio_producto,cantidad)
values('2','5','2023-01-21','59000','1');

-- DATOS TABLA RECLAMOS
insert into reclamos(Cliente_id, Producto_id, falla_producto, numero_fac) 
values('3','5','no queda en piloto y se apaga','223');
insert into reclamos(Cliente_id, Producto_id, falla_producto, numero_fac) 
values('1','6','no carga','124');
insert into reclamos(Cliente_id, Producto_id, falla_producto, numero_fac) 
values('2','10','le aparecio una raya en el medio de la pantalla','220');
insert into reclamos(Cliente_id, Producto_id, falla_producto, numero_fac) 
values('4','9','se rompio resorte parte superior','139');

-- DATOS TABLA PEDIDOS
insert into pedidos(proveedor_id, pedido, cantidad)
values('1','televisor 32"','10');
insert into pedidos(proveedor_id, pedido, cantidad)
values('1','televisor 50"','5');
insert into pedidos(proveedor_id, pedido, cantidad)
values('3','colchon resorte 1,40','4');
insert into pedidos(proveedor_id, pedido, cantidad)
values('2','termotanque 80lts','10');

-- DATOS TABLA CUOTAS ADEUDADAS
insert into cuotas_adeudadas(compra_id, cant_cuotas, cuotas_vencidas, monto_cuotas)
values('5','10','3','23.500');
insert into cuotas_adeudadas(compra_id, cant_cuotas, cuotas_vencidas, monto_cuotas)
values('2','6','2','49.200');
insert into cuotas_adeudadas(compra_id, cant_cuotas, cuotas_vencidas, monto_cuotas)
values('10','12','6','16.500');
update cuotas_adeudadas set monto_cuotas = '23500' where deuda_id= 1;
update cuotas_adeudadas set monto_cuotas = '49200' where deuda_id= 2;
update cuotas_adeudadas set monto_cuotas = '16500' where deuda_id= 3;

-- DATOS TABLA CLIENTES MOROSOS
insert into clientes_morosos(deuda_id,cliente_id,monto_deuda,fecha_deuda)
values('3','3','99000','2023-01-20');
insert into clientes_morosos(deuda_id,cliente_id,monto_deuda,fecha_deuda)
values('2','1','98400','2023-01-03');
insert into clientes_morosos(deuda_id,cliente_id,monto_deuda,fecha_deuda)
values('1','3','70500','2023-01-07');

-- CREACIÓN VISTAS
create view listado_cliente
as
select Nombre, Apellido, Email, Teléfono
from clientes;

create view listado_empleados
as
select Nombre, Apellido, Teléfono, Email
from empleados;

create view info_negocio
as 
select cuit, dirección, localidad, codigo_postal, Email
from datos_negocio;

create view listado_productos
as
select Tipo_producto, Precio, Stock_producto
from productos;

create view listado_proveedores
as
select nombre, prov_de, celular, Email
from proveedores;

-- CREACIÓN FUNCIONES
-- función donde obtenemos la cantidad de compras hechas por el cliente según su ID.
delimiter $$
create function ver_compras (id int)
returns int
deterministic
begin
	declare resultado int;
	select count(*) into resultado from compras where Cliente_id = id; 
    return resultado;
end$$
delimiter ;

-- función donde podemos obtener el área de un círculo según su RADIO.
delimiter $$
create function circunferencia_circulo (radio float)
returns float 
deterministic
begin
	declare resultado float;
    declare pi float;
    set pi = 3.14;
    set resultado = pi * radio * radio;
    return resultado;
end$$
delimiter ;

-- CREACIÓN STORED PROCEDURES
-- insertar 1 para ordenar el precio del producto y en el segundo parametro ingresando ASC (ascendente) o DESC (descendente) para el tipo de orden 
delimiter //
create procedure sp_productos (in dato int, in asc_desc varchar(50))
begin
	declare errormensaje varchar(255);
    set errormensaje = 'Presionar 1 para ordenar y ASC ascendente o DESC desendente';
		if dato < 1 or dato > 1 and asc_desc != 'asc' or 'desc' then 
			signal sqlstate '45000'
			set message_text = errormensaje;
		else 
			if dato=1 then
				select Precio from productos order by Precio;
                if asc_desc = 'asc' then
					select Precio from productos order by Precio asc;
				else
					select Precio from productos order by Precio desc;
				end if;
			end if;
		end if;
end 
//

-- Con este Stored Procedures podemos hacer un registo de un nuevo cliente a travez de 6 parametros equivalentes a las filas de las tablas clientes
delimiter //
create procedure sp_cliente(in nom varchar(80), in ape varchar(80), in dni int, in email varchar(100), in dire varchar(80), in tel int)
begin
    insert into clientes (Nombre, Apellido, DNI, Email, Dirección, Teléfono) values (nom, ape, dni, email, dire, tel);
    
end
//

-- CREACIÓN TRIGGER
-- Trigger que genera una disminución del Stock del producto una vez realizada la compra 
delimiter //
create trigger tr_disminuir_stock before insert on compras
for each row 
begin 
update productos set Stock_producto= productos.Stock_producto - new.cantidad
where new.Producto_id= productos.Producto_id;
end ;

-- Trigger que inserta en una nueva tabla bitacora los datos ingresados y detallados 
delimiter //
create trigger tr_bitacora after insert on compras
for each row
begin 
insert into bitacora (accion, fecha, id_insert, usuario, modificación_realizada) values ('insert', now(),new.Compras_id, system_user(),'compras');
end//

-- Trigger que antes de borrar un producto, almacena la operación en tabla bitacora
delimiter //
create trigger tr_productos before delete on productos
for each row
begin
insert into bitacora (accion, fecha, id_insert, usuario, modificación_realizada) values ('delete', now(), old.Producto_id, system_user(),'productos');
end//

-- Trigger que despues de una actualización del producto, almacena la operación en tabla bitacora
delimiter //
create trigger tr_bitacora_prod after update on productos
for each row
begin 
insert into bitacora (accion, fecha, id_insert, usuario, modificación_realizada) values ('update', now(),new.Producto_id, system_user(),'productos');
end//

-- CREACIÓN DE SENTENCIAS
-- Primer usuario creado 
create user 'user1' identified by 'hola123';

show grants for  'user1';

-- Otorgamos permiso de lectura para el primer usuario creado 
grant select on negociosql.* to 'user1';

-- Segundo usuario creado 
create user 'user2' identified by 'hola1234';

show grants for  'user2';

-- Otorgamos permisos de lectura, inserción y modificación al segundo usuario creado 
grant select, insert, update on negociosql.* to 'user2';

-- CREACIÓN SUBLENGUAJE TCL
-- En esta primera tabla proveedores inserte cuatro registros nuevos iniciando previamente una transacción y en el final agregue un commit para que se guarden estos datos. 
-- En la línea 387 deje comentado un rollback por si no se tenía que insertar esos datos.
start transaction;

insert into proveedores(nombre, prov_de, celular, Email)
values('Nicolas Gomez','Tablet y Celulares','221265249','nicolas@gomez.com');

insert into proveedores(nombre, prov_de, celular, Email)
values('Daniel Diaz','Lavarropas y Heladeras','221459088','daniel@diaz.com');

insert into proveedores(nombre, prov_de, celular, Email)
values('Fernando Paz','Sonido (parlantes, amplificadores)','221233100','fernando@paz.com');

insert into proveedores(nombre, prov_de, celular, Email)
values('Luis Gonzalez','Herramientas','224399201','luis@gonzalez.com');

-- rollback;
commit;

-- En esta segunda tabla empleados inserto 8 nuevos datos y los dividí en dos savepoint. 
-- En la línea 422 deje comentado para borrar los primeros 4 registros que estan guardados en savepoint insertar4 y en la línea 423 deje comentado un commit para guardar cambios.
start transaction;

insert into empleados(Nombre, Apellido, DNI, Teléfono,Email) 
values('Gaston','Cordoba','36543999','2243330711','gaston@cordoba.com');

insert into empleados(Nombre, Apellido, DNI, Teléfono,Email)
values('Hernan','Del Rio','32500640','2241001989','hernande@delrio.com');

insert into empleados(Nombre, Apellido, DNI, Teléfono,Email)
values('Patricia','Capria','33021251','2245101099','patricia@capria.com');

insert into empleados(Nombre, Apellido, DNI, Teléfono,Email)
values('Soledad','Suanes','40091999','2212293880','soledad@suanes.com');

savepoint insertar4;

insert into empleados(Nombre, Apellido, DNI, Teléfono,Email)
values('Veronica','Ojeda','41546099','2245002389','veronica@ojeda.com');

insert into empleados(Nombre, Apellido, DNI, Teléfono,Email)
values('Jose','Rodriguez','35456434','2212035455','jose@rodriguez.com');

insert into empleados(Nombre, Apellido, DNI, Teléfono,Email)
values('Soledad','Fernandez','39833675','1110779032','soledad@fernandez.com');

insert into empleados(Nombre, Apellido, DNI, Teléfono,Email)
values('Facundo','Eijo','40559988','1177254088','facundo@eijo.com');

savepoint insertar8;

-- release savepoint insertar4;
-- commit;

