--查询客户风控规则信息

if exists(select * from sysobjects where id=object_id('p860000') and  (type='P') )
        drop proc p860000
go


create  procedure p860000
        @mi_oper_code    varchar(10),    --操作员
        @mi_cust_no      varchar(15),    --客户号
		@mi_rc_class	 varchar(5), 
		@mi_rc_type		 varchar(5)
as
begin
    declare @ocode int, @omsg varchar(80),@rowcount_var int,@ret int
	
	select cust_no, 
		rc_class, 
		rc_type,
		rc_param_list
	from sm_cust_risk_control
	where (@mi_cust_no = '' or cust_no = @mi_cust_no)
		and (@mi_rc_class = '' or rc_class = @mi_rc_class)
		and (@mi_rc_type = '' or rc_type = @mi_rc_type)
		
	select @ocode = @@error, @rowcount_var = @@rowcount
	if (@ocode <> 0)
	begin
		select @omsg='查询客户风控信息出错'
		goto l_fatal
	end
	
	return 0
	
l_fatal:
    select "fatal"=@ocode, @omsg
    return -1
end

/*
go
declare @update_flag char
exec	sp_upgrade_control
	'6.8.6.1',			--版本号
	'2',				--操作标志
	'p860000',			--sp功能号
	@update_flag output		--修改标志
if @update_flag <> '0'
	print '出现错误。create proc p860000.sql失败！'
else
	print 'create proc p860000.sql '
go
*/