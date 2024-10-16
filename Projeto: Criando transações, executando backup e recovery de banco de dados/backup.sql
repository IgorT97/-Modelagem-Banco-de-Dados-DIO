-- backup.sql

-- Realizar o backup do banco de dados e-commerce
mysqldump -u seu_usuario -p e_commerce > e_commerce_backup.sql

-- Realizar o recovery do banco de dados e-commerce
mysql -u seu_usuario -p e_commerce < e_commerce_backup.sql

-- Realizar o backup de múltiplos bancos de dados, incluindo procedures e eventos
mysqldump -u seu_usuario -p --databases e_commerce universidade --routines --events > multi_db_backup.sql
