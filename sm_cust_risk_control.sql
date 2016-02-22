--客户风控信息表：sm_cust_risk_control

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
   cust_no			varchar(16)          not null,        --客户号,
   rc_class			varchar(5)			 not null, 			--风控类别
   rc_type			varchar(5)			 not null, 			--风控类型
   rc_param_list		varchar(200)		null,
   oper_code		varchar(16)			null,                --设置操作员
   constraint PK_SM_CUST_RISK_CONTROL primary key (cust_no, rc_class, rc_type)
)
go


--客户风控序号表
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
   cust_no			varchar(16)          not null,        --客户号,
   rc_class			varchar(5)			 not null, 			--风控类别
   rc_type			varchar(5)			 not null, 			--风控类型
   rc_update_seq	int					 not null, 			--更新序号
   constraint PK_SM_CUST_RISK_SEQ primary key (cust_no, rc_class, rc_type)
)
go
			