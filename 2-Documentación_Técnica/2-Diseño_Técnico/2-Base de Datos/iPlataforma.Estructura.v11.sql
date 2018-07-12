USE [iPlataforma];
GO

CREATE DEFAULT DF_Plataforma_Fecha
	AS GETDATE()
go


CREATE TABLE Almacen.Almacen
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	Direccion  nvarchar(256)  NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Almacen.Almacen
	ADD CONSTRAINT  PK_Al_Almacenes PRIMARY KEY   CLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE Almacen.AlmacenStock
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdAlmacen  integer  NOT NULL ,
	IdProducto  integer  NOT NULL ,
	StockSistema  decimal(18,6)  NOT NULL ,
	CantidadSeparada  decimal(18,6)  NOT NULL ,
	StockMinimo  decimal(18,6)  NOT NULL ,
	StockMaximo  decimal(18,6)  NOT NULL ,
	Observaciones  nvarchar(256)  NULL ,
	UsuarioRegistra  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL 
)
go


ALTER TABLE Almacen.AlmacenStock
	ADD CONSTRAINT  PK_Al_StockAlmacenes PRIMARY KEY   CLUSTERED (Id  ASC,IdEmpresa  ASC,IdAlmacen  ASC,IdProducto  ASC)
go



exec sp_bindefault DF_Plataforma_Fecha, 'Almacen.AlmacenStock.FechaRegistra'
go


CREATE TABLE Seguridad.Aplicacion
(
	Id  integer  IDENTITY (1,1) ,
	IdPadre  integer  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	Descripcion  nvarchar(512)  NULL ,
	Modulo  nvarchar(256)  NULL ,
	Controlador  nvarchar(256)  NULL ,
	Accion  nvarchar(32)  NULL ,
	EsMenu  bit  NOT NULL ,
	Orden  integer  NOT NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Seguridad.Aplicacion
	ADD CONSTRAINT  XPKAplicacion PRIMARY KEY   NONCLUSTERED (Id  ASC)
go


CREATE TABLE Seguridad.AplicacionOpcion
(
	Id  integer  IDENTITY (1,1) ,
	IdAplicacion  integer  NOT NULL ,
	IdOpcion  integer  NOT NULL ,
	Activo  bit  NOT NULL 
)
go


ALTER TABLE Seguridad.AplicacionOpcion
	ADD CONSTRAINT  XPKAplicacionOpcion PRIMARY KEY   NONCLUSTERED (Id  ASC,IdAplicacion  ASC,IdOpcion  ASC)
go


CREATE TABLE Seguridad.Auditoria
(
	Id  integer  IDENTITY (1,1) ,
	IdTransaccion  integer  NOT NULL ,
	IdUsuarioRegistra  integer  NOT NULL ,
	IpCliente  nvarchar(32)  NOT NULL ,
	FechaRegistra  datetime  NOT NULL 
)
go


ALTER TABLE Seguridad.Auditoria
	ADD CONSTRAINT  XPKAuditoria PRIMARY KEY   NONCLUSTERED (Id  ASC)
go


CREATE TABLE Seguridad.AuditoriaDetalle
(
	Id  integer  IDENTITY (1,1) ,
	IdAuditoria  integer  NOT NULL ,
	TipoAccion  integer  NOT NULL ,
	Entidad  nvarchar(256)  NOT NULL ,
	Llave  ntext  NULL ,
	Original  ntext  NULL ,
	Actual  ntext  NULL 
)
go


ALTER TABLE Seguridad.AuditoriaDetalle
	ADD CONSTRAINT  XPKAuditoriaDetalle PRIMARY KEY   NONCLUSTERED (Id  ASC)
go


CREATE TABLE Campana.Campania
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdCatalogo  integer  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	Descripcion  nvarchar(512)  NULL ,
	VigenteDesde  datetime  NOT NULL ,
	VigenteHasta  datetime  NOT NULL ,
	EstaVigente  bit  NOT NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Campana.Campania
	ADD CONSTRAINT  XPKCampania PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE Campana.Catalogo
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	Abreviatura  nvarchar(7)  NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Campana.Catalogo
	ADD CONSTRAINT  XPKCatalogo PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE Almacen.Cliente
(
	Id  integer  NOT NULL ,
	IdEmpresa  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL ,
	FechaModifica  datetime  NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Almacen.Cliente
	ADD CONSTRAINT  XPKCliente PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE General.Configuracion
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	Etiqueta  nvarchar(256)  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	Valor  nvarchar(512)  NOT NULL ,
	Activo  bit  NOT NULL CONSTRAINT  General_Configuracion_Activo_DF_Plataforma_Activo_2038528346
		 DEFAULT  1
)
go


ALTER TABLE General.Configuracion
	ADD CONSTRAINT  XPKConfiguracion PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE General.Empresa
(
	Id  integer  IDENTITY (1,1) ,
	NombreComercial  nvarchar(256)  NOT NULL ,
	Ruc  nvarchar(11)  NULL ,
	RazonSocial  nvarchar(256)  NULL ,
	Direccion  nvarchar(256)  NULL ,
	Telefono  nvarchar(64)  NULL ,
	Celular  nvarchar(64)  NULL ,
	Email  nvarchar(64)  NOT NULL ,
	WenSite  nvarchar(128)  NULL ,
	Activo  bit  NOT NULL CONSTRAINT  General_Empresa_Activo_DF_Plataforma_Activo_468263970
		 DEFAULT  1
)
go


ALTER TABLE General.Empresa
	ADD CONSTRAINT  PK_Empresas PRIMARY KEY   CLUSTERED (Id  ASC)
go


CREATE TABLE Almacen.FamiliaProducto
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	Abreviatura  nvarchar(7)  NULL ,
	Activo  bit  NOT NULL CONSTRAINT  DF_Al_FamiliaProducto_Activo
		 DEFAULT  1
)
go


ALTER TABLE Almacen.FamiliaProducto
	ADD CONSTRAINT  PK_Al_FamiliaProducto PRIMARY KEY   CLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE Almacen.Genero
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	Activo  bit  NOT NULL 
)
go


