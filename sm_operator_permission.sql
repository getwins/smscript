--����Աʹ��SManager��Ȩ��
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
	oper_code		varchar(16)			not null,                --����Ա
	type 			varchar(5)			not null,				--Ȩ�����
	param			varchar(200)		null,					--����ֵ
	set_oper		varchar(16)			null,					--���ò���Ա
   constraint PK_SM_OPERATOR_PERMISSION primary key (oper_code, type)
)
go