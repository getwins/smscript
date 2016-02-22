--设置操作员SManager权限


if exists(select * from sysobjects where id=object_id('p860004') and  (type='P') )
        drop proc p860004
go


create  procedure p860004
        @mi_oper_code2    varchar(10),   --设置操作员
		@mi_sstatus0    char,    --操作标志（增加、修改、删除）
		@mi_oper_code    varchar(10),     --操作员代码   
		@mi_type		varchar(16),
		@mi_param		varchar(201)
as
begin
    declare @ocode int, @omsg varchar(80),@rowcount_var int

	
	if @mi_oper_code = '' or @mi_type = ''
	begin
		select @ocode = 86000401,@omsg = '输入的操作员和权限类别不能为空'
	        goto l_fatal
	end

	if (@mi_sstatus0 not in('1', '2', '3'))
	begin
		select @ocode = 86000401,@omsg = '无效的操作标志'
	   	goto l_fatal
	end

	
	if @mi_sstatus0 = '1'
	begin
		if exists(select * from sm_operator_permission
				   where (oper_code = @mi_oper_code) and (type = @mi_type) )
		begin
			select @ocode = 86000402,@omsg = '设置已经存在'
			goto l_fatal
		end
		
		insert into sm_operator_permission (oper_code, type, param, set_oper)
		values (@mi_oper_code, @mi_type, @mi_param, @mi_oper_code2)
		select @ocode = @@error, @rowcount_var = @@rowcount
		if (@ocode <> 0)
		begin
			select @omsg='添加权限失败'
			goto l_fatal
		end
	end
	
	if @mi_sstatus0 = '2'
	begin
		if not exists(select * from sm_operator_permission
				   where (oper_code = @mi_oper_code) and (type = @mi_type) )
		begin
			select @ocode = 86000403,@omsg = '操作员权设置不存在'
			goto l_fatal
		end
		
		update sm_operator_permission
		set param = @mi_param,
			set_oper = @mi_oper_code2
		where (oper_code = @mi_oper_code) and (type = @mi_type)
		select @ocode = @@error, @rowcount_var = @@rowcount
		if (@ocode <> 0)
		begin
			select @omsg='修改操作员权限失败'
			goto l_fatal
		end
	end
	
	if @mi_sstatus0 = '3'
	begin
		if not exists(select * from sm_operator_permission
				   where (oper_code = @mi_oper_code) and (type = @mi_type) )
		begin
			select @ocode = 86000404,@omsg = '操作员权设置不存在'
			goto l_fatal
		end
		
		delete from sm_operator_permission
		where (oper_code = @mi_oper_code) and (type = @mi_type)
		select @ocode = @@error, @rowcount_var = @@rowcount
		if (@ocode <> 0)
		begin
			select @omsg='删除操作员权设置失败'
			goto l_fatal
		end
	end
		
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
	'p860004',			--sp功能号
	@update_flag output		--修改标志
if @update_flag <> '0'
	print '出现错误。create proc p860004.sql失败！'
else
	print 'create proc p860004.sql '
go
*/