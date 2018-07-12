--- Venta y Compra Rápida
SET IDENTITY_INSERT [Seguridad].[Aplicacion] ON 
GO

INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (40, N'Compra', 22, 'Compra', 'Registrar', 1, 1, 1001, null, 'Movimiento')
GO

INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (41, N'Venta', 22, 'Venta', 'Registrar', 1, 2, 1001, null, 'Movimiento')
GO

SET IDENTITY_INSERT [Seguridad].[Aplicacion] OFF
GO

-- Permisos
insert into Seguridad.AplicacionOpcion(IdAplicacion, IdOpcion, Activo)
SELECT app.id, opc.id, 1 FROM Seguridad.Aplicacion app
inner join Seguridad.Opcion opc on app.Estado = opc.Estado
WHERE IdPadre > 0 and EsMenu = 1 and app.id in (40,41)
order by app.id, opc.id;


update Seguridad.Aplicacion set Orden = 3 where Id = 23;
update Seguridad.Aplicacion set Orden = 3 where Id = 24;
update Seguridad.Aplicacion set Orden = 3 where Id = 31;

-- Movimiento de Venta
update Almacen.Movimiento set OpEsSalidaVenta = 1 where Nombre = 'Salida por Ventas';