ALTER TABLE Almacen.Genero
	ADD CONSTRAINT  XPKGenero PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE Almacen.Inventario
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdAlmacen  integer  NOT NULL ,
	InicioConteo  datetime  NULL ,
	FinConteo  datetime  NULL ,
	UsuarioRegistra  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL ,
	UsuarioAnula  integer  NULL ,
	FechaAnula  datetime  NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Almacen.Inventario
	ADD CONSTRAINT  PK_Al_InventarioCabe PRIMARY KEY   CLUSTERED (Id  ASC,IdEmpresa  ASC,IdAlmacen  ASC)
go



exec sp_bindefault DF_Plataforma_Fecha, 'Almacen.Inventario.FechaRegistra'
go


CREATE TABLE Almacen.InventarioDetalle
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdInventario  integer  NOT NULL ,
	IdAlmacen  integer  NOT NULL ,
	IdProducto  integer  NOT NULL ,
	IdMovimiento  integer  NOT NULL ,
	SecuenciaMovimiento  integer  NOT NULL ,
	StockUsuario  integer  NULL ,
	StockFecha  datetime  NULL ,
	StockSistema  decimal(18,6)  NULL ,
	ConteoUsuario  integer  NULL ,
	ConteoFecha  datetime  NULL ,
	ConteoTotal  decimal(18,6)  NULL ,
	Diferencia  decimal(18,6)  NULL ,
	AjusteUsuario  integer  NULL ,
	AjusteFecha  datetime  NULL ,
	UsuarioRegistra  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL 
)
go


ALTER TABLE Almacen.InventarioDetalle
	ADD CONSTRAINT  XPKInventarioDetalle PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC,IdInventario  ASC,IdAlmacen  ASC,IdProducto  ASC)
go



exec sp_bindefault DF_Plataforma_Fecha, 'Almacen.InventarioDetalle.FechaRegistra'
go


CREATE TABLE Almacen.Kardex
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdAlmacen  integer  NOT NULL ,
	IdProducto  integer  NOT NULL ,
	IdMovimiento  integer  NOT NULL ,
	IdProveedorCliente  integer  NOT NULL ,
	SecuenciaMovimiento  int  NULL ,
	FechaKardex  datetime  NOT NULL ,
	FechaDocumento  datetime  NOT NULL ,
	Documento  varchar(20)  NULL ,
	StockAntes  numeric(10,3)  NOT NULL ,
	Cantidad  numeric(10,3)  NOT NULL ,
	PrecioVenta  numeric(10,2)  NOT NULL ,
	CostoCompra  numeric(10,2)  NOT NULL ,
	CostoPromedio  numeric(10,2)  NOT NULL ,
	UsuarioRegistra  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL 
)
go


ALTER TABLE Almacen.Kardex
	ADD CONSTRAINT  PK_Al_Kardex PRIMARY KEY   CLUSTERED (Id  ASC,IdEmpresa  ASC)
go



exec sp_bindefault DF_Plataforma_Fecha, 'Almacen.Kardex.FechaRegistra'
go


CREATE TABLE Almacen.Marca
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdCatalogo  integer  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	Abreviatura  nvarchar(7)  NULL ,
	Activo  bit  NOT NULL CONSTRAINT  Almacen_Marca_Activo_DF_Plataforma_Activo_1231375176
		 DEFAULT  1
)
go


ALTER TABLE Almacen.Marca
	ADD CONSTRAINT  XPKMarca PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE Almacen.Movimiento
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdTipoMovimiento  integer  NOT NULL ,
	SecuenciaMovimiento  int  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	OpDocumentoReferencia  bit  NOT NULL ,
	OpCliente  bit  NOT NULL ,
	OpProveedor  bit  NOT NULL ,
	OpCosto  bit  NOT NULL ,
	OpPrecio  bit  NOT NULL ,
	OpActualizaCosto  bit  NOT NULL ,
	OpActualizaStock  bit  NOT NULL ,
	OpEsEditable  bit  NOT NULL CONSTRAINT  DF_Al_TipoMovimientos_Op_MovimientoEditable
		 DEFAULT  1,
	OpEsVisible  bit  NOT NULL CONSTRAINT  DF_Al_TipoMovimientos_Op_MovimientoVisible
		 DEFAULT  1,
	OpEsIngresoCompra  bit  NOT NULL ,
	Activo  bit  NOT NULL CONSTRAINT  DF_Al_TipoMovimientos_Activo
		 DEFAULT  1
)
go


ALTER TABLE Almacen.Movimiento
	ADD CONSTRAINT  PK_Al_Movimiento PRIMARY KEY   CLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE Almacen.MovimientoAlmacen
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdAlmacen  integer  NOT NULL ,
	IdMovimiento  integer  NOT NULL ,
	IdProveedor  integer  NULL ,
	SecuenciaMovimiento  int  NOT NULL ,
	FechaDocumento  datetime  NOT NULL ,
	Documento  nvarchar(256)  NULL ,
	SubTotal  decimal(18,6)  NOT NULL ,
	Igv  decimal(18,6)  NOT NULL ,
	Total  decimal(18,6)  NOT NULL ,
	Observaciones  nvarchar(256)  NULL ,
	UsuarioRegistra  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL ,
	UsuarioAnula  integer  NULL ,
	FechaAnula  datetime  NULL ,
	Estado  integer  NOT NULL ,
	Ciclo  nvarchar(64)  NULL 
)
go


ALTER TABLE Almacen.MovimientoAlmacen
	ADD CONSTRAINT  PK_Al_MoviCabeAlmacen_1 PRIMARY KEY   CLUSTERED (Id  ASC,IdEmpresa  ASC,IdAlmacen  ASC)
go



exec sp_bindefault DF_Plataforma_Fecha, 'Almacen.MovimientoAlmacen.FechaRegistra'
go


