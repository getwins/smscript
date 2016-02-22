--���ò���ԱSManagerȨ��


if exists(select * from sysobjects where id=object_id('p860004') and  (type='P') )
        drop proc p860004
go


create  procedure p860004
        @mi_oper_code2    varchar(10),   --���ò���Ա
		@mi_sstatus0    char,    --������־�����ӡ��޸ġ�ɾ����
		@mi_oper_code    varchar(10),     --����Ա����   
		@mi_type		varchar(16),
		@mi_param		varchar(201)
as
begin
    declare @ocode int, @omsg varchar(80),@rowcount_var int

	
	if @mi_oper_code = '' or @mi_type = ''
	begin
		select @ocode = 86000401,@omsg = '����Ĳ���Ա��Ȩ�������Ϊ��'
	        goto l_fatal
	end

	if (@mi_sstatus0 not in('1', '2', '3'))
	begin
		select @ocode = 86000401,@omsg = '��Ч�Ĳ�����־'
	   	goto l_fatal
	end

	
	if @mi_sstatus0 = '1'
	begin
		if exists(select * from sm_operator_permission
				   where (oper_code = @mi_oper_code) and (type = @mi_type) )
		begin
			select @ocode = 86000402,@omsg = '�����Ѿ�����'
			goto l_fatal
		end
		
		insert into sm_operator_permission (oper_code, type, param, set_oper)
		values (@mi_oper_code, @mi_type, @mi_param, @mi_oper_code2)
		select @ocode = @@error, @rowcount_var = @@rowcount
		if (@ocode <> 0)
		begin
			select @omsg='���Ȩ��ʧ��'
			goto l_fatal
		end
	end
	
	if @mi_sstatus0 = '2'
	begin
		if not exists(select * from sm_operator_permission
				   where (oper_code = @mi_oper_code) and (type = @mi_type) )
		begin
			select @ocode = 86000403,@omsg = '����ԱȨ���ò�����'
			goto l_fatal
		end
		
		update sm_operator_permission
		set param = @mi_param,
			set_oper = @mi_oper_code2
		where (oper_code = @mi_oper_code) and (type = @mi_type)
		select @ocode = @@error, @rowcount_var = @@rowcount
		if (@ocode <> 0)
		begin
			select @omsg='�޸Ĳ���ԱȨ��ʧ��'
			goto l_fatal
		end
	end
	
	if @mi_sstatus0 = '3'
	begin
		if not exists(select * from sm_operator_permission
				   where (oper_code = @mi_oper_code) and (type = @mi_type) )
		begin
			select @ocode = 86000404,@omsg = '����ԱȨ���ò�����'
			goto l_fatal
		end
		
		delete from sm_operator_permission
		where (oper_code = @mi_oper_code) and (type = @mi_type)
		select @ocode = @@error, @rowcount_var = @@rowcount
		if (@ocode <> 0)
		begin
			select @omsg='ɾ������ԱȨ����ʧ��'
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
	'6.8.6.1',			--�汾��
	'2',				--������־
	'p860004',			--sp���ܺ�
	@update_flag output		--�޸ı�־
if @update_flag <> '0'
	print '���ִ���create proc p860004.sqlʧ�ܣ�'
else
	print 'create proc p860004.sql '
go
*/