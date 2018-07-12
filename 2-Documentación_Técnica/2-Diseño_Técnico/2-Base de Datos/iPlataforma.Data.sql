USE [iPlataforma];
GO

--Data: 
 
 /**/
 delete from General.Multitabla;
 go
 --Multitabla.Estados
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1000, 0, 'EstadosPlataforma', null, null, 1);
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1001, 1000, 'Activo', null, null, 1);
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1002, 1000, 'Eliminado', null, null, 1);
 --INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1003, 1000, 'Eliminado', null, null, 1);
 
 --Multitabla.TipoOpcion
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1100, 0, 'TipoOpcion', null, null, 1);
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1101, 1100, 'Opcion', null, null, 1);
 --INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1102, 1100, 'Filtro', null, null, 1);
 
 --Multitabla.TipoRol
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1200, 0, 'TipoRol', null, null, 1);
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1201, 1200, 'Propietario', null, null, 1);
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1202, 1200, 'Colaborador', null, null, 1);
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1203, 1200, 'Lector', null, null, 1);
 
 --Multitabla.TipoDocumento
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1300, 0, 'TipoDocumento', null, null, 1);
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1301, 1300, 'DNI', null, null, 1);
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1302, 1300, 'RUC', null, null, 1);
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1303, 1300, 'CEX', null, null, 1);
 
 --Multitabla.TipoPersona
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1400, 0, 'TipoPersona', null, null, 1);
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1401, 1400, 'Natural', null, null, 1);
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1402, 1400, 'Jurídica', null, null, 1);
 
 --Multitabla.TipoAccion
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1500, 0, 'TipoAccion', null, null, 1); 
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1502, 1500, 'Insertar', null, null, 1);
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1503, 1500, 'Actualizar', null, null, 1);
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1504, 1500, 'Eliminar', null, null, 1);
 
 -- Tipos de Movimiento: I S T
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1600, 0, 'TipoMovimiento', null, null, 1);
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1601, 1600, 'Ingreso', null, null, 1);
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1602, 1600, 'Salida', null, null, 1);
 INSERT INTO General.Multitabla(id, IdPadre, Nombre, Keys, Valor, Activo) VALUES(1603, 1600, 'Transferencia', null, null, 1);

--Seguridad.Aplicaciones
delete from [Seguridad].[Aplicacion]
go

SET IDENTITY_INSERT [Seguridad].[Aplicacion] ON 
GO
INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (1, N'Gestionar Plataforma', 0, NULL, NULL, 1, 1, 1001, NULL, null)
GO
INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (2, N'Gestionar Almacen', 0, NULL, NULL, 1, 2, 1001, NULL, null)
GO
INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (3, N'Empresa', 1, N'EmpresaBandeja', N'Index', 0, 1, 1001, NULL, null)
GO
INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (4, N'Tipo de Productos', 25, N'TipoProductoBandeja', N'Index', 1, 1, 1001, N'Tipo de Productos', 'Almacen')
GO
INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (5, N'Familia de Productos', 25, N'FamiliaProductoBandeja', N'Index', 1, 2, 1001, NULL, 'Almacen')
GO
INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (6, N'Marcas', 25, N'MarcaBandeja', N'Index', 1, 3, 1001, NULL, 'Almacen')
GO
INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (7, N'Parametros', 25, N'ParametroBandeja', N'Index', 1, 4, 1001, NULL, 'Almacen')
GO
INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (8, N'Tipo de Movimiento', 25, N'TipoMovimientoBandeja', N'Index', 1, 5, 1001, NULL, 'Almacen')
GO
INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (9, N'Unidades de Medida', 25, N'UnidadMedidaBandeja', N'Index', 1, 6, 1001, NULL, 'Almacen')
GO
INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (10, N'Gestionar Seguridad', 0, NULL, NULL, 1, 3, 1001, NULL, NULL)
GO
INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (11, N'Usuarios', 10, N'UsuarioBandeja', N'Index', 1, 1, 1001, NULL, NULL)
GO
INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (12, N'Roles', 10, N'RolBandeja', N'Index', 1, 2, 1001, NULL, NULL)
GO

