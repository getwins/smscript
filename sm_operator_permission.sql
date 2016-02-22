--操作员使用SManager的权限
if exists (select 1
            from  sysobjects
            where  id = object_id('sm_operator_permission')
            and    type = 'U')
   drop table sm_operator_permission
go

/*==============================================================*/
/* Table: sm_operator_permission                                       */
/*==============================================================*/
create table sm_operator_permission (
	oper_code		varchar(16)			not null,                --操作员
	type 			varchar(5)			not null,				--权限类别
	param			varchar(200)		null,					--参数值
	set_oper		varchar(16)			null,					--设置操作员
   constraint PK_SM_OPERATOR_PERMISSION primary key (oper_code, type)
)
go