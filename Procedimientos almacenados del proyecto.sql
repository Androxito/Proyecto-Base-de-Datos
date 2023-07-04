--creacion de procedimiento almacenado Insertar datos
create procedure sp_InsertarDatos(
@IdLibro int =null,
@NombredeLibro varchar (40)=null,
@NombredeAutor varchar (40)=null,
@Cantidad int =null,
@ISBN nvarchar(15)=null,
@FechadeCompra date=null,
@FechadeAdquisicion date=null
)
as
begin
insert into dbo.Libro values
(@IdLibro,@NombredeLibro,@NombredeAutor,@Cantidad,@ISBN,@FechadeCompra,@FechadeCompra)
end
go

select * from dbo.Libro


execute sp_InsertarDatos 0,'Escritura Griega','Guillermo del Toro',2,'8372495032','2020-11-02','2020-12-01'

--Creacion de procedimiento almacenado Modificar datos
select * from dbo.Lector
go
create procedure sp_Modificacion_de_datos5(
@NombredePersona varchar(40)=null,
@IdLector int=null,
@Direccion varchar(20)=null
)
as
begin
update dbo.Lector set Nom_de_Pers=@NombredePersona,Id_Lector=@IdLector,Direccion=@Direccion
where Id_Lector=@IdLector
end
go

execute sp_Modificacion_de_datos5  'Xochitult',1,'Avenida Siempre viva'
go
--Procedimiento alamacenado que elimine datos
create procedure sp_EliminaciondeDato1(
@IdLector int =null
)
as
	delete from dbo.Lector where Id_Lector=@IdLector
go

execute sp_EliminaciondeDato1 5
go
select * from dbo.Lector









select * from dbo.Prestamo
select * from dbo.Libro
select * from dbo.Detalle_P

--Vizualizacion de consulta multitabla -- dbo.Detalle_P as pd
select pd.Numero_de_Ficha,l.Id_Libro as Id_de_Libro,p.Estatus from dbo.Detalle_P as pd
inner join dbo.Prestamo as p
on pd.Id_Prestamo=p.Id_Prestamo
inner join dbo.Libro as l
on pd.Id_Libro=l.Id_Libro
where pd.Numero_de_Ficha='2156315'
order by Id_de_Libro
go
--Dirparador 1 
create trigger tr_Prestamo
on dbo.Prestamo for insert 
as 
begin 
declare @Libro as int 
declare @Cantidad as int 

set @Libro = (select Id_Prestamo from inserted)
set @Cantidad = (select @Cantidad from inserted)

update Libro
set Id_Libro = @Libro -@Cantidad
where Id_Libro like @Libro

end

insert into Libro (Id_Libro,Cantidad)
values(2,1)