INSERT [Seguridad].[Aplicacion] ([Id], [IdPadre], [Nombre], [Descripcion], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Modulo]) VALUES (13, 10, N'Aplicación', NULL, N'AplicacionBandeja', N'Index', 0, 3, 1001, NULL)
GO
INSERT [Seguridad].[Aplicacion] ([Id], [IdPadre], [Nombre], [Descripcion], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Modulo]) VALUES (14, 10, N'Transacción', N'Gestión de Transacciones', N'TransaccionBandeja', N'Index', 0, 4, 1001, NULL)
GO
INSERT [Seguridad].[Aplicacion] ([Id], [IdPadre], [Nombre], [Descripcion], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Modulo]) VALUES (15, 2, N'Productos', N'Gestión de Productos', N'ProductoBandeja', N'Index', 1, 0, 1001, 'Almacen')
GO

INSERT [Seguridad].[Aplicacion] ([Id], [IdPadre], [Nombre], [Descripcion], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Modulo]) VALUES (16, 2, N'Almacenes', N'Gestión de Almacenes', N'AlmacenBandeja', N'Index', 1, 1, 1001, 'Almacen')
GO

INSERT [Seguridad].[Aplicacion] ([Id], [IdPadre], [Nombre], [Descripcion], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Modulo]) VALUES (17, 25, N'Parametro x Producto', N'Gestión de Parametros de Búsqueda de Producto', N'ParametroProductoBandeja', N'Index', 0, 1, 1001, 'Almacen')
GO

INSERT [Seguridad].[Aplicacion] ([Id], [IdPadre], [Nombre], [Descripcion], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Modulo]) VALUES (18, 25, N'Producto x Almacén', N'Gestión de Producto x Almacén', N'AlmacenStockBandeja', N'Index', 0, 1, 1001, 'Almacen')
GO

INSERT [Seguridad].[Aplicacion] ([Id], [IdPadre], [Nombre], [Descripcion], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Modulo]) VALUES (19, 2, N'Proveedores', N'Gestión de Proveedores', N'ProveedorBandeja', N'Index', 1, 1, 1001, 'Almacen')
GO

INSERT [Seguridad].[Aplicacion] ([Id], [IdPadre], [Nombre], [Descripcion], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Modulo]) VALUES (20, 2, N'Clientes', N'Gestión de Clientes', N'ClienteBandeja', N'Index', 1, 1, 1001, 'Almacen')
GO

INSERT [Seguridad].[Aplicacion] ([Id], [IdPadre], [Nombre], [Descripcion], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Modulo]) VALUES (21, 2, N'Movimientos', N'Gestión de Movimientos', N'MovimientoBandeja', N'Index', 1, 2, 1001, 'Almacen')
GO

INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (22, N'Gestionar Movimientos', 0, NULL, NULL, 1, 3, 1001, NULL, NULL)
GO

INSERT [Seguridad].[Aplicacion] ([Id], [IdPadre], [Nombre], [Descripcion], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Modulo]) VALUES (23, 22, N'Movimientos de Salida', N'Gestión de Movimientos de Salida', N'MovimientoAlmacenBandeja', N'BuscarSalidas', 1, 2, 1001, NULL)
GO

INSERT [Seguridad].[Aplicacion] ([Id], [IdPadre], [Nombre], [Descripcion], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Modulo]) VALUES (24, 22, N'Movimientos de Ingreso', N'Gestión de Movimientos de Ingreso', N'MovimientoAlmacenBandeja', N'BuscarIngresos', 1, 1, 1001, NULL)
GO

--SET IDENTITY_INSERT [Seguridad].[Aplicacion] ON 
--GO

INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (25, N'Gestionar Maestros', 0, NULL, NULL, 1, 4, 1001, NULL, null)
GO

INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (26, N'Generos', 25, N'GeneroBandeja', N'Index', 1, 3, 1001, NULL, 'Almacen')
GO

INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (27, N'Presentación', 25, N'PresentacionBandeja', N'Index', 1, 3, 1001, NULL, 'Almacen')
GO

SET IDENTITY_INSERT [Seguridad].[Aplicacion] OFF
GO

--Opciones.Opcion
INSERT INTO Seguridad.Opcion(TipoOpcion, Nombre, Estado) values(1101, 'Buscar', 1001);
INSERT INTO Seguridad.Opcion(TipoOpcion, Nombre, Estado) values(1101, 'Limpiar', 1001);
INSERT INTO Seguridad.Opcion(TipoOpcion, Nombre, Estado) values(1101, 'Nuevo', 1001);
INSERT INTO Seguridad.Opcion(TipoOpcion, Nombre, Estado) values(1101, 'Modificar', 1001);
INSERT INTO Seguridad.Opcion(TipoOpcion, Nombre, Estado) values(1101, 'Eliminar', 1001);
INSERT INTO Seguridad.Opcion(TipoOpcion, Nombre, Estado) values(1101, 'Guardar', 1001);

