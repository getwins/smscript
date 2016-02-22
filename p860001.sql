--设置客户风控


if exists(select * from sysobjects where id=object_id('p860001') and  (type='P') )
        drop proc p860001
go


create  procedure p860001
        @mi_oper_code    varchar(10),    --操作员
		@mi_sstatus0    char,    --操作标志（增加、修改、删除）   
		@mi_cust_no		varchar(16),
		@mi_rc_class	varchar(5),
		@mi_rc_type		varchar(5),
		@mi_rc_param_list	varchar(200)
as
begin
    declare @ocode int, @omsg varchar(80),@rowcount_var int,@ret int
	declare @max_seq int
	
	if @mi_cust_no = '' or @mi_rc_class = '' or @mi_rc_type = ''
	begin
		select @ocode = 86000101,@omsg = '输入的客户号、风控类、风控类别不能为空'
	    goto l_fatal
	end

	if @mi_sstatus0 not in('1', '2', '3')
	begin
		select @ocode = 86000101,@omsg = '无效的操作标志'
	    goto l_fatal
	end

	
	if @mi_sstatus0 = '1'
	begin
		if exists(select * from sm_cust_risk_control
				   where (cust_no = @mi_cust_no) and (rc_class = @mi_rc_class) and (rc_type = @mi_rc_type))
		begin
			select @ocode = 86000102,@omsg = '客户风险设置已经存在'
			goto l_fatal
		end
		
		insert into sm_cust_risk_control (cust_no, rc_class, rc_type, rc_param_list, oper_code)
		values (@mi_cust_no, @mi_rc_class, @mi_rc_type, @mi_rc_param_list, @mi_oper_code)
		select @ocode = @@error, @rowcount_var = @@rowcount
		if (@ocode <> 0)
		begin
			select @omsg='添加客户风控规则失败'
			goto l_fatal
		end
	end
	
	if @mi_sstatus0 = '2'
	begin
		if not exists(select * from sm_cust_risk_control
				   where (cust_no = @mi_cust_no) and (rc_class = @mi_rc_class) and (rc_type = @mi_rc_type))
		begin
			select @ocode = 86000103,@omsg = '客户风险设置不存在'
			goto l_fatal
		end
		
		update sm_cust_risk_control
		set rc_param_list = @mi_rc_param_list,
			oper_code = @mi_oper_code
		where (cust_no = @mi_cust_no) and (rc_class = @mi_rc_class) and (rc_type = @mi_rc_type)
		select @ocode = @@error, @rowcount_var = @@rowcount
		if (@ocode <> 0)
		begin
			select @omsg='修改客户风控规则失败'
			goto l_fatal
		end
	end
	
	if @mi_sstatus0 = '3'
	begin
		if not exists(select * from sm_cust_risk_control
				   where (cust_no = @mi_cust_no) and (rc_class = @mi_rc_class) and (rc_type = @mi_rc_type))
		begin
			select @ocode = 86000104,@omsg = '客户风险设置不存在'
			goto l_fatal
		end
		
		delete from sm_cust_risk_control
		where (cust_no = @mi_cust_no) and (rc_class = @mi_rc_class) and (rc_type = @mi_rc_type)
		select @ocode = @@error, @rowcount_var = @@rowcount
		if (@ocode <> 0)
		begin
			select @omsg='删除客户风控规则失败'
			goto l_fatal
		end
	end
	
	select @max_seq = isnull((select max(rc_update_seq) from sm_cust_risk_seq), 0)
	if exists (select * from sm_cust_risk_seq
			   where (cust_no = @mi_cust_no) and (rc_class = @mi_rc_class) and (rc_type = @mi_rc_type))
	begin
		update sm_cust_risk_seq
		set rc_update_seq = (@max_seq + 1)
		where (cust_no = @mi_cust_no) and (rc_class = @mi_rc_class) and (rc_type = @mi_rc_type)
	end
	else
	begin
		insert into sm_cust_risk_seq (cust_no, rc_class, rc_type, rc_update_seq)
		values (@mi_cust_no, @mi_rc_class, @mi_rc_type, @max_seq+1)
	end
	select @ocode = @@error, @rowcount_var = @@rowcount
	if (@ocode <> 0)
	begin
		select @omsg='修改客户风控规则成功,更新最大序号失败'
		goto l_fatal
	end
	/*
	if exists(select * from sm_cust_risk_control where (cust_no = @mi_cust_no) and (rc_class = @mi_rc_class) and (rc_type = @mi_rc_type))
		update sm_cust_risk_control
		set rc_param_list = @mi_rc_param_list,
			rc_update_seq = @max_seq + 1,
			oper_code = @mi_oper_code
		where (cust_no = @mi_cust_no) and (rc_class = @mi_rc_class) and (rc_type = @mi_rc_type)
	else
		insert into sm_cust_risk_control (cust_no, rc_class, rc_type, rc_param_list, rc_update_seq, oper_code)
		values (@mi_cust_no, @mi_rc_class, @mi_rc_type, @mi_rc_param_list, @max_seq + 1, @mi_oper_code)

	select @ocode = @@error, @rowcount_var = @@rowcount
	if (@ocode <> 0)
	begin
		select @omsg='设置客户风控规则出错！'
		goto l_fatal
	end
	*/
	
	return 0
	
l_fatal:
    select "fatal"=@ocode, @omsg
    return -1
		
end
go

/*
declare @update_flag char
exec	sp_upgrade_control
	'6.8.6.1',			--版本号
	'2',				--操作标志
	'p860001',			--sp功能号
	@update_flag output		--修改标志
if @update_flag <> '0'
	print '出现错误。create proc p860001.sql失败！'
else
	print 'create proc p860001.sql '
go
*/