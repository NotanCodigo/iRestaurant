alter table Almacen.Cliente add VentaRapida bit not null default 0;
alter table Almacen.Cliente add Editable bit not null default 1;
alter table Comun.Persona alter column Correo nvarchar(256) null;
alter table Almacen.TipoPago add VentaRapida bit not null default 0;