--Empresa Administradora
--INSERT INTO General.Empresa(NombreComercial, Email) values ('Administradora de Plataforma','winstonflores30@gmail.com');


-- Transacciones
delete from [Seguridad].[Transaccion]
go
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10010, 4, N'Tx.TipoProducto.Agregar', N'TipoProducto_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10011, 4, N'Tx.TipoProducto.Modificar', N'TipoProducto_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10012, 4, N'Tx.TipoProducto.Eliminar', N'TipoProducto_Eliminar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10020, 5, N'Tx.FamiliaDeProducto.Agregar', N'FamiliaDeProducto_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10021, 5, N'Tx.FamiliaDeProducto.Modificar', N'FamiliaDeProducto_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10022, 5, N'Tx.FamiliaDeProducto.Eliminar', N'FamiliaDeProducto_Eliminar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10030, 6, N'Tx.Marca.Agregar', N'Marca_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10031, 6, N'Tx.Marca.Modificar', N'Marca_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10032, 6, N'Tx.Marca.Eliminar', N'Marca_Eliminar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10040, 7, N'Tx.Parametro.Agregar', N'Parametro_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10041, 7, N'Tx.Parametro.Modificar', N'Parametro_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10042, 7, N'Tx.Parametro.Eliminar', N'Parametro_Eliminar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10050, 8, N'Tx.TipoDeMovimiento.Agregar', N'TipoDeMovimiento_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10051, 8, N'Tx.TipoDeMovimiento.Modificar', N'TipoDeMovimiento_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10052, 8, N'Tx.TipoDeMovimiento.Eliminar', N'TipoDeMovimiento_Eliminar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10060, 9, N'Tx.UnidadDeMedida.Agregar', N'UnidadDeMedida_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10061, 9, N'Tx.UnidadDeMedida.Modificar', N'UnidadDeMedida_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10062, 9, N'Tx.UnidadDeMedida.Eliminar', N'UnidadDeMedida_Eliminar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10070, 11, N'Tx.Opcion.Agregar', N'Opcion_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10071, 11, N'Tx.Opcion.Modificar', N'Opcion_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10072, 11, N'Tx.Opcion.Eliminar', N'Opcion_Eliminar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10080, 12, N'Tx.Rol.Agregar', N'Rol_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10081, 12, N'Tx.Rol.Modificar', N'Rol_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10082, 12, N'Tx.Rol.Eliminar', N'Rol_Eliminar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10090, 13, N'Tx.Aplicacion.Agregar', N'Aplicacion_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10091, 13, N'Tx.Aplicacion.Modificar', N'Aplicacion_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10092, 13, N'Tx.Aplicacion.Eliminar', N'Aplicacion_Eliminar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10100, 14, N'Tx.Transaccion.Agregar', N'Transaccion_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10101, 14, N'Tx.Transaccion.Modificar', N'Transaccion_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10102, 14, N'Tx.Transaccion.Eliminar', N'Transaccion_Eliminar', 1001)
GO
--INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10110, 1015, N'Tx.Usuario.Agregar', N'Usuario_Agregar', 1001)
--GO
--INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10111, 1015, N'Tx.Usuario.Modificar', N'Usuario_Modificar', 1001)
--GO
--INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10112, 1015, N'Tx.Usuario.Eliminar', N'Usuario_Eliminar', 1001)
--GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10120, 3, N'Tx.Empresa.Agregar', N'Empresa_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10121, 3, N'Tx.Empresa.Modificar', N'Empresa_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10122, 3, N'Tx.Empresa.Eliminar', N'Empresa_Eliminar', 1001)
GO

INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES 
  (10130, 15, 'Tx.Producto.Agregar', 'Producto_Agregar', 1001),
  (10131, 15, 'Tx.Producto.Modificar', 'Producto_Modificar', 1001),
  (10132, 15, 'Tx.Producto.Eliminar', 'Producto_Eliminar', 1001),

  (10140, 16, 'Tx.Almacen.Agregar', 'Almacen_Agregar', 1001),
  (10141, 16, 'Tx.Almacen.Modificar', 'Almacen_Modificar', 1001),
  (10142, 16, 'Tx.Almacen.Eliminar', 'Almacen_Eliminar', 1001),
  
  (10150, 17, 'Tx.ParametroProducto.Agregar', 'ParametroProducto_Agregar', 1001),
  (10151, 17, 'Tx.ParametroProducto.Modificar', 'ParametroProducto_Modificar', 1001),
  (10152, 17, 'Tx.ParametroProducto.Eliminar', 'ParametroProducto_Eliminar', 1001),
  
  (10160, 18, 'Tx.AlmacenStock.Agregar', 'AlmacenStock_Agregar', 1001),
  (10161, 18, 'Tx.AlmacenStock.Modificar', 'AlmacenStock_Modificar', 1001),
  (10162, 18, 'Tx.AlmacenStock.Eliminar', 'AlmacenStock_Eliminar', 1001),
  
  
  (10170, 18, 'Tx.Proveedor.Agregar', 'Proveedor_Agregar', 1001),
  (10171, 18, 'Tx.Proveedor.Modificar', 'Proveedor_Modificar', 1001),
  (10172, 18, 'Tx.Proveedor.Eliminar', 'Proveedor_Eliminar', 1001)
GO

INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10180, 20, N'Tx.Cliente.Agregar', N'Cliente_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10181, 20, N'Tx.Cliente.Modificar', N'Cliente_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10182, 20, N'Tx.Cliente.Eliminar', N'Cliente_Eliminar', 1001)
GO

INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10190, 21, N'Tx.Movimiento.Agregar', N'Movimiento_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10191, 21, N'Tx.Movimiento.Modificar', N'Movimiento_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10192, 21, N'Tx.Movimiento.Eliminar', N'Movimiento_Eliminar', 1001)
GO

INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10200, 23, N'Tx.MovimientoIngreso.Agregar', N'MovimientoIngreso_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10201, 23, N'Tx.MovimientoIngreso.Modificar', N'MovimientoIngreso_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10202, 23, N'Tx.MovimientoIngreso.Eliminar', N'MovimientoIngreso_Eliminar', 1001)
GO

INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10210, 24, N'Tx.MovimientoSalida.Agregar', N'MovimientoSalida_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10211, 24, N'Tx.MovimientoSalida.Modificar', N'MovimientoSalida_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10212, 24, N'Tx.MovimientoSalida.Eliminar', N'MovimientoSalida_Eliminar', 1001)
GO

INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10220, 23, N'Tx.MovimientoIngresoDetalle.Agregar', N'MovimientoIngresoDetalle_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10221, 23, N'Tx.MovimientoIngresoDetalle.Modificar', N'MovimientoIngresoDetalle_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10222, 23, N'Tx.MovimientoIngresoDetalle.Eliminar', N'MovimientoIngresoDetalle_Eliminar', 1001)
GO

INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10230, 24, N'Tx.MovimientoSalidaDetalle.Agregar', N'MovimientoSalidaDetalle_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10231, 24, N'Tx.MovimientoSalidaDetalle.Modificar', N'MovimientoSalidaDetalle_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10232, 24, N'Tx.MovimientoSalidaDetalle.Eliminar', N'MovimientoSalidaDetalle_Eliminar', 1001)
GO

INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10240, 25, N'Tx.Genero.Agregar', N'Genero_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10241, 25, N'Tx.Genero.Modificar', N'Genero_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10242, 25, N'Tx.Genero.Eliminar', N'Genero_Eliminar', 1001)
GO

INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10250, 25, N'Tx.Presentacion.Agregar', N'Presentacion_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10251, 25, N'Tx.Presentacion.Modificar', N'Presentacion_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10252, 25, N'Tx.Presentacion.Eliminar', N'Presentacion_Eliminar', 1001)
GO

SET IDENTITY_INSERT [Seguridad].[Aplicacion] ON 
GO

INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (28, N'Consultas', 0, NULL, NULL, 1, 5, 1001, NULL, null)
GO
INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (29, N'Stock Productos', 28, N'StockProductoBandeja', N'Index', 1, 1, 1001, NULL, 'Consulta')
GO

SET IDENTITY_INSERT [Seguridad].[Aplicacion] OFF
GO

