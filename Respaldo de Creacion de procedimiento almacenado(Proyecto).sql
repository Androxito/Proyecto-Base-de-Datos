create table dbo.Detalle_P
(
Id_Detalle_P int primary key,
Numero_de_Ficha nvarchar(20),
Id_Libro int,
constraint fk_Libro foreign key (Id_Libro) references dbo.Libro,
Id_Prestamo int,
constraint fk_Prestamo foreign key (Id_Prestamo) references dbo.Prestamo
)

insert into dbo.Detalle_P
(Id_Detalle_P,Numero_de_Ficha,Id_Libro,Id_Prestamo)
values('5','2157496','5','5')
--Creacion de procedimiento almacenado

select dp.Id_Detalle_P as Id_De_Detalle_de_Prestamo,l.Nom_Libro as Nombre_de_Libro,p.Estatus  from dbo.Detalle_P as dp
inner join dbo.Prestamo as p
on dp.Id_Prestamo=p.Id_Prestamo
inner join dbo.Libro as l
on dp.Id_Libro=l.Id_Libro
where p.Estatus='D'
order by l.Nom_Libro
go
--creacion de procedimiento almacenado
create procedure sp_Libro5
(
@Estatus char(1)=null
)
as
select dp.Id_Detalle_P as Id_De_Detalle_de_Prestamo,l.Nom_Libro as Nombre_de_Libro,p.Estatus  from dbo.Detalle_P as dp
inner join dbo.Prestamo as p
on dp.Id_Prestamo=p.Id_Prestamo
inner join dbo.Libro as l
on dp.Id_Libro=l.Id_Libro
where p.Estatus=@Estatus
order by l.Nom_Libro


execute sp_Libro5 'D'
--creacion de otra consulta multitabla
select dt.Numero_de_Ficha as Numero_de_Ficha,pr.Fecha_de_Entrega as Fecha_de_Entrega,li.ISBN as Numero_de_referencia,li.Nom_Autor as Nombre_de_Autor from dbo.Detalle_P as dt
inner join dbo.Prestamo as pr
on dt.Id_Prestamo=pr.Id_Prestamo
inner join dbo.Libro as li
on dt.Id_Libro=li.Id_Libro
where li.Nom_Autor='Federico Martinez'
order by li.Nom_Autor

select * from dbo.Detalle_P
go
--creacion de otro procedimiento almacenado
create procedure sp_autor1
(
@Numero_de_Ficha nvarchar(20)=null
)
as
select dt.Numero_de_Ficha as Numero_de_Ficha,pr.Fecha_de_Entrega as Fecha_de_Entrega,li.ISBN as Numero_de_referencia,li.Nom_Autor as Nombre_de_Autor from dbo.Detalle_P as dt
inner join dbo.Prestamo as pr
on dt.Id_Prestamo=pr.Id_Prestamo
inner join dbo.Libro as li
on dt.Id_Libro=li.Id_Libro
where dt.Numero_de_Ficha=@Numero_de_Ficha
order by li.Nom_Autor

execute sp_autor1 '4156317'

select * from dbo.Libro






