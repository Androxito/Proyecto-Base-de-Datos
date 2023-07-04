Use Biblioteca
Go
create table dbo.Prestamo(
IdPrestamo int primary key identity(1,1) not null,
Fecha_de_Pedido date not null,
Fecha_de_Entrega date not null,
Estatus char(1) not null,
constraint fk_IdUsuario  foreign key (IdPrestamo)
references dbo.Prestamo(IdPrestamo),
);