/*#$&B#----�ű�ת���� For SyBase        03-12-04*/
/* --------------------------------------------------------------
 * �������ƣ�p859999.sql
 * �汾��Ϣ��6.8.4.x
 * �����ܣ��ͻ�����һ���ѯ'
 * ==============================================================

���������
          ����Ա       scust_no
          �ͻ���       sholder_ac_no
          �ͻ���       sserial1
          �ͻ�״̬      sstatus1
          �Ƿ���������ͻ� sstatus2
          �Ƿ��������ͻ� sstatus3

���������
          �ͻ���       sholder_ac_no
          �ͻ�����      sname
          �ͻ�ȫ��      sall_name
          ֤������      scust_type2
          ֤������      scert_no
          �ʱ�        spost_code
          ��ַ        saddr
          �绰        sphone
          �ֻ�        sphone3
          ����        sphone2
          �����ʼ�      semail
          ����        scust_auth2
          �������֤��  scust_limit2
          ��ͬ���      sbankname2
          �ͻ���       sserial1
          �����ʽ���    sstatus2
          ��������      sdate0
          ��������Ա    scust_no
          ��������      sdate1
          ��������Ա    scust_no2
          �ͻ�����      sstatus1
          ָ���´���1    scust_auth
          ָ���´������֤��1 scust_limit
          ָ���´���2    spager
          ָ���´������֤��2 scard0
          ָ���´���3    sstation1
          ָ���´������֤��3 scard1
          �ʽ������1    scert_no2
          �ʽ���������֤��1 sbank_acc
          �ʽ������2    scert_addr
          �ʽ������2    scert_addr
          �ʽ���������֤��2 sbank_acc2
          ��ע      snote
          �ͻ�״̬       sstatus3
          �������      semp_no

�����߼���

ע��㣺


 * ==============================================================
 * ��������:    20030811
 * ������:      SP�Զ�������
 * --------------------------------------------------------------
 * �޸����ڣ�   20031206
 * �޸���Ա��   wlj
 * �޸�������   û�пͻ����Ȩ���׼��sstation0����������ַ
 * ��ע��Ϣ��   6.0.0.2
 * --------------------------------------------------------------
 * �޸����ڣ�   20040115
 * �޸���Ա��   wlj
 * �޸�������   ��������������Ƿ���������ͻ�
 * ��ע��Ϣ��   6.0.0.3
 * --------------------------------------------------------------
 * �޸����ڣ�   20040116
 * �޸���Ա��   wlj
 * �޸�������   ��������������Ƿ��������ͻ�
 * ��ע��Ϣ��   6.0.0.4
 * --------------------------------------------------------------
 * �޸����ڣ�   2004220
 * �޸���Ա��   zyw
 * �޸�������   �����������:��ע
 * ��ע��Ϣ��   6.0.0.5
 * --------------------------------------------------------------
 * �޸����ڣ�   20040304
 * �޸���Ա��   wangliang
 * �޸�������   ���Ӳ���Ա�Կͻ��ķ�������
 * ��ע��Ϣ��   6.0.0.6
 * --------------------------------------------------------------
 * �޸����ڣ�   20060206
 * �޸���Ա��   ʩ����
 * �޸�������   ���ӷ������֤���������
 * ��ע��Ϣ��   6.0.4.1
 * --------------------------------------------------------------
 * �޸����ڣ�   20060316
 * �޸���Ա��   ʩ����
 * �޸�������   �������������������Ա����������Ա
 * ��ע��Ϣ��   6.0.4.2
 * --------------------------------------------------------------
 * �޸����ڣ�   20060413
 * �޸���Ա��   jk
 * �޸�������   ���Ӹ�����Ŀͻ�����ͳ��
 * ��ע��Ϣ��   6.0.4.3
 * --------------------------------------------------------------
 * �޸����ڣ�   20061208
 * �޸���Ա��   ʩ����
 * �޸�������   ��ֿͻ��żӿ��ѯ�ٶ�
 * ��ע��Ϣ��   6.4.0.1
 * --------------------------------------------------------------
 * �޸����ڣ�   20070605
 * �޸���Ա��   ʩ����
 * �޸�������   �������������֯�������롢��֯������ơ����������������������
 * ��ע��Ϣ��   6.4.5.1
 * --------------------------------------------------------------
 * �޸����ڣ�   20070614
 * �޸���Ա��   ʩ����
 * �޸�������   �������������֯�������롢��������
 * ��ע��Ϣ��   6.4.5.2
 * --------------------------------------------------------------
 * �޸����ڣ�   20070919
 * �޸���Ա��   �Ž���
 * �޸�������   ��ѯ�����������Ӿ����˴���
 * ��ע��Ϣ��   6.4.5.2
 * --------------------------------------------------------------
 * �޸����ڣ�   20070919
 * �޸���Ա��   �Ž���
 * �޸�������   ������������ͻ�����
 * ��ע��Ϣ��   6.4.5.2
 * --------------------------------------------------------------
 * �޸����ڣ�   20080219
 * �޸���Ա��   ��Ծ��
 * �޸�������   ����������������ɺϼ�
 * ��ע��Ϣ     6.5.0.1
 * --------------------------------------------------------------
 * �޸����ڣ�   20080421
 * �޸���Ա��   zlm
 * �޸�������   ����ͬ��ű�Ϊ20λ
 * ��ע��Ϣ     6.6.0.1
 * --------------------------------------------------------------
 * �޸����ڣ�   20080422
 * �޸���Ա��   zlm
 * �޸�������   Ӫҵִ�յķ���֤����Ϊ20λ
 * ��ע��Ϣ     6.6.0.2
 * --------------------------------------------------------------
 * �޸����ڣ�   20080516
 * �޸���Ա��   szy
 * �޸�������   ���ӽ���ʱ����������ѯ����
 * ��ע��Ϣ     6.6.0.3
 * --------------------------------------------------------------
 * �޸����ڣ�   20080516
 * �޸���Ա��   szy
 * �޸�������   �����������ϼƵ�����
 * ��ע��Ϣ     6.6.0.4
 * --------------------------------------------------------------
 * �޸����ڣ�   20080710
 * �޸���Ա��   zlm
 * �޸�������  �޲�ѯ���ʱ������,�����˴���ϼ��г�������
 * ��ע��Ϣ     6.6.0.5
 * --------------------------------------------------------------
 * �޸����ڣ�	20081121
 * �޸���Ա��	jk
 * �޸�������	��ѭ�����¿ͻ���������Ϣ�������⣬��ʹֻ��һ���ͻ���Ҳ������пͻ�����������ѭ��������Ӱ���ٶȡ���д����
 * ��ע��Ϣ��	6.6.5.1
 * --------------------------------------------------------------
 * �޸����ڣ�	20081224
 * �޸���Ա��	ykl&zyw&jq
 * �޸�������   �����ӡ��䣬��λ��ʱ���ĵص㡣����Ծ�����ۺ��ȡ�����˵�ѭ�������˸�д��
 		�ͽ��������˲��ԡ�
		���ɾ����˵Ĵ����߼���Щ���ö����������ƹ����Ե����Ե��߼�����˺ͽ�����Ծ���������ϸ�Ĵ����߲顣

 * ��ע��Ϣ��	6.6.5.2
 * --------------------------------------------------------------
 * �޸����ڣ�	20100707
 * �޸���Ա��	jk
 * �޸�������	������֯����������������ѯ������
 * ��ע��Ϣ��	6.8.2.1
 * --------------------------------------------------------------
 * �޸����ڣ�	20120327
 * �޸���Ա��	zlm
 * �޸�������	������������ӽ�������
 * ��ע��Ϣ��	6.8.4.1
 * --------------------------------------------------------------
 * �޸����ڣ�	20120717
 * �޸���Ա��	zlm
 * �޸�������	�������Ĵ��볤����չΪ10λ
 * ��ע��Ϣ��	6.8.4.2
 * --------------------------------------------------------------
 * �޸����ڣ�	20130527
 * �޸���Ա��	lt
 * �޸�������	��ѯ�����������ȫ��Ϊ����ʾȥ��"����ʱ"
 * ��ע��Ϣ��	6.8.6.1
 * --------------------------------------------------------------
 * �޸����ڣ�	20151229
 * �޸���Ա��	chp
 * �޸�������	����851002��д�����ӿ�������Ա���
 * ��ע��Ϣ��	6.8.6.1
 * --------------------------------------------------------------

���Խű�
exec p859999
   '123',  --����Ա
   '000002',  --�ͻ���
   '',  --�ͻ���
   '',  --�ͻ�״̬
   '',  --��������Ա
   '1', --�Ƿ���������ͻ���0��������1������ȱʡ��
   '1',  --�Ƿ��������ͻ���0��������1������ȱʡ��
   '',
   '',
   ''
-------------------------------------------------------------- */
if exists(select * from sysobjects where id=object_id('p859999') and  (type='P') )
        drop proc p859999
