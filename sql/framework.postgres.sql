/* framework tables */
CREATE DATABASE "LOCAL" with owner postgres
CREATE DATABASE "DEV" with owner postgres

	/* Once connected to a database: */
CREATE SCHEMA pdi_control AUTHORIZATION postgres;
CREATE SCHEMA pdi_logging AUTHORIZATION postgres;

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

DROP TABLE IF EXISTS pdi_logging.log_channel;
CREATE TABLE pdi_logging.log_channel (
	id_batch int4 NULL,
	channel_id varchar(255) NULL,
	log_date timestamp NULL,
	logging_object_type varchar(255) NULL,
	object_name varchar(255) NULL,
	object_copy varchar(255) NULL,
	repository_directory varchar(255) NULL,
	filename varchar(255) NULL,
	object_id varchar(255) NULL,
	object_revision varchar(255) NULL,
	parent_channel_id varchar(255) NULL,
	root_channel_id varchar(255) NULL
)
WITH (
	OIDS=FALSE
);

DROP TABLE IF EXISTS pdi_logging.log_job;
CREATE TABLE pdi_logging.log_job (
	id_job int4 NULL,
	channel_id varchar(255) NULL,
	jobname varchar(255) NULL,
	status varchar(15) NULL,
	lines_read int8 NULL,
	lines_written int8 NULL,
	lines_updated int8 NULL,
	lines_input int8 NULL,
	lines_output int8 NULL,
	lines_rejected int8 NULL,
	errors int8 NULL,
	startdate timestamp NULL,
	enddate timestamp NULL,
	logdate timestamp NULL,
	depdate timestamp NULL,
	replaydate timestamp NULL,
	log_field text NULL
)
WITH (
	OIDS=FALSE
) ;
CREATE INDEX "IDX_log_job_1" ON pdi_logging.log_job USING btree (id_job) ;
CREATE INDEX "IDX_log_job_2" ON pdi_logging.log_job USING btree (errors, status, jobname) ;

DROP TABLE IF EXISTS pdi_logging.log_tran;
CREATE TABLE pdi_logging.log_tran (
	id_batch int4 NULL,
	channel_id varchar(255) NULL,
	transname varchar(255) NULL,
	status varchar(15) NULL,
	lines_read int8 NULL,
	lines_written int8 NULL,
	lines_updated int8 NULL,
	lines_input int8 NULL,
	lines_output int8 NULL,
	lines_rejected int8 NULL,
	errors int8 NULL,
	startdate timestamp NULL,
	enddate timestamp NULL,
	logdate timestamp NULL,
	depdate timestamp NULL,
	replaydate timestamp NULL,
	log_field text NULL
)
WITH (
	OIDS=FALSE
) ;
CREATE INDEX "IDX_log_tran_1" ON pdi_logging.log_tran USING btree (id_batch) ;
CREATE INDEX "IDX_log_tran_2" ON pdi_logging.log_tran USING btree (errors, status, transname) ;

/* framework demo tables */
CREATE SCHEMA sales_dwh AUTHORIZATION postgres;
