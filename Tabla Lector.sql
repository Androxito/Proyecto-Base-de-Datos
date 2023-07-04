Use Biblioteca
Go
create table dbo.Lector(
IdLector int primary key identity(1,1) not null,
Usuario varchar(40)not null,
Nombre varchar(40)not null,
Apellido varchar(40)not null,
Direccion text,
Telefono int,
);