go

exec	sp_upgrade_control
	'6.8.6.1',			--�汾��
	'1',				--������־
	'p859999',			--sp���ܺ�
	''				--�޸ı�־
go

create  procedure p859999
        @mi_oper_code    varchar(10),    --����Ա
        @mi_cust_no      varchar(15),    --�ͻ���
        @mi_cust_class   varchar(12),    --�ͻ���
        @mi_cust_status  char,             --�ͻ�״̬
		@mi_open_oper_code varchar(10),    --��������Ա
        @mi_flag         char = '1' ,      --�Ƿ���������ͻ���0��������1������ȱʡ��
        @mi_flag2          char = '1',       --�Ƿ��������ͻ���0��������1������ȱʡ��
        --6.4.5.2 20070614 �������������֯�������롢��������
        @mi_organ_no    varchar(20) = '',
        @mi_coop_no     varchar(20) = '',
        @mi_cust_corp char(1) = '',
        @mi_sum_flag char(1) = '1',  --���ɺϼƣ�'1'����'0'������
	--20080516 szy ���ӽ���ʱ����������ѯ����
        @mi_limit char(1) = '0'	,	--���Ʋ�ѯ��1-���Ʋ�ѯ��0-������
        @mi_trading_no   varchar(10) = ''    --�������� 6.8.4.2 zlm 20120717
