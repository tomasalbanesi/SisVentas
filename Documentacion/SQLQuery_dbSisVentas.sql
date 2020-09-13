-- TABLA CATEGORIA
create table categoria(
	idcategoria integer primary key identity,
	nombre varchar(50) not null unique,
	descripcion varchar(255) null,
	estado bit default(1)
);
go
-- TABLA ARTICULO
create table articulo(
	idarticulo integer primary key identity,
	idcategoria integer not null,
	codigo varchar(50) null,
	nombre varchar(100) not null unique,
	precio_venta decimal(11,2) not null,
	stock integer not null,
	descripcion varchar(255) null,
	imagen varchar(20) null,
	estado bit default(1),
	FOREIGN KEY (idcategoria) REFERENCES categoria(idcategoria)
);
go
-- TABLA PERSONA
create table persona(
	idpersona integer primary key identity,
	tipo_persona varchar(20) not null,
	nombre varchar(100) not null,
	tipo_documento varchar(20) null,
	num_documento varchar(20) null,
	direccion varchar(70) null,
	telefono varchar(20) null,
	email varchar(50) null,
);