CREATE TABLE Almacen.MovimientoAlmacenDetalle
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdMovimientoAlmacen  integer  NOT NULL ,
	IdAlmacen  integer  NOT NULL ,
	IdProducto  integer  NOT NULL ,
	Linea  integer  NOT NULL ,
	Cantidad  decimal(18,6)  NOT NULL ,
	FechaVencimiento  datetime  NULL ,
	Duracion  nvarchar(256)  NULL ,
	CostoReal  decimal(18,6)  NULL ,
	CostoPromocion  decimal(18,6)  NULL ,
	CostoUnitario  decimal(18,6)  NOT NULL ,
	Igv  decimal(18,6)  NOT NULL ,
	SubTotal  decimal(18,6)  NOT NULL ,
	TotalIgv  decimal(18,6)  NOT NULL ,
	Total  decimal(18,6)  NOT NULL ,
	Lote  nvarchar(32)  NULL ,
	Observaciones  nvarchar(256)  NULL 
)
go


ALTER TABLE Almacen.MovimientoAlmacenDetalle
	ADD CONSTRAINT  PK_Al_MoviDetaAlmacen PRIMARY KEY   CLUSTERED (Id  ASC,IdEmpresa  ASC,IdMovimientoAlmacen  ASC,IdAlmacen  ASC,IdProducto  ASC)
go


CREATE TABLE Almacen.MovimientoAlmacenDetalleTemp
(
	Id  integer  IDENTITY (1,1) ,
	IdMovimientoAlmacen  integer  NOT NULL ,
	IdAlmacen  integer  NOT NULL ,
	IdProducto  integer  NOT NULL ,
	IdEmpresa  integer  NOT NULL ,
	IdMovimientoAlmacenDetalle  integer  NOT NULL ,
	Cantidad  decimal(18,6)  NOT NULL ,
	CostoUnitario  decimal(18,6)  NOT NULL ,
	Igv  decimal(18,6)  NOT NULL ,
	SubTotal  decimal(18,6)  NOT NULL ,
	TotalIgv  decimal(18,6)  NOT NULL ,
	Total  decimal(18,6)  NOT NULL ,
	Lote  nvarchar(32)  NULL ,
	Observaciones  nvarchar(256)  NULL 
)
go


ALTER TABLE Almacen.MovimientoAlmacenDetalleTemp
	ADD CONSTRAINT  PK_Al_MoviDetaAlmacenTemp PRIMARY KEY   CLUSTERED (Id  ASC,IdMovimientoAlmacen  ASC,IdAlmacen  ASC,IdProducto  ASC,IdEmpresa  ASC,IdMovimientoAlmacenDetalle  ASC)
go


CREATE TABLE General.Multitabla
(
	Id  integer  NOT NULL ,
	IdPadre  integer  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	Keys  nvarchar(256)  NULL ,
	Valor  nvarchar(256)  NULL ,
	Activo  bit  NOT NULL 
)
go


ALTER TABLE General.Multitabla
	ADD CONSTRAINT  XPKMultitabla PRIMARY KEY   NONCLUSTERED (Id  ASC)
go


CREATE TABLE Notificacion
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NULL ,
	Tipo  integer  NOT NULL ,
	Medio  integer  NOT NULL ,
	De  nvarchar(256)  NOT NULL ,
	Para  nvarchar(256)  NOT NULL ,
	Asunto  nvarchar(1024)  NULL ,
	Mensaje  text  NULL ,
	JsonPersonal  nvarchar(4000)  NULL ,
	JsonPlantilla  nvarchar(4000)  NULL ,
	Plantilla  integer  NULL ,
	FechaRegistro  datetime  NOT NULL ,
	UsuarioRegistra  integer  NULL ,
	FechaNotificacion  datetime  NULL ,
	UsuarioNotifica  integer  NULL ,
	NumeroIntento  integer  NULL ,
	TotalEnvios  integer  NULL ,
	EnviosFallidos  integer  NULL ,
	Estado  integer  NOT NULL ,
	Activo  bit  NOT NULL CONSTRAINT  Notificacion_Activo_DF_Plataforma_Activo_1181434636
		 DEFAULT  1
)
go


ALTER TABLE Notificacion
	ADD CONSTRAINT  XPKNotificacion PRIMARY KEY   NONCLUSTERED (Id  ASC)
go



exec sp_bindefault DF_Plataforma_Fecha, 'Notificacion.FechaRegistro'
go


CREATE TABLE Campana.Oferta
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdCatalogo  integer  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	Descripcion  nvarchar(512)  NULL ,
	TipoOferta  integer  NOT NULL ,
	Stock  decimal(18,6)  NOT NULL ,
	Precio  decimal(18,6)  NOT NULL ,
	PrecioOferta  decimal(18,6)  NOT NULL ,
	VigenteDesde  datetime  NULL ,
	VigenteHasta  datetime  NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Campana.Oferta
	ADD CONSTRAINT  XPKOferta PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC,IdCatalogo  ASC)
go


CREATE TABLE Campana.OfertaCampana
(
	Id  integer  IDENTITY (1,1) ,
	IdOferta  integer  NOT NULL ,
	IdCampania  integer  NOT NULL ,
	IdEmpresa  integer  NOT NULL ,
	IdCatalogo  integer  NOT NULL 
)
go


ALTER TABLE Campana.OfertaCampana
	ADD CONSTRAINT  XPKOfertaCampana PRIMARY KEY   NONCLUSTERED (Id  ASC,IdOferta  ASC,IdCampania  ASC,IdEmpresa  ASC,IdCatalogo  ASC)
go


CREATE TABLE Campana.OfertaDetalle
(
	Id  integer  IDENTITY (1,1) ,
	IdOferta  integer  NOT NULL ,
	IdProducto  integer  NOT NULL ,
	IdEmpresa  integer  NOT NULL ,
	IdCatalogo  integer  NOT NULL ,
	Cantidad  decimal(18,6)  NOT NULL 
)
go


ALTER TABLE Campana.OfertaDetalle
	ADD CONSTRAINT  XPKOfertaDetalle PRIMARY KEY   NONCLUSTERED (Id  ASC,IdOferta  ASC,IdProducto  ASC,IdEmpresa  ASC,IdCatalogo  ASC)
go


CREATE TABLE Seguridad.Opcion
(
	Id  integer  IDENTITY (1,1) ,
	TipoOpcion  integer  NOT NULL ,
	Nombre  nvarchar(256)  NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Seguridad.Opcion
	ADD CONSTRAINT  XPKOpcion PRIMARY KEY   NONCLUSTERED (Id  ASC)
go


CREATE TABLE Almacen.Parametro
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	Activo  bit  NOT NULL CONSTRAINT  Almacen_Parametro_Activo_DF_Plataforma_Activo_722154270
		 DEFAULT  1
)
go