as
begin
        declare @ocode int, @omsg varchar(80),@rowcount_var int,@ret int
	--20080516 szy ���ӽ���ʱ����������ѯ����
	declare @log_flag char(1),	--�Ƿ��¼��־
		@num int,		--���ؼ�¼����
		@all_null char(1)	--�Ƿ�����ȫ��

	--20080516 szy ���ӽ���ʱ����������ѯ����
	--���Ʋ�ѯ
	if @mi_limit = '1'
	begin
		exec  CheckQryTime
			@mi_oper_code,    	--����Ա
			859999,    		--���ܱ��
			'',    		--��ʼ����
			'',    			--��������
			@mi_cust_no,    	--�ͻ���
			@mi_cust_class,  	--�ͻ���
			@log_flag output,	--�Ƿ��¼��־(���)  0: ����1������־
			@ocode output,	--���ش���(���)	0�������ѯ  ��0��������
			@omsg output,		--������Ϣ(���)
			@num output, 	--���mo_code������0����Ϊ���ؼ�¼���������Ϊ0��Ϊ�������������
			@all_null output	--�Ƿ�����ȫ��Ϊ�գ�1����0������

		--����������ѯ
		if @ocode <> 0
		begin
	                goto l_fatal
		end

		--�Ƿ�����Ϊ��
		if @all_null = '0'
		begin
			if @mi_cust_no = '' and @mi_cust_class = '' and @mi_cust_status  = '' and @mi_organ_no = ''
	        		and @mi_coop_no = '' and @mi_cust_corp = '' and @mi_trading_no = ''
	        	begin
	        		select @ocode = 51002001,@omsg = '��ѯ�����������ȫ��Ϊ��'  --6.8.6.1
	        		goto l_fatal
	        	end
		end

		--�����¼��־
		if @log_flag = '1'
		begin
			 --��ʼ��־
			declare @desc varchar(800),@dates_out char(8),@lsh_out int,@err int
			declare @cur_date char(8)
			select @cur_date = convert (char(8), getdate(), 112)
			--��¼��־
			select  @desc =	convert(varchar,@mi_oper_code) + '|' +
				convert(varchar,@mi_cust_no) + '|' +
				convert(varchar,@mi_cust_class) + '|' +
				convert(varchar,@mi_cust_status) + '|' +
				convert(varchar,@mi_open_oper_code) + '|' +
				convert(varchar,@mi_flag) + '|' +
				convert(varchar,@mi_flag2) + '|' +
				convert(varchar,@mi_organ_no) + '|' +
				convert(varchar,@mi_coop_no) + '|' +
				convert(varchar,@mi_cust_corp) + '|' +
				convert(varchar,@mi_sum_flag) + '|' +
				convert(varchar,@mi_limit) + '|' +
				convert(varchar,@mi_trading_no)

			--���ܱ��,����Ա,����,˳��,����(���),��ˮ��(���),������(���)���ɹ���־
			exec p850009 859999,@mi_oper_code,@mi_cust_no,9999,@desc,@dates_out output,@lsh_out output,@err output,'1'
			--������־
		end
	end
	
	create table #result(
		trading_no	varchar(10) null,	--�������Ĵ��� 
		trading_name	varchar(40) null,	--������������
		cust_no		varchar(16) null,
		cust_name	varchar(8)  null,
		cust_class	char(10)    null,
		cust_status	char(1)	    null
	)
	
	
	exec   @ret=	tykh_query_trading_no  	@mi_oper_code    ,    --����Ա    
        					@mi_trading_no   ,    --�������Ĵ��� 
        					@mi_cust_no      ,    --�ͻ���      
        					@mi_cust_class       --�ͻ��� 
	if @ret <>0
	begin
		goto l_fatal
	end
	
	--6.4.5.1 20070605 �������������֯�������롢��֯������ơ����������������������
	declare @organ_inner_id varchar(255),@coop_inner_id varchar(255)
	select @organ_inner_id = '',@coop_inner_id = ''
	if @mi_organ_no <> ''
	begin
	        select  @organ_inner_id = isnull(inner_id,'')
	        from    organ_relation_info
	        where   organ_no = @mi_organ_no
	end
	if @mi_coop_no <> ''
	begin
	        select  @coop_inner_id = isnull(inner_id,'')
	        from    organ_relation_info
	        where   organ_no = @mi_coop_no
	end

	create table #cust(
		cust_no varchar(16) null,       --�ͻ���
		cust_name varchar(8) null,      --�ͻ�����
		cust_full_name  varchar(80) null,  --�ͻ�ȫ��
		cert_type  char(1) null,        --֤������
		cert_no  varchar(18) null,      --֤������
		zip  char(6) null,              --�ʱ�
		addr varchar(80) null,                  --��ַ
		phone varchar(40) null,         --�绰
		mobile  varchar(40) null,       --�ֻ�
		fax     varchar(40) null,               --����
		email   varchar(60) null,               --�����ʼ�
		frdb    varchar(20) null,               --����
		frdb_id varchar(20) null,               --�������֤�� zlm 20080422 6.6.0.2
		contract_no     varchar(20) null,     --��ͬ���    zlm 20080421 6.6.0.1
		cust_class      char(10) null,      --�ͻ���
		sharemoney      char(1) null,      --�����ʽ���
		open_date       char(8) null,       --��������
		close_date      char(8) null,      --��������
		cust_corp       char(1) null,       --�ͻ�����
		cmd_assign1     varchar(20) null,     --ָ���´���1
		cmd_assign_id1  varchar(18) null,  --ָ���´������֤��1
		cmd_assign2     varchar(20) null,     --ָ���´���2
		cmd_assign_id2  varchar(18) null,  --ָ���´������֤��2
		cmd_assign3     varchar(20) null,     --ָ���´���3
		cmd_assign_id3  varchar(18) null,  --ָ���´������֤��3
		fund_allot1     varchar(20) null,     --�ʽ������1
		fund_allot_id1  varchar(18) null,  --�ʽ���������֤��1
		fund_allot2     varchar(20) null,     --�ʽ������2
		fund_allot_id2  varchar(18) null,   --�ʽ���������֤��2
		note    varchar(80) null,            --��ע
		cust_status     char(1) null,      --״̬
		set_status      varchar(8) null,        --�������
		open_oper_code  varchar(10) null,  --��������Ա
		close_oper_code varchar(10) null,  --��������Ա
		organ_insti     varchar(20) null,       --��֯����
		organ_name      varchar(20) null,       --��֯�������
		coop_insti      varchar(20) null,       --��������
		coop_name       varchar(20) null,       --�����������
		broker_no varchar(255) null --�����˴��� --zjf 20070919 ������Ӿ����˴���
	)

	declare @if_access char
	select @if_access = if_access from operator where oper_code = @mi_oper_code

	--20080516 szy ���ӽ���ʱ����������ѯ����
	--���Ʋ�ѯ
	--�������
	if @mi_limit = '1' and @num <> 0
	begin
		select @num  = @num - 1
		set rowcount @num
	end

	if @if_access = '0'     -- ������
	begin
		--6.6.5.1 ȡ���ϼƲ���ȡinsert��@@rowcoun��ʽ

		--6.4.0.1 20061208 ��ֿͻ��żӿ��ѯ�ٶ�
		if @mi_cust_no = ''
		begin
			--6.4.5.1 20070605 �������������֯�������롢��֯������ơ����������������������
			insert  #cust
			select
					cust_whole.cust_no,     --�ͻ���
					cust_basic.cust_name,   --�ͻ�����
					cust_whole.cust_full_name,  --�ͻ�ȫ��
					cust_basic.cert_type,           --֤������
					cust_basic.cert_no,     --֤������
					cust_whole.zip,                 --�ʱ�
					cust_whole.addr,                --��ַ
					cust_whole.phone,       --�绰
					cust_whole.mobile,      --�ֻ�
					cust_whole.fax,                 --����
					cust_whole.email,               --�����ʼ�
					cust_whole.frdb,                --����
					cust_whole.frdb_id,             --�������֤��
					cust_whole.contract_no,     --��ͬ���
					cust_basic.cust_class,      --�ͻ���
					cust_basic.sharemoney,      --�����ʽ���
					cust_whole.open_date,       --��������
					cust_whole.close_date,      --��������
					cust_basic.cust_corp,       --�ͻ�����
					--cust_whole.low_interest,  --���Ȩ���׼
					cust_whole.cmd_assign1,     --ָ���´���1
					cust_whole.cmd_assign_id1,  --ָ���´������֤��1
					cust_whole.cmd_assign2,     --ָ���´���2
					cust_whole.cmd_assign_id2,  --ָ���´������֤��2
					cust_whole.cmd_assign3,     --ָ���´���3
					cust_whole.cmd_assign_id3,  --ָ���´������֤��3
					cust_whole.fund_allot1,     --�ʽ������1
					cust_whole.fund_allot_id1,  --�ʽ���������֤��1
					cust_whole.fund_allot2,     --�ʽ������2
					cust_whole.fund_allot_id2,   --�ʽ���������֤��2
					cust_whole.note,            --��ע
					cust_basic.cust_status,      --״̬ wlj 20040105 add
					case if_hand when '1' then 'S'  --�Ƿ�����������
					                 else ' ' end +
					case if_margin when '1' then 'B' --�Ƿ����ñ�֤��
					                 else ' ' end +
					case if_code when '1' then 'J' --�Ƿ����ý��ױ���
					                 else ' ' end +
					case if_auth when '1' then 'Q' --�Ƿ�����Ȩ��
					                 else ' ' end +
					case if_prop when '1' then 'P' --�Ƿ���������
					                 else ' ' end +
					case if_ret when '1' then 'F'  --�Ƿ����÷�Ӷ
					                 else ' ' end,
					cust_whole.open_oper_code,  --��������Ա        shiyl 20060316
					cust_whole.close_oper_code,  --��������Ա       shiyl 20060316
					--6.4.5.1 20070605 �������������֯�������롢��֯������ơ����������������������
					isnull(cust_basic.organ_insti,''),
					'',
					isnull(cust_basic.coop_insti,''),
					'',
					''
			from    cust_whole,cust_basic
			where	(cust_whole.cust_no = cust_basic.cust_no)
			and		(cust_basic.cust_class like @mi_cust_class or @mi_cust_class = '')
			AND     (cust_basic.cust_status = @mi_cust_status or @mi_cust_status= '')
			and		(cust_whole.open_oper_code = @mi_open_oper_code or @mi_open_oper_code = '')
			and     (@mi_flag = '1' or cust_basic.cust_status <> '7')
			and     (@mi_flag2 = '1' or cust_basic.cust_status <> '6')
			--6.4.5.2 20070614 �������������֯�������롢��������
			--20100707 6.8.2.1 ������֯����������������ѯ������
			and     (@organ_inner_id = '' or cust_basic.organ_inner_id = @organ_inner_id or cust_basic.organ_inner_id like @organ_inner_id + '|%')
			and     (@coop_inner_id = '' or cust_basic.coop_inner_id = @coop_inner_id or cust_basic.coop_inner_id like @coop_inner_id + '|%')
			and (@mi_cust_corp = '' or cust_basic.cust_corp = @mi_cust_corp) -- 6.4.5.2 20070919 ������������ͻ�����
			--order by cust_basic.cust_no,cust_basic.cert_type

			--6.6.5.1 ������֯��������ͳһ���ź���
		end
		else --�ͻ��Ų�Ϊ��
        begin
			--6.4.5.1 20070605 �������������֯�������롢��֯������ơ����������������������
			insert  #cust
			select
   					cust_whole.cust_no,     --�ͻ���
   					cust_basic.cust_name,   --�ͻ�����
   					cust_whole.cust_full_name,  --�ͻ�ȫ��
   					cust_basic.cert_type,           --֤������
   					cust_basic.cert_no,     --֤������
   					cust_whole.zip,                 --�ʱ�
   					cust_whole.addr,                --��ַ
   					cust_whole.phone,       --�绰
   					cust_whole.mobile,      --�ֻ�
   					cust_whole.fax,                 --����
   					cust_whole.email,               --�����ʼ�
   					cust_whole.frdb,                --����
   					cust_whole.frdb_id,             --�������֤��
   					cust_whole.contract_no,     --��ͬ���
   					cust_basic.cust_class,      --�ͻ���
   					cust_basic.sharemoney,      --�����ʽ���
   					cust_whole.open_date,       --��������
   					cust_whole.close_date,      --��������
   					cust_basic.cust_corp,       --�ͻ�����
   					--cust_whole.low_interest,  --���Ȩ���׼
   					cust_whole.cmd_assign1,     --ָ���´���1
   					cust_whole.cmd_assign_id1,  --ָ���´������֤��1
   					cust_whole.cmd_assign2,     --ָ���´���2
   					cust_whole.cmd_assign_id2,  --ָ���´������֤��2
   					cust_whole.cmd_assign3,     --ָ���´���3
   					cust_whole.cmd_assign_id3,  --ָ���´������֤��3
   					cust_whole.fund_allot1,     --�ʽ������1
   					cust_whole.fund_allot_id1,  --�ʽ���������֤��1
   					cust_whole.fund_allot2,     --�ʽ������2
   					cust_whole.fund_allot_id2,   --�ʽ���������֤��2
   					cust_whole.note,            --��ע
   					cust_basic.cust_status,      --״̬ wlj 20040105 add
   					case if_hand when '1' then 'S'  --�Ƿ�����������
   					                 else ' ' end +
   					case if_margin when '1' then 'B' --�Ƿ����ñ�֤��
   					                 else ' ' end +
   					case if_code when '1' then 'J' --�Ƿ����ý��ױ���
   					                 else ' ' end +
   					case if_auth when '1' then 'Q' --�Ƿ�����Ȩ��
   					                 else ' ' end +
   					case if_prop when '1' then 'P' --�Ƿ���������
   					                 else ' ' end +
   					case if_ret when '1' then 'F'  --�Ƿ����÷�Ӷ
   					                 else ' ' end,
   					cust_whole.open_oper_code,  --��������Ա        shiyl 20060316
   					cust_whole.close_oper_code,  --��������Ա       shiyl 20060316
   					--6.4.5.1 20070605 �������������֯�������롢��֯������ơ����������������������
   					isnull(cust_basic.organ_insti,''),
   					'',
   					isnull(cust_basic.coop_insti,''),
   					'',
					''
			from    cust_whole,cust_basic
			where	(cust_whole.cust_no = cust_basic.cust_no)
			and		(cust_whole.cust_no     = @mi_cust_no)
			AND     (cust_basic.cust_class like @mi_cust_class or @mi_cust_class = '')
			and     (cust_basic.cust_status = @mi_cust_status or @mi_cust_status= '')
			and		(cust_whole.open_oper_code = @mi_open_oper_code or @mi_open_oper_code = '')
			and     (@mi_flag = '1' or cust_basic.cust_status <> '7')
			and     (@mi_flag2 = '1' or cust_basic.cust_status <> '6')
			--6.4.5.2 20070614 �������������֯�������롢��������
			--20100707 6.8.2.1 ������֯����������������ѯ������
			and     (@organ_inner_id = '' or cust_basic.organ_inner_id = @organ_inner_id or cust_basic.organ_inner_id like @organ_inner_id + '|%')
			and     (@coop_inner_id = '' or cust_basic.coop_inner_id = @coop_inner_id or cust_basic.coop_inner_id like @coop_inner_id + '|%')
			and (@mi_cust_corp = '' or cust_basic.cust_corp = @mi_cust_corp) -- 6.4.5.2 20070919 ������������ͻ�����
			--order by cust_basic.cust_no,cust_basic.cert_type

			--6.6.5.1 ������֯��������ͳһ���ź���
		end
	end
	else --����Ա����
	begin
		--6.6.5.1 ȡ���ϼƲ���ȡinsert��@@rowcoun��ʽ
		--6.4.0.1 20061208 ��ֿͻ��żӿ��ѯ�ٶ�
		if @mi_cust_no = ''
		begin
		--6.4.5.1 20070605 �������������֯�������롢��֯������ơ����������������������
			insert  #cust
			select
 				cust_whole.cust_no,     --�ͻ���
 				cust_basic.cust_name,   --�ͻ�����
 				cust_whole.cust_full_name,  --�ͻ�ȫ��
 				cust_basic.cert_type,           --֤������
 				cust_basic.cert_no,     --֤������
 				cust_whole.zip,                 --�ʱ�
 				cust_whole.addr,                --��ַ
 				cust_whole.phone,       --�绰
 				cust_whole.mobile,      --�ֻ�
 				cust_whole.fax,                 --����
 				cust_whole.email,               --�����ʼ�
 				cust_whole.frdb,                --����
 				cust_whole.frdb_id,             --�������֤��
 				cust_whole.contract_no,     --��ͬ���
 				cust_basic.cust_class,      --�ͻ���
 				cust_basic.sharemoney,      --�����ʽ���
 				cust_whole.open_date,       --��������
 				cust_whole.close_date,      --��������
 				cust_basic.cust_corp,       --�ͻ�����
 				--cust_whole.low_interest,  --���Ȩ���׼
 				cust_whole.cmd_assign1,     --ָ���´���1
 				cust_whole.cmd_assign_id1,  --ָ���´������֤��1
 				cust_whole.cmd_assign2,     --ָ���´���2
 				cust_whole.cmd_assign_id2,  --ָ���´������֤��2
 				cust_whole.cmd_assign3,     --ָ���´���3
 				cust_whole.cmd_assign_id3,  --ָ���´������֤��3
 				cust_whole.fund_allot1,     --�ʽ������1
 				cust_whole.fund_allot_id1,  --�ʽ���������֤��1
 				cust_whole.fund_allot2,     --�ʽ������2
 				cust_whole.fund_allot_id2,   --�ʽ���������֤��2
 				cust_whole.note,            --��ע
 				cust_basic.cust_status,      --״̬ wlj 20040105 add
 				case if_hand when '1' then 'S'  --�Ƿ�����������
 				                 else ' ' end +
 				case if_margin when '1' then 'B' --�Ƿ����ñ�֤��
 				                 else ' ' end +
 				case if_code when '1' then 'J' --�Ƿ����ý��ױ���
 				                 else ' ' end +
 				case if_auth when '1' then 'Q' --�Ƿ�����Ȩ��
 				                 else ' ' end +
 				case if_prop when '1' then 'P' --�Ƿ���������
 				                 else ' ' end +
 				case if_ret when '1' then 'F'  --�Ƿ����÷�Ӷ
 				                 else ' ' end,
 				cust_whole.open_oper_code,  --��������Ա        shiyl 20060316
 				cust_whole.close_oper_code,  --��������Ա       shiyl 20060316
 				--6.4.5.1 20070605 �������������֯�������롢��֯������ơ����������������������
 				isnull(cust_basic.organ_insti,''),
 				'',
 				isnull(cust_basic.coop_insti,''),
 				'',
				''
			from    cust_whole, cust_basic, oper_all_cust
			where	(cust_whole.cust_no     = cust_basic.cust_no)
			and 	oper_all_cust.cust_no = cust_basic.cust_no
			and		(cust_basic.cust_class like @mi_cust_class or @mi_cust_class = '')
			AND     (cust_basic.cust_status = @mi_cust_status or @mi_cust_status= '')
			and		(cust_whole.open_oper_code = @mi_open_oper_code or @mi_open_oper_code = '')
			and     (@mi_flag = '1' or cust_basic.cust_status <> '7')
			and     (@mi_flag2 = '1' or cust_basic.cust_status <> '6')
			and     oper_all_cust.oper_code = @mi_oper_code
			--6.4.5.2 20070614 �������������֯�������롢��������
			--20100707 6.8.2.1 ������֯����������������ѯ������
			and     (@organ_inner_id = '' or cust_basic.organ_inner_id = @organ_inner_id or cust_basic.organ_inner_id like @organ_inner_id + '|%')
			and     (@coop_inner_id = '' or cust_basic.coop_inner_id = @coop_inner_id or cust_basic.coop_inner_id like @coop_inner_id + '|%')
			and (@mi_cust_corp = '' or cust_basic.cust_corp = @mi_cust_corp) -- 6.4.5.2 20070919 ������������ͻ�����
			--order by cust_basic.cust_no,cust_basic.cert_type

			--6.6.5.1 ������֯��������ͳһ���ź���
		end
		else --�ͻ��Ų�Ϊ��
		begin
			--6.4.5.1 20070605 �������������֯�������롢��֯������ơ����������������������
			insert  #cust
			select
				cust_whole.cust_no,     --�ͻ���
				cust_basic.cust_name,   --�ͻ�����
				cust_whole.cust_full_name,  --�ͻ�ȫ��
				cust_basic.cert_type,           --֤������
				cust_basic.cert_no,     --֤������
				cust_whole.zip,                 --�ʱ�
				cust_whole.addr,                --��ַ
				cust_whole.phone,       --�绰
				cust_whole.mobile,      --�ֻ�
				cust_whole.fax,                 --����
				cust_whole.email,               --�����ʼ�
				cust_whole.frdb,                --����
				cust_whole.frdb_id,             --�������֤��
				cust_whole.contract_no,     --��ͬ���
				cust_basic.cust_class,      --�ͻ���
				cust_basic.sharemoney,      --�����ʽ���
				cust_whole.open_date,       --��������
				cust_whole.close_date,      --��������
				cust_basic.cust_corp,       --�ͻ�����
				--cust_whole.low_interest,  --���Ȩ���׼
				cust_whole.cmd_assign1,     --ָ���´���1
				cust_whole.cmd_assign_id1,  --ָ���´������֤��1
				cust_whole.cmd_assign2,     --ָ���´���2
				cust_whole.cmd_assign_id2,  --ָ���´������֤��2
				cust_whole.cmd_assign3,     --ָ���´���3
				cust_whole.cmd_assign_id3,  --ָ���´������֤��3
				cust_whole.fund_allot1,     --�ʽ������1
				cust_whole.fund_allot_id1,  --�ʽ���������֤��1
				cust_whole.fund_allot2,     --�ʽ������2
				cust_whole.fund_allot_id2,   --�ʽ���������֤��2
				cust_whole.note,            --��ע
				cust_basic.cust_status,      --״̬ wlj 20040105 add
				case if_hand when '1' then 'S'  --�Ƿ�����������
				                 else ' ' end +
				case if_margin when '1' then 'B' --�Ƿ����ñ�֤��
				                 else ' ' end +
				case if_code when '1' then 'J' --�Ƿ����ý��ױ���
				                 else ' ' end +
				case if_auth when '1' then 'Q' --�Ƿ�����Ȩ��
				                 else ' ' end +
				case if_prop when '1' then 'P' --�Ƿ���������
				                 else ' ' end +
				case if_ret when '1' then 'F'  --�Ƿ����÷�Ӷ
				                 else ' ' end,
				cust_whole.open_oper_code,  --��������Ա        shiyl 20060316
				cust_whole.close_oper_code,  --��������Ա       shiyl 20060316
				--6.4.5.1 20070605 �������������֯�������롢��֯������ơ����������������������
				isnull(cust_basic.organ_insti,''),
				'',
				isnull(cust_basic.coop_insti,''),
				'',
				''
			from    cust_whole, cust_basic, oper_all_cust
			where   (cust_whole.cust_no     = cust_basic.cust_no)
			and		(cust_whole.cust_no     = @mi_cust_no)
			AND     (cust_basic.cust_class like @mi_cust_class or @mi_cust_class = '')
			AND     (cust_basic.cust_status = @mi_cust_status or @mi_cust_status= '')
			and		(cust_whole.open_oper_code = @mi_open_oper_code or @mi_open_oper_code = '')
			and     (@mi_flag = '1' or cust_basic.cust_status <> '7')
			and     (@mi_flag2 = '1' or cust_basic.cust_status <> '6')
			and     oper_all_cust.oper_code = @mi_oper_code
			and     oper_all_cust.cust_no = cust_basic.cust_no
			--6.4.5.2 20070614 �������������֯�������롢��������
			--20100707 6.8.2.1 ������֯����������������ѯ������
			and     (@organ_inner_id = '' or cust_basic.organ_inner_id = @organ_inner_id or cust_basic.organ_inner_id like @organ_inner_id + '|%')
			and     (@coop_inner_id = '' or cust_basic.coop_inner_id = @coop_inner_id or cust_basic.coop_inner_id like @coop_inner_id + '|%')
			and (@mi_cust_corp = '' or cust_basic.cust_corp = @mi_cust_corp) -- 6.4.5.2 20070919 ������������ͻ�����
			--order by cust_basic.cust_no,cust_basic.cert_type

			--6.6.5.1 ������֯��������ͳһ���ź���
		end
	end
	select @ocode = @@error, @rowcount_var = @@rowcount
	if (@ocode <> 0)
	begin
		select @omsg='�ͻ�����һ���ѯ����'
		goto l_fatal
	end
	if @rowcount_var = 0
	begin
			select @ocode=9999,@omsg='û�в�ѯ�����'
			select "fatal"=@ocode, @omsg
			return -999
	end


	--������֯��������
	update  #cust
	set     #cust.organ_name = isnull(organ_info.organ_name,'')
	from    #cust,organ_info
	where   organ_info.organ_no = #cust.organ_insti
	--���º�����������
	update  #cust
	set     #cust.coop_name = isnull(organ_info.organ_name,'')
	from    #cust,organ_info
	where   organ_info.organ_no = #cust.coop_insti

	--6.6.5.1 ����ϼ�
	declare @cust_sum_name varchar(80)
	select @cust_sum_name = ''
	if @mi_limit = '1' and @num <> 0
	begin
		select @cust_sum_name = '��ѯ������'
	end
	if @mi_cust_no = '' and @mi_cust_class = '' and @mi_sum_flag <> '0'
	begin
		select @cust_sum_name = @cust_sum_name + '���пͻ���'
		select
			'' as cust_no,
			'�ϼƣ�' cust_name,
			 @cust_sum_name as cust_full_name,
			'','','','','','','','','','',
			'',
			convert(varchar,count(*)) as cust_class,
			'','','','','','','','','','',
			'','','','','','','','','',
			--6.4.5.1 20070605 �������������֯�������롢��֯������ơ����������������������
			'','','','','',''
		from    #cust a ,#result b  --zlm 6.8.4.1 20120327
		where   a.cust_no = b.cust_no
		and     ( b.trading_no = @mi_trading_no  or  @mi_trading_no = '')	
	end
	if @mi_cust_class <> '' and @mi_sum_flag <> '0'
	begin
		select @cust_sum_name = @cust_sum_name + '�ÿͻ��๲�пͻ���'
		select
			'' as cust_no,
			'�ϼƣ�' cust_name,
			 @cust_sum_name as cust_full_name,
			'','','','','','','','','','',
			'',
			convert(varchar,count(*)) as cust_class,
			'','','','','','','','','','',
			'','','','','','','','','',
			--6.4.5.1 20070605 �������������֯�������롢��֯������ơ����������������������
			'','','','','',''
		from    #cust a ,#result b  --zlm 6.8.4.1 20120327
		where   a.cust_no = b.cust_no
		and     ( b.trading_no = @mi_trading_no  or  @mi_trading_no = '')	
	end

	create index i_index_2 on #cust(cust_no)

	select a.cust_no, b.broker_no
	into #broker_cust
	from  #cust a, broker_client b
	where a.cust_no = b.cust_no
	and (b.close_date <> '' or b.close_date is not null)

	create index i_index_0 on #broker_cust(cust_no)


	create table #cust_broker(
		cust_no	varchar(20)  not null,
		broker_no_str  	varchar(300)
	)


	declare @p_broker_str  varchar(200)
	declare @p_prev_cust	varchar(20)
	declare @c_cust_no  varchar(20)
	declare @c_broker_no  varchar(20)

	select @p_broker_str = ''
	select @p_prev_cust = ''

	declare cur_broker cursor for
	select cust_no, broker_no
	from   #broker_cust
	order by cust_no

	open cur_broker
	fetch cur_broker into @c_cust_no , @c_broker_no

	while @@sqlstatus = 0
	begin
		if @p_prev_cust = ''
		begin	--��һ�ν���
			select @p_prev_cust = @c_cust_no
			select @p_broker_str = @c_broker_no
		end
		else if @c_cust_no = @p_prev_cust
		begin	--��ǰһ�ͻ�����ͬ
			select @p_broker_str = @p_broker_str + ',' + @c_broker_no
		end
		else if @c_cust_no <> @p_prev_cust
		begin	--��ǰһ�ͻ��Ų�ͬ
			insert into #cust_broker(cust_no,broker_no_str)
			values( @p_prev_cust , @p_broker_str )

			select @p_prev_cust = @c_cust_no
			select @p_broker_str = @c_broker_no
		end

		fetch cur_broker into @c_cust_no , @c_broker_no
	end

	--�����һ���ͻ��ľ�������Ϣ���뵽����ȥ��
	if @p_prev_cust <> ''
	begin
		insert into #cust_broker(cust_no,broker_no_str)
		values( @p_prev_cust , @p_broker_str )
	end
	close cur_broker
	deallocate cursor cur_broker


	create index idx_cust_broker on #cust_broker(cust_no)

	update #cust
	set broker_no = #cust_broker.broker_no_str
	from  #cust_broker
	where #cust.cust_no = #cust_broker.cust_no

	select  a.cust_no ,       --�ͻ���
		a.cust_name,      --�ͻ�����
		cust_full_name,  --�ͻ�ȫ��
		cert_type,      --֤������
		cert_no,        --֤������
		zip,                    --�ʱ�
		addr,           --��ַ
		phone,          --�绰
		mobile,         --�ֻ�
		fax,                    --����
		email,                  --�����ʼ�
		frdb,                   --����
		frdb_id,                --�������֤��
		contract_no,     --��ͬ���
		a.cust_class,      --�ͻ���
		sharemoney,      --�����ʽ���
		open_date,       --��������
		close_date,      --��������
		cust_corp,       --�ͻ�����
		cmd_assign1,     --ָ���´���1
		cmd_assign_id1,  --ָ���´������֤��1
		cmd_assign2,     --ָ���´���2
		cmd_assign_id2,  --ָ���´������֤��2
		cmd_assign3,     --ָ���´���3
		cmd_assign_id3,  --ָ���´������֤��3
		fund_allot1,     --�ʽ������1
		fund_allot_id1,  --�ʽ���������֤��1
		fund_allot2,     --�ʽ������2
		fund_allot_id2,   --�ʽ���������֤��2
		note,            --��ע
		a.cust_status,      --״̬
		set_status,     --�������
		open_oper_code,  --��������Ա
		close_oper_code,  --��������Ա
		organ_insti,    --��֯����
		organ_name,     --��֯��������
		coop_insti,     --��������
		coop_name,		--������������
		broker_no,   --�����˴���
		b.trading_no  --��������
	from    #cust a ,#result b  --zlm 6.8.4.1 20120327
	where   a.cust_no = b.cust_no
	and     ( b.trading_no = @mi_trading_no  or  @mi_trading_no = '')
	order by cust_no,cert_type

	--szy 20080523 ���ǽ�rowcount�����ָ�
	set rowcount 0

        --20080516 szy ���ӽ���ʱ����������ѯ����
	--�����¼��־
	if @mi_limit = '1' and @log_flag = '1'
	begin
		--����Ӧ��no�ֶθ�Ϊ0
		update	oper_log
		set	no = 0
		where	oper_date = @cur_date
		and	jour_no = @lsh_out
		and	no = 9999
	end

        return 0
l_fatal:
	--20080516 szy ���ӽ���ʱ����������ѯ����
	--�����¼��־
	if @mi_limit = '1' and @log_flag = '1'
	begin
		--����Ӧ��no�ֶθ�Ϊ8888
		update	oper_log
		set	no = 8888
		where	oper_date = @cur_date
		and	jour_no = @lsh_out
		and	no = 9999
	end

        select "fatal"=@ocode, @omsg
        return -1
end

go
declare @update_flag char
exec	sp_upgrade_control
	'6.8.6.1',			--�汾��
	'2',				--������־
	'p859999',			--sp���ܺ�
	@update_flag output		--�޸ı�־
if @update_flag <> '0'
	print '���ִ���create proc p859999.sqlʧ�ܣ�'
else
	print 'create proc p859999.sql '
go

