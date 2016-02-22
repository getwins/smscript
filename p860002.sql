
--查询客户风控序号表的最大列新序号

if exists(select * from sysobjects where id=object_id('p860002') and  (type='P') )
        drop proc p860002
go


create  procedure p860002
        @mi_oper_code    varchar(10),    --操作员
		@mi_cust_no      varchar(15),    --客户号
		@mi_rc_class	 varchar(5), 
		@mi_rc_type		 varchar(5)
as
begin
    declare @ocode int, @omsg varchar(80),@rowcount_var int,@ret int


	select isnull(max(rc_update_seq), 0) 
	from sm_cust_risk_seq
	where (@mi_cust_no = '' or cust_no = @mi_cust_no)
		and (@mi_rc_class = '' or rc_class = @mi_rc_class)
		and (@mi_rc_type = '' or rc_type = @mi_rc_type)
		
	return 0
end
go

/*
declare @update_flag char
exec	sp_upgrade_control
	'6.8.6.1',			--版本号
	'2',				--操作标志
	'p860002',			--sp功能号
	@update_flag output		--修改标志
if @update_flag <> '0'
	print '出现错误。create proc p860002.sql失败！'
else
	print 'create proc p860002.sql '
go
*/