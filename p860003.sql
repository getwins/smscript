--查询操作员使用SManager的权限

if exists(select * from sysobjects where id=object_id('p860003') and  (type='P') )
        drop proc p860003
go


create  procedure p860003
	@mi_oper_code2    varchar(10),   --查询操作员
	@mi_oper_code    varchar(10),     --操作员代码
	@mi_type		 varchar(4),    --权限类别
	@mi_param		 varchar(201)=''     --参数值
as
begin
    declare @ocode int, @omsg varchar(80),@rowcount_var int
	
	select oper_code,
		type,
		param
	from sm_operator_permission
	where (oper_code = @mi_oper_code or @mi_oper_code = '')
		and (type = @mi_type or @mi_type = '')
		and (param = @mi_param or @mi_param = '')
	
		
	select @ocode = @@error, @rowcount_var = @@rowcount
	if (@ocode <> 0)
	begin
		select @omsg='查询操作员SManager权限出错'
		goto l_fatal
	end
	
	return 0
	
l_fatal:
    select "fatal"=@ocode, @omsg
    return -1
end