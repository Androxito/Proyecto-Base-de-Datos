Use Biblioteca
Go
create table dbo.DetallePrestamo(
IdDetallePrestamo int primary key identity(1,1) not null,
constraint fk_IdPrestamo foreign key (IdDetallePrestamo)
references dbo.DetallePrestamo (IdDetallePrestamo),
constraint fk_IdLibro  foreign key (IdDetallePrestamo)
references dbo.DetallePrestamo (IdDetallePrestamo),
);