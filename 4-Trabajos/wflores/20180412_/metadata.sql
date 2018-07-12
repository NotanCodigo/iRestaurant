alter table Almacen.MovimientoAlmacen alter column IdProveedor int not null;
go
sp_rename 'Almacen.MovimientoAlmacen.IdProveedor', 'IdProveedorCliente', 'COLUMN';
go
alter table Almacen.Kardex alter column SecuenciaMovimiento int not null;
go