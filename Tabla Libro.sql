Use Biblioteca
Go
create table dbo.Libro(
IdLibro int primary key identity(1,1) not null,
Autor varchar(40) not null,
Nombre varchar(40) not null,
Cantidad varchar(40)not null,
ISBN varchar(15)not null,
Fecha_de_Compra date not null,
Fecha_de_Adquisicion date not null,
);