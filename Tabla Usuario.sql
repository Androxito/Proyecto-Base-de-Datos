Use Biblioteca
Go
create table dbo.Usuario(
IdUsuario  int primary key identity(1,1) not null,
Contraseña varchar(40)not null,
constraint fk_IdLector foreign key (IdUsuario)
references dbo.Usuario(IdUsuario),
);