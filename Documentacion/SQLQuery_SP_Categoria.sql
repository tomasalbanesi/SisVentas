--Procedimiento Listar
create proc categoria_listar
as
select idcategoria as ID, nombre as Nombre, descripcion as Descripcion, estado as Estado
from categoria
order by idcategoria desc
go

--Procedimiento Buscar
create proc categoria_buscar
@valor varchar(50) -- Se lo tengo que enviar desde Visual Studio
as
select idcategoria as ID, nombre as Nombre, descripcion as Descripcion, estado as Estado
from categoria
where nombre like '%' + @valor + '%' Or descripcion like '%' + @valor + '%'
order by idcategoria asc
go

--Procedimiento Insertar
create proc categoria_insertar
@nombre varchar(50),
@descripcion varchar(255)
as
insert into categoria (nombre, descripcion) values (@nombre,@descripcion)
go

--Procedimiento Actualizar
create proc categoria_actualizar
@idcategoria int,
@nombre varchar(50),
@descripcion varchar(255)
as
update categoria set nombre=@nombre, descripcion=@descripcion
where idcategoria = @idcategoria
go

--Procedimiento Eliminar
create proc categoria_eliminar
@idcategoria int
as
delete from categoria
where idcategoria = @idcategoria
go

--Procedimiento Desactivar
create proc categoria_desactivar
@idcategoria int
as
update categoria set estado=0
where idcategoria = @idcategoria
go

--Procedimiento Activar
create proc categoria_activar
@idcategoria int
as
update categoria set estado=1
where idcategoria = @idcategoria
go