-- Aplicacion - Opcion
insert into Seguridad.AplicacionOpcion(IdAplicacion, IdOpcion, Activo)
SELECT app.id, opc.id, 1 FROM Seguridad.Aplicacion app
inner join Seguridad.Opcion opc on app.Estado = opc.Estado
WHERE IdPadre > 0 and EsMenu = 1 --and app.id > 27
order by app.id, opc.id;


-- ******************* PASE: 20170617 *****************

-- Eliminar Tipos de Movimiento de las aplicaciones
delete from [Seguridad].[Transaccion] where [Id] in (10050, 10051, 10052) and [IdAplicacion] = 8
go
delete from [Seguridad].RolAplicacionOpcion where IdAplicacion = 8
go
delete from [Seguridad].AplicacionOpcion where IdAplicacion = 8
go
delete from [Seguridad].Aplicacion where id = 8
go
-- Agregar movimientos por defecto a las empresas ya registradas

-- Cambiar el nombre del módulo de 'Tipo de Productos' por 'Procedencia de Productos'
update Seguridad.Aplicacion set Nombre = 'Procedencia de Productos', Descripcion = 'Procedencia de Productos' where Id = 4 and IdPadre = 25;

-- Actualiza los tipos de movimiento
update Almacen.Movimiento set IdTipoMovimiento = 1601 where IdTipoMovimiento = 1;
update Almacen.Movimiento set IdTipoMovimiento = 1602 where IdTipoMovimiento = 2;
update Almacen.Movimiento set IdTipoMovimiento = 1603 where IdTipoMovimiento = 3;


-- ******************* PASE: 20170626 *****************


update General.Multitabla set Nombre = 'Administrador' where Id = 1201
go
update General.Multitabla set Nombre = 'Empleado' where Id = 1202
go
update General.Multitabla set Activo = 0 where Id = 1203
go


-- ******************* PASE: 20170703 *****************


-- Todos desabilitados por default
update Seguridad.Usuario set EsPropietario = 0;

-- Cursor
DECLARE @BusinessEntityID as INT;
 
DECLARE @BusinessCursor as CURSOR;
 
SET @BusinessCursor = CURSOR FOR
select min(usu.Id) from Seguridad.Usuario usu
inner join Seguridad.UsuarioRol uro on usu.Id = uro.IdUsuario
inner join Seguridad.Rol rol on uro.Id = rol.Id
where rol.EsEditable = 0
group by usu.IdEmpresa;
 
OPEN @BusinessCursor;
FETCH NEXT FROM @BusinessCursor INTO @BusinessEntityID;
 
WHILE @@FETCH_STATUS = 0
BEGIN
 
 PRINT cast(@BusinessEntityID as VARCHAR (50));

 update Seguridad.Usuario set EsPropietario = 1
 where Id = @BusinessEntityID;

 FETCH NEXT FROM @BusinessCursor INTO @BusinessEntityID;
END
 
CLOSE @BusinessCursor;
DEALLOCATE @BusinessCursor;


-- ******************* PASE: 20171130 *****************


SET IDENTITY_INSERT [Seguridad].[Aplicacion] ON 
GO

INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (30, N'Movimiento Productos', 28, N'MovimientoProductoBandeja', N'Index', 1, 1, 1001, NULL, 'Consulta')
GO

SET IDENTITY_INSERT [Seguridad].[Aplicacion] OFF
GO

-- Aplicacion - Opcion
insert into Seguridad.AplicacionOpcion(IdAplicacion, IdOpcion, Activo)
SELECT app.id, opc.id, 1 FROM Seguridad.Aplicacion app
inner join Seguridad.Opcion opc on app.Estado = opc.Estado
WHERE IdPadre > 0 and EsMenu = 1 and app.id > 29
order by app.id, opc.id;


-- ******************* PASE: 20171201 *****************


update Almacen.Movimiento set Nombre = General.MayusculasEnCadaPalabra(Nombre);


-- ******************* PASE: 20180214 *****************


-- Aplicaciones
SET IDENTITY_INSERT [Seguridad].[Aplicacion] ON 
GO

INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (31, N'Transferencias', 22, 'TransferenciaAlmacenBandeja', 'Buscar', 1, 3, 1001, 'Transferencia de productos entre almacenes', null)
GO
INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (32, N'Operaciones', 0, null, null, 1, 5, 1001, null, null)
GO
INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (33, N'Ordenes de despacho', 32, 'DespachoBandeja', 'Buscar', 1, 1, 1001, null, null)
GO