ALTER TABLE Almacen.Parametro
	ADD CONSTRAINT  PK_Al_Parametro PRIMARY KEY   CLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE Almacen.ParametroProducto
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdParametro  integer  NOT NULL ,
	IdProducto  integer  NOT NULL 
)
go


ALTER TABLE Almacen.ParametroProducto
	ADD CONSTRAINT  PK_Al_Relacion_Producto_Externo PRIMARY KEY   CLUSTERED (Id  ASC,IdEmpresa  ASC,IdParametro  ASC,IdProducto  ASC)
go


CREATE TABLE Comun.Persona
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	TipoPersona  integer  NOT NULL ,
	Nombres  nvarchar(256)  NOT NULL ,
	Apellidos  nvarchar(256)  NULL ,
	TipoDocumento  integer  NULL ,
	NumeroDocumento  nvarchar(64)  NULL ,
	Correo  nvarchar(256)  NOT NULL ,
	Telefono  nvarchar(64)  NULL ,
	Celular  nvarchar(64)  NULL ,
	FechaRegistra  datetime  NOT NULL ,
	FechaModifica  datetime  NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Comun.Persona
	ADD CONSTRAINT  XPKPersona PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go



exec sp_bindefault DF_Plataforma_Fecha, 'Comun.Persona.FechaRegistra'
go


CREATE TABLE Almacen.Presentacion
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	Activo  bit  NOT NULL 
)
go


ALTER TABLE Almacen.Presentacion
	ADD CONSTRAINT  XPKPresentacion PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE Almacen.Producto
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdTipoProducto  integer  NOT NULL ,
	IdUnidadMedida  integer  NOT NULL ,
	IdFamiliaProducto  integer  NOT NULL ,
	IdMarca  integer  NOT NULL ,
	IdGenero  integer  NULL ,
	IdPresentacion  integer  NULL ,
	CodigoInterno  nvarchar(64)  NULL ,
	CodigoBarras  nvarchar(256)  NULL ,
	CodigoFabricante  nvarchar(256)  NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	NombreAlterno  nvarchar(256)  NULL ,
	PrecioUnitario  decimal(18,6)  NOT NULL ,
	CostoUnitario  decimal(18,6)  NOT NULL ,
	CostoPromedio  decimal(18,6)  NOT NULL ,
	Igv  decimal(18,6)  NOT NULL ,
	Descipcion  ntext  NULL ,
	Beneficios  ntext  NULL ,
	Contenido  nvarchar(256)  NULL ,
	FechaUltimaCompra  datetime  NULL ,
	UsuarioRegistra  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL ,
	UsuarioModifica  integer  NULL ,
	FechaModifica  datetime  NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Almacen.Producto
	ADD CONSTRAINT  PK_Al_Productos PRIMARY KEY   CLUSTERED (Id  ASC,IdEmpresa  ASC)
go



exec sp_bindefault DF_Plataforma_Fecha, 'Almacen.Producto.FechaRegistra'
go


CREATE TABLE Almacen.Proveedor
(
	Id  integer  NOT NULL ,
	IdEmpresa  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL ,
	FechaModifica  datetime  NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Almacen.Proveedor
	ADD CONSTRAINT  XPKProveedor PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE Seguridad.Rol
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	TipoRol  integer  NOT NULL ,
	Nombre  nvarchar(256)  NULL ,
	EsEditable  bit  NOT NULL CONSTRAINT  Seguridad_Rol_EsEditable_DF_Plataforma_Activo_404543129
		 DEFAULT  1,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Seguridad.Rol
	ADD CONSTRAINT  XPKRol PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE Seguridad.RolAplicacionOpcion
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdRol  integer  NOT NULL ,
	IdAplicacion  integer  NOT NULL ,
	IdOpcion  integer  NOT NULL ,
	IdAplicacionOpcion  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL 
)
go


ALTER TABLE Seguridad.RolAplicacionOpcion
	ADD CONSTRAINT  XPKRolAplicacionOpcion PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC,IdRol  ASC,IdAplicacion  ASC,IdOpcion  ASC,IdAplicacionOpcion  ASC)
go


CREATE TABLE Almacen.TipoProducto
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	Abreviatura  nvarchar(7)  NULL ,
	Activo  bit  NOT NULL CONSTRAINT  Almacen_TipoProducto_Activo_DF_Plataforma_Activo_2088023695
		 DEFAULT  1
)
go


ALTER TABLE Almacen.TipoProducto
	ADD CONSTRAINT  XPKTipoProducto PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE Seguridad.Transaccion
(
	Id  integer  NOT NULL ,
	IdAplicacion  integer  NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	Descripcion  nvarchar(512)  NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Seguridad.Transaccion
	ADD CONSTRAINT  XPKTransaccion PRIMARY KEY   NONCLUSTERED (Id  ASC)
go


CREATE TABLE Almacen.TransferenciaAlmacen
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdAlmacenOrigen  integer  NOT NULL ,
	IdAlmacenDestino  integer  NOT NULL ,
	Fecha  datetime  NOT NULL ,
	Documento  nvarchar(256)  NULL ,
	Observaciones  varchar(100)  NULL ,
	UsuarioRegistra  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL ,
	UsuarioAnula  integer  NULL ,
	FechaAnula  datetime  NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Almacen.TransferenciaAlmacen
	ADD CONSTRAINT  PK_Al_TransCabeAlmacen PRIMARY KEY   CLUSTERED (Id  ASC,IdEmpresa  ASC)
go



exec sp_bindefault DF_Plataforma_Fecha, 'Almacen.TransferenciaAlmacen.FechaRegistra'
go


CREATE TABLE Almacen.TransferenciaAlmacenDetalle
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdTransferenciaAlmacen  integer  NOT NULL ,
	IdProducto  integer  NOT NULL ,
	Cantidad  decimal(18,6)  NOT NULL ,
	Lote  nvarchar(32)  NULL ,
	Observaciones  nvarchar(256)  NULL 
)
go


