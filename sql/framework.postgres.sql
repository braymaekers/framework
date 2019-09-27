/* framework tables */
drop database if exists pdi_framework;
CREATE DATABASE pdi_framework WITH OWNER = postgres ENCODING = 'UTF8' TABLESPACE = pg_default;

	/* Once connected to a database: */
	
\connect pdi_framework;

CREATE SCHEMA pdi_control AUTHORIZATION postgres;

DROP TABLE IF EXISTS pdi_control.job_control;
CREATE TABLE pdi_control.job_control (
	batch_id int4 NULL,
	jobname varchar(124) NULL,
	work_unit varchar(124) NULL,
	status varchar(32) NULL,
	project varchar(64) NULL,
	starttime timestamp NULL,
	logtime timestamp NULL,
	ip_address text NULL,
	hostname text NULL,
	pid int4 NULL
)
WITH (
	OIDS=FALSE
) ;