SET IDENTITY_INSERT [Seguridad].[Aplicacion] OFF
GO

-- Transacciones
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10260, 24, N'Tx.MovimientoAlmacenDetalleTemp.Agregar', N'MovimientoAlmacenDetalleTemp_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10261, 24, N'Tx.MovimientoAlmacenDetalleTemp.Modificar', N'MovimientoAlmacenDetalleTemp_Modificar', 1001)
GO

INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10270, 31, N'Tx.Transferencia.Agregar', N'Transferencia_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10280, 31, N'Tx.TransferenciaDetalle.Agregar', N'TransferenciaDetalle_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10290, 33, N'Tx.Despacho.Agregar', N'Despacho_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10291, 33, N'Tx.Despacho.Modificar', N'Despacho_Modificar', 1001)
GO

INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10300, 33, N'Tx.DespachoDetalle.Agregar', N'DespachoDetalle_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10301, 33, N'Tx.DespachoDetalle.Modificar', N'DespachoDetalle_Modificar', 1001)
GO

-- Permisos
insert into Seguridad.AplicacionOpcion(IdAplicacion, IdOpcion, Activo)
SELECT app.id, opc.id, 1 FROM Seguridad.Aplicacion app
inner join Seguridad.Opcion opc on app.Estado = opc.Estado
WHERE IdPadre > 0 and EsMenu = 1 and app.id in (33,31)
order by app.id, opc.id;

-- Multitabla: TipoEntrega y EstadosDespacho
insert into General.Multitabla(Id, IdPadre, Nombre, Keys, Valor, Activo) values
(1700, 0, 'TipoEntrega', null, null, 1),
(1701, 1700, 'Manual', null, null, 1),
(1702, 1700, 'Automatico', null, null, 1),

(1800, 0, 'EstadosDespacho', null, null, 1),
(1801, 1800, 'Pendiente de Entrega', null, null, 1),
(1802, 1800, 'Entrega Parcial', null, null, 1),
(1803, 1800, 'Entregado', null, null, 1)
go


-- ******************* PASE: 20180302 *****************

update Seguridad.Aplicacion set Controlador = 'MovimientoIngresoBandeja', Accion = 'Buscar', Orden = 1 where Nombre = 'Movimientos de Ingreso';
update Seguridad.Aplicacion set Controlador = 'MovimientoSalidaBandeja', Accion = 'Buscar', Orden = 2 where Nombre = 'Movimientos de Salida';


-- ******************* PASE: 20180305 *****************


-- Nueva aplicacion: TipoDocumentoAlmacen

SET IDENTITY_INSERT [Seguridad].[Aplicacion] ON 
GO

INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (34, N'Series y Correlativos', 2, 'TipoDocumentoMovimientoAlmacenBandeja', 'Buscar', 1, 7, 1001, NULL, 'Almacen')
GO

SET IDENTITY_INSERT [Seguridad].[Aplicacion] OFF
GO

-- Transacciones
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10310, 34, N'Tx.TipoDocumentoAlmacen.Agregar', N'TipoDocumentoAlmacen_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10311, 34, N'Tx.TipoDocumentoAlmacen.Modificar', N'TipoDocumentoAlmacen_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10312, 34, N'Tx.TipoDocumentoAlmacen.Eliminar', N'TipoDocumentoAlmacen_Eliminar', 1001)
GO

-- Permisos
insert into Seguridad.AplicacionOpcion(IdAplicacion, IdOpcion, Activo)
SELECT app.id, opc.id, 1 FROM Seguridad.Aplicacion app
inner join Seguridad.Opcion opc on app.Estado = opc.Estado
WHERE IdPadre > 0 and EsMenu = 1 and app.id = 34
order by app.id, opc.id;


-- Estado de pagos
insert into General.Multitabla(id, IdPadre, Nombre, Activo) values
(1900, 0, 'Estados de Pagos', 1),
(1901, 1900, 'Pendiente', 1),
(1902, 1900, 'Cancelado', 1),
(1903, 1900, 'Anulado', 1);


-- Pagos--------------

SET IDENTITY_INSERT [Seguridad].[Aplicacion] ON 
GO

INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (35, N'Pagos', 32, 'PagoBandeja', 'Buscar', 1, 2, 1001, NULL, null)
GO

SET IDENTITY_INSERT [Seguridad].[Aplicacion] OFF
GO