ALTER TABLE Almacen.TransferenciaAlmacenDetalle
	ADD CONSTRAINT  PK_Al_TransDetaAlmacen PRIMARY KEY   CLUSTERED (Id  ASC,IdEmpresa  ASC,IdTransferenciaAlmacen  ASC,IdProducto  ASC)
go


CREATE TABLE Almacen.TransferenciaAlmacenDetalleTemp
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdProducto  integer  NOT NULL ,
	IdTransferenciaAlmacen  integer  NOT NULL ,
	IdTransferenciaAlmacenDetalle  integer  NOT NULL ,
	Cantidad  decimal(18,6)  NOT NULL ,
	Lote  nvarchar(32)  NULL ,
	Observaciones  nvarchar(256)  NULL 
)
go


ALTER TABLE Almacen.TransferenciaAlmacenDetalleTemp
	ADD CONSTRAINT  PK_Al_TransDetaAlmacenTemp PRIMARY KEY   CLUSTERED (Id  ASC,IdEmpresa  ASC,IdProducto  ASC,IdTransferenciaAlmacen  ASC,IdTransferenciaAlmacenDetalle  ASC)
go


CREATE TABLE Almacen.UnidadMedida
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	Abreviatura  nvarchar(7)  NULL ,
	Activo  bit  NOT NULL CONSTRAINT  DF_Unidad_Medida_Activo
		 DEFAULT  1
)
go


ALTER TABLE Almacen.UnidadMedida
	ADD CONSTRAINT  PK_Unidad_Medida PRIMARY KEY   CLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE Seguridad.Usuario
