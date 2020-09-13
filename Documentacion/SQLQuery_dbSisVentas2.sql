-- TABLA ROL
create table rol(
	idrol integer primary key identity,
	nombre varchar(30) not null,
	descripcion varchar(255) null,
	estado bit default(1)
);
go
-- TABLA USUARIO
create table usuario(
	idusuario integer primary key identity,
	idrol integer not null,
	nombre varchar(100) not null,
	tipo_documento varchar(20) null,
	num_documento varchar(20) null,
	direccion varchar(70) null,
	telefono varchar(20) null,
	email varchar(50) not null,
	clave varbinary(MAX) not null,
	estado bit default(1),
	FOREIGN KEY (idrol) REFERENCES rol (idrol)
);
go
-- TABLA INGRESO
create table ingreso(
	idingreso integer primary key identity,
	idproveedor integer not null,
	idusuario integer not null,
	tipo_comprobante varchar(20) not null,
	serie_comprobante varchar(7) null,
	num_comprobante varchar(10) not null,
	fecha datetime not null,
	impuesto decimal (4,2) not null,
	total decimal (11,2) not null,
	estado varchar(20) not null,
	FOREIGN KEY (idproveedor) REFERENCES persona (idpersona),
	FOREIGN KEY (idusuario) REFERENCES usuario (idusuario)
);
go
-- TABLA DETALLE_INGRESO
create table detalle_ingreso(
	iddetalle_ingreso integer primary key identity,
	idingreso integer not null,
	idarticulo integer not null,
	cantidad integer not null,
	precio decimal(11,2) not null,
	FOREIGN KEY (idingreso) REFERENCES ingreso (idingreso) ON DELETE CASCADE,
	FOREIGN KEY (idarticulo) REFERENCES articulo (idarticulo)
);
go
-- TABLA VENTA
create table venta(
	idventa integer primary key identity,
	idcliente integer not null,
	idusuario integer not null,
	tipo_comprobante varchar(20) not null,
	serie_comprobante varchar(7) null,
	num_comprobante varchar(10) not null,
	fecha datetime not null,
	impuesto decimal (4,2) not null,
	total decimal (11,2) not null,
	estado varchar(20) not null,
	FOREIGN KEY (idcliente) REFERENCES persona (idpersona),
	FOREIGN KEY (idusuario) REFERENCES usuario (idusuario)
);
go
-- TABLA DETALLE_VENTA
create table detalle_venta(
	iddetalle_venta integer primary key identity,
	idventa integer not null,
	idarticulo integer not null,
	cantidad integer not null,
	precio decimal (11,2) not null,
	descuento decimal (11,2) not null,
	FOREIGN KEY (idventa) REFERENCES venta (idventa) ON DELETE CASCADE,
	FOREIGN KEY (idarticulo) REFERENCES articulo (idarticulo)
);
go