-- Transacciones
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10410, 35, N'Tx.Pago.Agregar', N'Pago_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10411, 35, N'Tx.Pago.Modificar', N'Pago_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10412, 35, N'Tx.Pago.Eliminar', N'Pago_Eliminar', 1001)
GO

-- Permisos
insert into Seguridad.AplicacionOpcion(IdAplicacion, IdOpcion, Activo)
SELECT app.id, opc.id, 1 FROM Seguridad.Aplicacion app
inner join Seguridad.Opcion opc on app.Estado = opc.Estado
WHERE IdPadre > 0 and EsMenu = 1 and app.id = 35
order by app.id, opc.id;


--- Catalogos
SET IDENTITY_INSERT [Seguridad].[Aplicacion] ON 
GO

INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (36, N'Catálogos', 2, 'CatalogoBandeja', 'Buscar', 1, 0, 1001, null, 'Campana')
GO

SET IDENTITY_INSERT [Seguridad].[Aplicacion] OFF
GO

-- Transacciones
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10510, 36, N'Tx.Catalogo.Agregar', N'Catalogo_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10511, 36, N'Tx.Catalogo.Modificar', N'Catalogo_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10512, 36, N'Tx.Catalogo.Eliminar', N'Catalogo_Eliminar', 1001)
GO

-- Permisos
insert into Seguridad.AplicacionOpcion(IdAplicacion, IdOpcion, Activo)
SELECT app.id, opc.id, 1 FROM Seguridad.Aplicacion app
inner join Seguridad.Opcion opc on app.Estado = opc.Estado
WHERE IdPadre > 0 and EsMenu = 1 and app.id = 36
order by app.id, opc.id;



--- 
--- Tipo Doc y Pago
SET IDENTITY_INSERT [Seguridad].[Aplicacion] ON 
GO

INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (37, N'Tipo Documentos', 25, 'TipoDocumentoBandeja', 'Buscar', 1, 10, 1001, null, 'Maestro')
GO
INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (38, N'Tipo Pagos', 25, 'TipoPagoBandeja', 'Buscar', 1, 11, 1001, null, 'Maestro')
GO

SET IDENTITY_INSERT [Seguridad].[Aplicacion] OFF
GO

-- Transacciones
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10610, 37, N'Tx.TipoDocumento.Agregar', N'TipoDocumento_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10611, 37, N'Tx.TipoDocumento.Modificar', N'TipoDocumento_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10612, 37, N'Tx.TipoDocumento.Eliminar', N'TipoDocumento_Eliminar', 1001)
GO

INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10710, 38, N'Tx.TipoPago.Agregar', N'TipoPago_Agregar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10711, 38, N'Tx.TipoPago.Modificar', N'TipoPago_Modificar', 1001)
GO
INSERT [Seguridad].[Transaccion] ([Id], [IdAplicacion], [Nombre], [Descripcion], [Estado]) VALUES (10712, 38, N'Tx.TipoPago.Eliminar', N'TipoPago_Eliminar', 1001)
GO

-- Permisos
insert into Seguridad.AplicacionOpcion(IdAplicacion, IdOpcion, Activo)
SELECT app.id, opc.id, 1 FROM Seguridad.Aplicacion app
inner join Seguridad.Opcion opc on app.Estado = opc.Estado
WHERE IdPadre > 0 and EsMenu = 1 and app.id in (37,38)
order by app.id, opc.id;


-- Cambio de modulo
update Seguridad.Aplicacion set Modulo = 'Maestro' where Id in (26,27);

--- Vencimiento de productos
SET IDENTITY_INSERT [Seguridad].[Aplicacion] ON 
GO

INSERT [Seguridad].[Aplicacion] ([Id], [Nombre], [IdPadre], [Controlador], [Accion], [EsMenu], [Orden], [Estado], [Descripcion], [Modulo]) VALUES (39, N'Vencimiento Productos', 28, 'VencimientoProductoBandeja', 'Buscar', 1, 3, 1001, null, 'Consulta')
GO

SET IDENTITY_INSERT [Seguridad].[Aplicacion] OFF
GO

-- Permisos
insert into Seguridad.AplicacionOpcion(IdAplicacion, IdOpcion, Activo)
SELECT app.id, opc.id, 1 FROM Seguridad.Aplicacion app
inner join Seguridad.Opcion opc on app.Estado = opc.Estado
WHERE IdPadre > 0 and EsMenu = 1 and app.id = 39
order by app.id, opc.id;