(
	Id  integer  NOT NULL ,
	IdEmpresa  integer  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	Clave  nvarchar(256)  NOT NULL ,
	Llave  nvarchar(256)  NULL ,
	EsPropietario  bit  NOT NULL ,
	FechaRegistro  datetime  NOT NULL ,
	FechaModifica  datetime  NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Seguridad.Usuario
	ADD CONSTRAINT  XPKUsuario PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go



exec sp_bindefault DF_Plataforma_Fecha, 'Seguridad.Usuario.FechaRegistro'
go


CREATE TABLE Seguridad.UsuarioRol
(
	IdEmpresa  integer  NOT NULL ,
	IdUsuario  integer  NOT NULL ,
	Id  integer  NOT NULL 
)
go


ALTER TABLE Seguridad.UsuarioRol
	ADD CONSTRAINT  XPKUsuarioRol PRIMARY KEY   NONCLUSTERED (IdEmpresa  ASC,IdUsuario  ASC,Id  ASC)
go



ALTER TABLE Almacen.AlmacenStock
	ADD CONSTRAINT  R_15 FOREIGN KEY (IdProducto,IdEmpresa) REFERENCES Almacen.Producto(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Almacen.AlmacenStock
	ADD CONSTRAINT  R_17 FOREIGN KEY (IdAlmacen,IdEmpresa) REFERENCES Almacen.Almacen(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Seguridad.AplicacionOpcion
	ADD CONSTRAINT  R_48 FOREIGN KEY (IdAplicacion) REFERENCES Seguridad.Aplicacion(Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Seguridad.AplicacionOpcion
	ADD CONSTRAINT  R_49 FOREIGN KEY (IdOpcion) REFERENCES Seguridad.Opcion(Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Seguridad.Auditoria
	ADD CONSTRAINT  R_54 FOREIGN KEY (IdTransaccion) REFERENCES Seguridad.Transaccion(Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Seguridad.AuditoriaDetalle
	ADD CONSTRAINT  R_55 FOREIGN KEY (IdAuditoria) REFERENCES Seguridad.Auditoria(Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Almacen.Cliente
	ADD CONSTRAINT  R_71 FOREIGN KEY (Id,IdEmpresa) REFERENCES Comun.Persona(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE General.Configuracion
	ADD CONSTRAINT  R_82 FOREIGN KEY (IdEmpresa) REFERENCES General.Empresa(Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Almacen.InventarioDetalle
	ADD CONSTRAINT  R_34 FOREIGN KEY (IdInventario,IdEmpresa,IdAlmacen) REFERENCES Almacen.Inventario(Id,IdEmpresa,IdAlmacen)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Almacen.InventarioDetalle
	ADD CONSTRAINT  R_35 FOREIGN KEY (IdProducto,IdEmpresa) REFERENCES Almacen.Producto(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Almacen.MovimientoAlmacenDetalle
	ADD CONSTRAINT  R_27 FOREIGN KEY (IdMovimientoAlmacen,IdEmpresa,IdAlmacen) REFERENCES Almacen.MovimientoAlmacen(Id,IdEmpresa,IdAlmacen)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Almacen.MovimientoAlmacenDetalle
	ADD CONSTRAINT  R_29 FOREIGN KEY (IdProducto,IdEmpresa) REFERENCES Almacen.Producto(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Almacen.MovimientoAlmacenDetalleTemp
	ADD CONSTRAINT  R_31 FOREIGN KEY (IdMovimientoAlmacenDetalle,IdEmpresa,IdMovimientoAlmacen,IdAlmacen,IdProducto) REFERENCES Almacen.MovimientoAlmacenDetalle(Id,IdEmpresa,IdMovimientoAlmacen,IdAlmacen,IdProducto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Campana.Oferta
	ADD CONSTRAINT  R_70 FOREIGN KEY (IdCatalogo,IdEmpresa) REFERENCES Campana.Catalogo(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Campana.OfertaCampana
	ADD CONSTRAINT  R_68 FOREIGN KEY (IdOferta,IdEmpresa,IdCatalogo) REFERENCES Campana.Oferta(Id,IdEmpresa,IdCatalogo)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Campana.OfertaCampana
	ADD CONSTRAINT  R_69 FOREIGN KEY (IdCampania,IdEmpresa) REFERENCES Campana.Campania(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Campana.OfertaDetalle
	ADD CONSTRAINT  R_66 FOREIGN KEY (IdOferta,IdEmpresa,IdCatalogo) REFERENCES Campana.Oferta(Id,IdEmpresa,IdCatalogo)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Campana.OfertaDetalle
	ADD CONSTRAINT  R_67 FOREIGN KEY (IdProducto,IdEmpresa) REFERENCES Almacen.Producto(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Almacen.ParametroProducto
	ADD CONSTRAINT  R_18 FOREIGN KEY (IdProducto,IdEmpresa) REFERENCES Almacen.Producto(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Almacen.ParametroProducto
	ADD CONSTRAINT  R_19 FOREIGN KEY (IdParametro,IdEmpresa) REFERENCES Almacen.Parametro(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Almacen.Producto
	ADD CONSTRAINT  R_8 FOREIGN KEY (IdUnidadMedida,IdEmpresa) REFERENCES Almacen.UnidadMedida(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Almacen.Producto
	ADD CONSTRAINT  R_9 FOREIGN KEY (IdTipoProducto,IdEmpresa) REFERENCES Almacen.TipoProducto(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Almacen.Producto
	ADD CONSTRAINT  R_12 FOREIGN KEY (IdFamiliaProducto,IdEmpresa) REFERENCES Almacen.FamiliaProducto(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Almacen.Producto
	ADD CONSTRAINT  R_13 FOREIGN KEY (IdMarca,IdEmpresa) REFERENCES Almacen.Marca(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Almacen.Producto
	ADD CONSTRAINT  R_79 FOREIGN KEY (IdGenero,IdEmpresa) REFERENCES Almacen.Genero(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Almacen.Producto
	ADD CONSTRAINT  R_80 FOREIGN KEY (IdPresentacion,IdEmpresa) REFERENCES Almacen.Presentacion(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Almacen.Proveedor
	ADD CONSTRAINT  R_72 FOREIGN KEY (Id,IdEmpresa) REFERENCES Comun.Persona(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Seguridad.Rol
	ADD CONSTRAINT  R_60 FOREIGN KEY (IdEmpresa) REFERENCES General.Empresa(Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Seguridad.RolAplicacionOpcion
	ADD CONSTRAINT  R_61 FOREIGN KEY (IdAplicacionOpcion,IdAplicacion,IdOpcion) REFERENCES Seguridad.AplicacionOpcion(Id,IdAplicacion,IdOpcion)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Seguridad.RolAplicacionOpcion
	ADD CONSTRAINT  R_62 FOREIGN KEY (IdRol,IdEmpresa) REFERENCES Seguridad.Rol(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Seguridad.Transaccion
	ADD CONSTRAINT  R_53 FOREIGN KEY (IdAplicacion) REFERENCES Seguridad.Aplicacion(Id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Almacen.TransferenciaAlmacenDetalle
	ADD CONSTRAINT  R_38 FOREIGN KEY (IdProducto,IdEmpresa) REFERENCES Almacen.Producto(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Almacen.TransferenciaAlmacenDetalle
	ADD CONSTRAINT  R_39 FOREIGN KEY (IdTransferenciaAlmacen,IdEmpresa) REFERENCES Almacen.TransferenciaAlmacen(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Almacen.TransferenciaAlmacenDetalleTemp
	ADD CONSTRAINT  R_40 FOREIGN KEY (IdTransferenciaAlmacenDetalle,IdEmpresa,IdTransferenciaAlmacen,IdProducto) REFERENCES Almacen.TransferenciaAlmacenDetalle(Id,IdEmpresa,IdTransferenciaAlmacen,IdProducto)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Seguridad.Usuario
	ADD CONSTRAINT  R_41 FOREIGN KEY (Id,IdEmpresa) REFERENCES Comun.Persona(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Seguridad.UsuarioRol
	ADD CONSTRAINT  R_46 FOREIGN KEY (IdUsuario,IdEmpresa) REFERENCES Seguridad.Usuario(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Seguridad.UsuarioRol
	ADD CONSTRAINT  R_63 FOREIGN KEY (Id,IdEmpresa) REFERENCES Seguridad.Rol(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


-- ******************* PASE: 20171201 *****************


-- Drop la función si existe
  IF OBJECT_ID('General.MayusculasEnCadaPalabra') IS NOT NULL
    DROP FUNCTION General.MayusculasEnCadaPalabra;
  GO

 -- Implementando la función de Oracle INITCAP en SQL Server
 CREATE FUNCTION General.MayusculasEnCadaPalabra (@inStr VARCHAR(8000))
  RETURNS VARCHAR(8000)
  AS
  BEGIN
    DECLARE @outStr VARCHAR(8000) = LOWER(@inStr),
         @char CHAR(1), 
         @alphanum BIT = 0,
         @len INT = LEN(@inStr),
                 @pos INT = 1;        

    -- Iterar entre todos los caracteres en la cadena de entrada
    WHILE @pos <= @len BEGIN

      -- Obtener el siguiente caracter
      SET @char = SUBSTRING(@inStr, @pos, 1);

      -- Si la posición del caracter es la 1ª, o el caracter previo no es alfanumérico
      -- convierte el caracter actual a mayúscula
      IF @pos = 1 OR @alphanum = 0
        SET @outStr = STUFF(@outStr, @pos, 1, UPPER(@char));

      SET @pos = @pos + 1;

      -- Define si el caracter actual es  non-alfanumérico
      IF ASCII(@char) <= 47 OR (ASCII(@char) BETWEEN 58 AND 64) OR
      (ASCII(@char) BETWEEN 91 AND 96) OR (ASCII(@char) BETWEEN 123 AND 126)
      SET @alphanum = 0;
      ELSE
      SET @alphanum = 1;

    END

   RETURN @outStr;         
  END
  GO
  

  
-- ******************* PASE: 20180214 *****************


-- Quita compos repetidos
alter table Almacen.MovimientoAlmacenDetalleTemp drop column CostoUnitario, Igv, SubTotal, TotalIgv, Total, Observaciones;


-- Agrega los campos faltantes a la tabla "MovimientoAlmacenDetalleTemp"
alter table Almacen.MovimientoAlmacenDetalleTemp add 
FechaVencimiento datetime,
CantidadEntregada decimal(18,6) default 0 not null,
Observaciones nvarchar(256)
;

-- Agrega flag de despacho automatico a la tabla movimientos
alter table Almacen.Movimiento add OpDespachoAutomatico bit default 0 not null;

CREATE TABLE Almacen.Despacho
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdMovimientoAlmacen  integer  NULL ,
	TipoEntrega  integer  NOT NULL ,
	IdCliente  integer  NULL ,
	FechaDocumento  datetime  NOT NULL ,
	Documento  nvarchar(256)  NULL ,
	Total  decimal(18,6)  NOT NULL ,
	UsuarioDespacho  integer  NULL ,
	FechaDespacho  datetime  NULL ,
	UsuarioRegistra  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL ,
	Observaciones  nvarchar(256)  NULL ,
	Estado  integer  NOT NULL 
)
go

ALTER TABLE Almacen.Despacho
	ADD CONSTRAINT  XPKDespacho PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go

CREATE TABLE Almacen.DespachoDetalle
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdDespacho  integer  NULL ,
	IdMovimientoAlmacenDetalleTemp  integer  NULL ,
	IdProducto  integer  NULL ,
	Cantidad  decimal(18,6)  NOT NULL ,
	CantidadEntregada  decimal(18,6)  NOT NULL ,
	UsuarioRegistra  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL ,
	Observaciones  nvarchar(256)  NULL ,
	Estado  integer  NOT NULL 
)
go

ALTER TABLE Almacen.DespachoDetalle
	ADD CONSTRAINT  XPKDespachoDetalle PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go

ALTER TABLE Almacen.DespachoDetalle
	ADD CONSTRAINT  R_88 FOREIGN KEY (IdDespacho,IdEmpresa) REFERENCES Almacen.Despacho(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

  
-- ******************* PASE: 20180214 *****************


alter table Almacen.MovimientoAlmacenDetalle add EsRegalo bit default 0 not null;
  

  
-- ******************* PASE: 20180305 *****************


-- Tipo de documentos y Pagos

CREATE TABLE Almacen.Pago
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	IdMovimientoAlmacen  integer  NOT NULL ,
	IdTipoPago  integer  NOT NULL ,
	Cuota  integer  NOT NULL ,
	TasaInteres  decimal(18,6)  NULL ,
	IdTipoDocumento  integer  NOT NULL ,
	SerieNombre  nvarchar(32)  NULL,
	Serie  integer  NOT NULL ,
	Correlativo  integer  NOT NULL ,
	FechaDocumento  datetime  NOT NULL ,
	Total  decimal(18,6)  NOT NULL ,
	Observaciones  nvarchar(256)  NULL ,
	FechaVencimiento  datetime  NOT NULL ,
	TotalPagado  decimal(18,6)  NOT NULL ,
	FechaPagoTotal  datetime  NULL ,
	UsuarioRegistra  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL ,
	UsuarioModifica  integer  NULL ,
	FechaModifica  datetime  NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Almacen.Pago
	ADD CONSTRAINT  XPKPago PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE Almacen.PagoCuota
(
	Id  integer  IDENTITY (1,1) ,
	IdPago  integer  NOT NULL ,
	IdEmpresa  integer  NOT NULL ,
	NumeroCuota  integer  NOT NULL ,
	Monto  decimal(18,6)  NOT NULL ,
	MontoInteres  decimal(18,6)  NOT NULL ,
	Total  decimal(18,6)  NOT NULL ,
	FechaVencimiento  datetime  NOT NULL ,
	Documento  nvarchar(256)  NULL ,
	Observaciones  nvarchar(256)  NULL ,
	TotalPagado  decimal(18,6)  NOT NULL ,
	UsuarioRegistra  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL ,
	UsuarioPago  integer  NULL ,
	FechaPago  datetime  NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Almacen.PagoCuota
	ADD CONSTRAINT  XPKPagoCuota PRIMARY KEY   NONCLUSTERED (Id  ASC,IdPago  ASC,IdEmpresa  ASC)
go


CREATE TABLE Almacen.TipoDocumento
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	UsuarioRegistra  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL ,
	UsuarioModifica  integer  NULL ,
	FechaModifica  datetime  NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Almacen.TipoDocumento
	ADD CONSTRAINT  XPKTipoDocumento PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go


CREATE TABLE Almacen.TipoPago
(
	Id  integer  IDENTITY (1,1) ,
	IdEmpresa  integer  NOT NULL ,
	Nombre  nvarchar(256)  NOT NULL ,
	UsuarioRegistra  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL ,
	UsuarioModifica  integer  NULL ,
	FechaModifica  datetime  NULL ,
	CancelaPorDefecto bit not null default 0,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Almacen.TipoPago
	ADD CONSTRAINT  XPKTipoPago PRIMARY KEY   NONCLUSTERED (Id  ASC,IdEmpresa  ASC)
go



ALTER TABLE Almacen.Pago
	ADD CONSTRAINT  R_97 FOREIGN KEY (IdTipoPago,IdEmpresa) REFERENCES Almacen.TipoPago(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Almacen.PagoCuota
	ADD CONSTRAINT  R_96 FOREIGN KEY (IdPago,IdEmpresa) REFERENCES Almacen.Pago(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


-- Movimiento Almacen: Compras y Ventas
alter table Almacen.MovimientoAlmacen add 
IdTipoPago int not null,
IdTipoDocumento int not null,
SerieNombre  nvarchar(32)  NULL,
Serie int not null,
Correlativo int not null;

-- Movimiento con tipo de documento preferido
alter table Almacen.Movimiento add
IdTipoDocumentoPreferido int;

-- Tipo de documentos por tipo de movimiento
CREATE TABLE Almacen.TipoDocumentoMovimiento
(
	IdTipoDocumento  integer  NOT NULL ,
	IdMovimiento  integer  NOT NULL ,
	IdEmpresa  integer  NOT NULL ,
	Incremental bit  NOT NULL default 1,
	UsuarioRegistra  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL ,
	UsuarioModifica  integer  NULL ,
	FechaModifica  datetime  NULL ,
	Activo  bit  NOT NULL default 1
)
go


ALTER TABLE Almacen.TipoDocumentoMovimiento
	ADD CONSTRAINT  XPKTipoDocumentoMovimiento PRIMARY KEY   NONCLUSTERED (IdTipoDocumento  ASC,IdMovimiento  ASC,IdEmpresa  ASC)
go



ALTER TABLE Almacen.TipoDocumentoMovimiento
	ADD CONSTRAINT  R_99 FOREIGN KEY (IdTipoDocumento,IdEmpresa) REFERENCES Almacen.TipoDocumento(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Almacen.TipoDocumentoMovimiento
	ADD CONSTRAINT  R_100 FOREIGN KEY (IdMovimiento,IdEmpresa) REFERENCES Almacen.Movimiento(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

-- Add

CREATE TABLE Almacen.AlmacenMovimiento
(
	IdAlmacen  integer  NOT NULL ,
	IdMovimiento  integer  NOT NULL ,
	IdEmpresa  integer  NOT NULL ,
	UsuarioRegistra  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL 
)
go


ALTER TABLE Almacen.AlmacenMovimiento
	ADD CONSTRAINT  XPKAlmacenMovimiento PRIMARY KEY   NONCLUSTERED (IdAlmacen  ASC,IdMovimiento  ASC,IdEmpresa  ASC)
go



ALTER TABLE Almacen.AlmacenMovimiento
	ADD CONSTRAINT  R_105 FOREIGN KEY (IdAlmacen,IdEmpresa) REFERENCES Almacen.Almacen(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Almacen.AlmacenMovimiento
	ADD CONSTRAINT  R_106 FOREIGN KEY (IdMovimiento,IdEmpresa) REFERENCES Almacen.Movimiento(Id,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TABLE Almacen.TipoDocumentoMovimientoAlmacen
(
	Id  integer  IDENTITY (1,1) ,
	IdAlmacen  integer  NOT NULL ,
	IdTipoDocumento  integer  NOT NULL ,
	IdMovimiento  integer  NOT NULL ,
	IdEmpresa  integer  NOT NULL ,
	SerieNombre  nvarchar(32)  NULL ,
	Serie  integer  NOT NULL ,
	Correlativo  integer  NOT NULL ,
	CorrelativoInicio  integer  NOT NULL ,
	CorrelativoFin  integer  NOT NULL ,
	Observaciones  nvarchar(256)  NULL ,
	UsuarioRegistra  integer  NOT NULL ,
	FechaRegistra  datetime  NOT NULL ,
	UsuarioModifica  integer  NULL ,
	FechaModifica  datetime  NULL ,
	Estado  integer  NOT NULL 
)
go


ALTER TABLE Almacen.TipoDocumentoMovimientoAlmacen
	ADD CONSTRAINT  XPKTipoDocumentoMovimientoAlmacen PRIMARY KEY   NONCLUSTERED (Id  ASC,IdAlmacen  ASC,IdTipoDocumento  ASC,IdMovimiento  ASC,IdEmpresa  ASC)
go


ALTER TABLE Almacen.TipoDocumentoMovimientoAlmacen
	ADD CONSTRAINT  R_101 FOREIGN KEY (IdTipoDocumento,IdMovimiento,IdEmpresa) REFERENCES Almacen.TipoDocumentoMovimiento(IdTipoDocumento,IdMovimiento,IdEmpresa)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


-- Almacen
alter table Almacen.Almacen add
IdMovimientoIngresoPreferido int not null default 0,
IdMovimientoSalidaPreferido int not null default 0
go

-- Kardex
alter table Almacen.Kardex add 
IdTipoPago int not null,
IdTipoDocumento int not null,
SerieNombre  nvarchar(32)  NULL,
Serie int not null,
Correlativo int not null;

-- Despacho
alter table Almacen.Despacho add 
IdTipoDocumento int not null,
SerieNombre  nvarchar(32)  NULL,
Serie int not null,
Correlativo int not null;
go

CREATE FUNCTION General.GeneraCodigoProducto(
	@EmpresaId int,
	@MarcaId int,
	@FamiliaId int	
)
RETURNS NVARCHAR(512)
AS
begin

declare @codigoProducto int;
declare @inicio varchar(7);
declare @codigo Nvarchar(512);

--set @codigoProducto = (select convert(int,Valor) + 1 from General.Configuracion con where con.IdEmpresa = @EmpresaId and con.Nombre = 'CodigoProductoCorrelativo');
set @codigoProducto = (select count(Id) + 1 from Almacen.Producto where IdEmpresa = @EmpresaId and IdMarca = @MarcaId and IdFamiliaProducto = @FamiliaId and CodigoInterno is not null);

set @inicio = ISNULL((select valor from General.Configuracion where IdEmpresa = @EmpresaId and Nombre = 'CodigoProductoInicio' and Activo = 1), 'PP');

select @codigo = (
	-- Inicio
	@inicio + REPLICATE('P', 2 - LEN(@inicio))
	
	-- Catalogo
	+ ISNULL(  (select upper(cat.Abreviatura) from Almacen.Marca mar 
				inner join Campana.Catalogo cat on mar.IdCatalogo = cat.id and mar.IdEmpresa = cat.IdEmpresa
				where mar.Id = @MarcaId and mar.IdEmpresa = @EmpresaId) , SUBSTRING(cast(year(getdate()) as varchar), 3, 2))
	-- Marca
	+ ISNULL(  (select upper(mar.Abreviatura) from Almacen.Marca mar where mar.Id = @MarcaId and mar.IdEmpresa = @EmpresaId), 
				(REPLICATE('0',2 - LEN(CONVERT(VARCHAR,DAY(getdate())))) + CONVERT(VARCHAR,DAY(getdate()))))

	-- Familia
	+ ISNULL(  (select upper(fam.Abreviatura) from Almacen.FamiliaProducto fam where fam.Id = @FamiliaId and fam.IdEmpresa = @EmpresaId),
				(REPLICATE('0',2 - LEN(CONVERT(VARCHAR,month(getdate())))) + CONVERT(VARCHAR,month(getdate()))))

	-- Correlativo
	+ (REPLICATE('0', 4 - LEN(CONVERT(VARCHAR, @codigoProducto))) + CONVERT(VARCHAR, @codigoProducto) )
	);
	
	return @Codigo;

end;
GO