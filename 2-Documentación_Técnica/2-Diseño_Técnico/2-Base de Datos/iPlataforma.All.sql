USE [master];
GO

--DROP DATABASE [iPlataforma];
--GO
/*
EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'iPlataforma'
GO
USE [master]
GO
ALTER DATABASE [iPlataforma] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO

DROP DATABASE [iPlataforma]
GO*/
/**/

CREATE DATABASE [iPlataforma];
GO

USE [iPlataforma];
GO




-- Login para plataforma

CREATE LOGIN uPlataforma   
    WITH PASSWORD = '1Plataforma$';
GO

-- Login con rol 'sa'
ALTER SERVER ROLE [sysadmin] ADD MEMBER [uPlataforma]
GO
/**/

-- Usuario para login
CREATE USER uPlataforma FOR LOGIN uPlataforma;
GO

--Esquemas
CREATE SCHEMA General AUTHORIZATION uPlataforma;  
GO 


CREATE SCHEMA Comun AUTHORIZATION uPlataforma;  
GO 


CREATE SCHEMA Almacen AUTHORIZATION uPlataforma;  
GO 


CREATE SCHEMA Seguridad AUTHORIZATION uPlataforma;  
GO 


CREATE SCHEMA Campana AUTHORIZATION uPlataforma;  
GO 


/*
AZURE DB

CREATE SCHEMA General AUTHORIZATION dbo;  
GO 


CREATE SCHEMA Comun AUTHORIZATION dbo;  
GO 


CREATE SCHEMA Almacen AUTHORIZATION dbo;  
GO 


CREATE SCHEMA Seguridad AUTHORIZATION dbo;  
GO 

CREATE SCHEMA Campana AUTHORIZATION dbo;  
GO

*/

/*
smarterasp
EJECUTAR uno por uno
*/