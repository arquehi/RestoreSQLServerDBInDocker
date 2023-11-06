USE master
GO

ALTER DATABASE [checkv2]
SET SINGLE_USER
--This rolls back all uncommitted transactions in the db.
WITH ROLLBACK IMMEDIATE
GO

RESTORE DATABASE [checkv2] 
FROM
  DISK = N'/var/opt/mssql/data\checkv2_20230518_qdf.bak'
WITH
  FILE = 1,
  MOVE N'check' TO '/var/opt/mssql/data\checkv2.ndf', 
  MOVE N'check_log' TO '/var/opt/mssql/data\checkv2_log.ldf', 
  REPLACE,
  RECOVERY,
  STATS = 5;
