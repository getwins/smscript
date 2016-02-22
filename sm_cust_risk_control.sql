--�ͻ������Ϣ��sm_cust_risk_control

if exists (select 1
            from  sysobjects
            where  id = object_id('sm_cust_risk_control')
            and    type = 'U')
   drop table sm_cust_risk_control
go

/*==============================================================*/
/* Table: sm_cust_risk_control                                       */
/*==============================================================*/
create table sm_cust_risk_control (
   cust_no			varchar(16)          not null,        --�ͻ���,
   rc_class			varchar(5)			 not null, 			--������
   rc_type			varchar(5)			 not null, 			--�������
   rc_param_list		varchar(200)		null,
   oper_code		varchar(16)			null,                --���ò���Ա
   constraint PK_SM_CUST_RISK_CONTROL primary key (cust_no, rc_class, rc_type)
)
go


--�ͻ������ű�
if exists ( select 1
			from sysobjects
			where id = object_id('sm_cust_risk_seq')
			and type = 'U')
	drop table sm_cust_risk_seq
go
/*==============================================================*/
/* Table: sm_cust_risk_seq                                       */
/*==============================================================*/
create table sm_cust_risk_seq (
   cust_no			varchar(16)          not null,        --�ͻ���,
   rc_class			varchar(5)			 not null, 			--������
   rc_type			varchar(5)			 not null, 			--�������
   rc_update_seq	int					 not null, 			--�������
   constraint PK_SM_CUST_RISK_SEQ primary key (cust_no, rc_class, rc_type)
)
go
			