--��ѯ����Աʹ��SManager��Ȩ��

if exists(select * from sysobjects where id=object_id('p860003') and  (type='P') )
        drop proc p860003
go


create  procedure p860003
	@mi_oper_code2    varchar(10),   --��ѯ����Ա
	@mi_oper_code    varchar(10),     --����Ա����
	@mi_type		 varchar(4),    --Ȩ�����
	@mi_param		 varchar(201)=''     --����ֵ
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
		select @omsg='��ѯ����ԱSManagerȨ�޳���'
		goto l_fatal
	end
	
	return 0
	
l_fatal:
    select "fatal"=@ocode, @omsg
    return -1
end