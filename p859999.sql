/*#$&B#----脚本转换器 For SyBase        03-12-04*/
/* --------------------------------------------------------------
 * 程序名称：p859999.sql
 * 版本信息：6.8.4.x
 * 程序功能：客户资料一般查询'
 * ==============================================================

输入参数：
          操作员       scust_no
          客户号       sholder_ac_no
          客户类       sserial1
          客户状态      sstatus1
          是否包含销户客户 sstatus2
          是否包含冻结客户 sstatus3

输出参数：
          客户号       sholder_ac_no
          客户名称      sname
          客户全称      sall_name
          证件类型      scust_type2
          证件号码      scert_no
          邮编        spost_code
          地址        saddr
          电话        sphone
          手机        sphone3
          传真        sphone2
          电子邮件      semail
          法人        scust_auth2
          法人身份证号  scust_limit2
          合同编号      sbankname2
          客户类       sserial1
          类内资金共享    sstatus2
          开户日期      sdate0
          开户操作员    scust_no
          销户日期      sdate1
          销户操作员    scust_no2
          客户性质      sstatus1
          指令下达人1    scust_auth
          指令下达人身份证号1 scust_limit
          指令下达人2    spager
          指令下达人身份证号2 scard0
          指令下达人3    sstation1
          指令下达人身份证号3 scard1
          资金调拨人1    scert_no2
          资金调拨人身份证号1 sbank_acc
          资金调拨人2    scert_addr
          资金调拨人2    scert_addr
          资金调拨人身份证号2 sbank_acc2
          备注      snote
          客户状态       sstatus3
          设置情况      semp_no

处理逻辑：

注意点：


 * ==============================================================
 * 创建日期:    20030811
 * 编码者:      SP自动生成器
 * --------------------------------------------------------------
 * 修改日期：   20031206
 * 修改人员：   wlj
 * 修改描述：   没有客户最低权益标准，sstation0用于网卡地址
 * 备注信息：   6.0.0.2
 * --------------------------------------------------------------
 * 修改日期：   20040115
 * 修改人员：   wlj
 * 修改描述：   增加输入参数，是否包含销户客户
 * 备注信息：   6.0.0.3
 * --------------------------------------------------------------
 * 修改日期：   20040116
 * 修改人员：   wlj
 * 修改描述：   增加输入参数，是否包含冻结客户
 * 备注信息：   6.0.0.4
 * --------------------------------------------------------------
 * 修改日期：   2004220
 * 修改人员：   zyw
 * 修改描述：   增加输出参数:备注
 * 备注信息：   6.0.0.5
 * --------------------------------------------------------------
 * 修改日期：   20040304
 * 修改人员：   wangliang
 * 修改描述：   增加操作员对客户的访问限制
 * 备注信息：   6.0.0.6
 * --------------------------------------------------------------
 * 修改日期：   20060206
 * 修改人员：   施延黎
 * 修改描述：   增加法人身份证号输出参数
 * 备注信息：   6.0.4.1
 * --------------------------------------------------------------
 * 修改日期：   20060316
 * 修改人员：   施延黎
 * 修改描述：   增加输出参数开户操作员、销户操作员
 * 备注信息：   6.0.4.2
 * --------------------------------------------------------------
 * 修改日期：   20060413
 * 修改人员：   jk
 * 修改描述：   增加各种类的客户数量统计
 * 备注信息：   6.0.4.3
 * --------------------------------------------------------------
 * 修改日期：   20061208
 * 修改人员：   施延黎
 * 修改描述：   拆分客户号加快查询速度
 * 备注信息：   6.4.0.1
 * --------------------------------------------------------------
 * 修改日期：   20070605
 * 修改人员：   施延黎
 * 修改描述：   增加输出参数组织机构代码、组织机构简称、合作机构、合作机构简称
 * 备注信息：   6.4.5.1
 * --------------------------------------------------------------
 * 修改日期：   20070614
 * 修改人员：   施延黎
 * 修改描述：   增加输入参数组织机构代码、合作机构
 * 备注信息：   6.4.5.2
 * --------------------------------------------------------------
 * 修改日期：   20070919
 * 修改人员：   张建飞
 * 修改描述：   查询输出结果中增加经纪人代码
 * 备注信息：   6.4.5.2
 * --------------------------------------------------------------
 * 修改日期：   20070919
 * 修改人员：   张建飞
 * 修改描述：   增加输入参数客户性质
 * 备注信息：   6.4.5.2
 * --------------------------------------------------------------
 * 修改日期：   20080219
 * 修改人员：   张跃武
 * 修改描述：   增加输入参数：生成合计
 * 备注信息     6.5.0.1
 * --------------------------------------------------------------
 * 修改日期：   20080421
 * 修改人员：   zlm
 * 修改描述：   将合同编号变为20位
 * 备注信息     6.6.0.1
 * --------------------------------------------------------------
 * 修改日期：   20080422
 * 修改人员：   zlm
 * 修改描述：   营业执照的法人证件变为20位
 * 备注信息     6.6.0.2
 * --------------------------------------------------------------
 * 修改日期：   20080516
 * 修改人员：   szy
 * 修改描述：   增加交易时大数据量查询限制
 * 备注信息     6.6.0.3
 * --------------------------------------------------------------
 * 修改日期：   20080516
 * 修改人员：   szy
 * 修改描述：   解决不能输出合计的问题
 * 备注信息     6.6.0.4
 * --------------------------------------------------------------
 * 修改日期：   20080710
 * 修改人员：   zlm
 * 修改描述：  无查询结果时报错不对,经纪人代码合计中出现乱码
 * 备注信息     6.6.0.5
 * --------------------------------------------------------------
 * 修改日期：	20081121
 * 修改人员：	jk
 * 修改描述：	在循环更新客户经济人信息处有问题，即使只查一个客户，也会对所有客户、经济人作循环，严重影响速度。改写代码
 * 备注信息：	6.6.5.1
 * --------------------------------------------------------------
 * 修改日期：	20081224
 * 修改人员：	ykl&zyw&jq
 * 修改描述：   加入打印语句，定位耗时长的地点。与张跃武讨论后把取经纪人的循环进行了改写。
 		和蒋琦进行了测试。
		生成经纪人的代码逻辑有些不好懂，用了类似过程性的语言的逻辑，因此和蒋琦、跃武进行了仔细的代码走查。

 * 备注信息：	6.6.5.2
 * --------------------------------------------------------------
 * 修改日期：	20100707
 * 修改人员：	jk
 * 修改描述：	修正组织机构、合作机构查询的问题
 * 备注信息：	6.8.2.1
 * --------------------------------------------------------------
 * 修改日期：	20120327
 * 修改人员：	zlm
 * 修改描述：	输入输出中增加交易中心
 * 备注信息：	6.8.4.1
 * --------------------------------------------------------------
 * 修改日期：	20120717
 * 修改人员：	zlm
 * 修改描述：	交易中心代码长度扩展为10位
 * 备注信息：	6.8.4.2
 * --------------------------------------------------------------
 * 修改日期：	20130527
 * 修改人员：	lt
 * 修改描述：	查询输入参数不能全部为空提示去除"交易时"
 * 备注信息：	6.8.6.1
 * --------------------------------------------------------------
 * 修改日期：	20151229
 * 修改人员：	chp
 * 修改描述：	根据851002改写，增加开户操作员入参
 * 备注信息：	6.8.6.1
 * --------------------------------------------------------------

测试脚本
exec p859999
   '123',  --操作员
   '000002',  --客户号
   '',  --客户类
   '',  --客户状态
   '',  --开户操作员
   '1', --是否包含销户客户，0不包含，1包含（缺省）
   '1',  --是否包含冻结客户，0不包含，1包含（缺省）
   '',
   '',
   ''
-------------------------------------------------------------- */
if exists(select * from sysobjects where id=object_id('p859999') and  (type='P') )
        drop proc p859999
go

exec	sp_upgrade_control
	'6.8.6.1',			--版本号
	'1',				--操作标志
	'p859999',			--sp功能号
	''				--修改标志
go

create  procedure p859999
        @mi_oper_code    varchar(10),    --操作员
        @mi_cust_no      varchar(15),    --客户号
        @mi_cust_class   varchar(12),    --客户类
        @mi_cust_status  char,             --客户状态
		@mi_open_oper_code varchar(10),    --开户操作员
        @mi_flag         char = '1' ,      --是否包含销户客户，0不包含，1包含（缺省）
        @mi_flag2          char = '1',       --是否包含冻结客户，0不包含，1包含（缺省）
        --6.4.5.2 20070614 增加输入参数组织机构代码、合作机构
        @mi_organ_no    varchar(20) = '',
        @mi_coop_no     varchar(20) = '',
        @mi_cust_corp char(1) = '',
        @mi_sum_flag char(1) = '1',  --生成合计：'1'生成'0'不生成
	--20080516 szy 增加交易时大数据量查询限制
        @mi_limit char(1) = '0'	,	--限制查询，1-限制查询，0-不限制
        @mi_trading_no   varchar(10) = ''    --交易中心 6.8.4.2 zlm 20120717
as
begin
        declare @ocode int, @omsg varchar(80),@rowcount_var int,@ret int
	--20080516 szy 增加交易时大数据量查询限制
	declare @log_flag char(1),	--是否记录日志
		@num int,		--返回记录条数
		@all_null char(1)	--是否允许全空

	--20080516 szy 增加交易时大数据量查询限制
	--限制查询
	if @mi_limit = '1'
	begin
		exec  CheckQryTime
			@mi_oper_code,    	--操作员
			859999,    		--功能编号
			'',    		--开始日期
			'',    			--结束日期
			@mi_cust_no,    	--客户号
			@mi_cust_class,  	--客户类
			@log_flag output,	--是否记录日志(输出)  0: 不记1：记日志
			@ocode output,	--返回代码(输出)	0：允许查询  非0：不允许
			@omsg output,		--返回信息(输出)
			@num output, 	--如果mo_code返回是0，则为返回记录条数，如果为0，为不限制输出条数
			@all_null output	--是否允许全部为空，1允许，0不允许

		--如果不允许查询
		if @ocode <> 0
		begin
	                goto l_fatal
		end

		--是否允许为空
		if @all_null = '0'
		begin
			if @mi_cust_no = '' and @mi_cust_class = '' and @mi_cust_status  = '' and @mi_organ_no = ''
	        		and @mi_coop_no = '' and @mi_cust_corp = '' and @mi_trading_no = ''
	        	begin
	        		select @ocode = 51002001,@omsg = '查询输入参数不能全部为空'  --6.8.6.1
	        		goto l_fatal
	        	end
		end

		--如果记录日志
		if @log_flag = '1'
		begin
			 --开始日志
			declare @desc varchar(800),@dates_out char(8),@lsh_out int,@err int
			declare @cur_date char(8)
			select @cur_date = convert (char(8), getdate(), 112)
			--记录日志
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

			--功能编号,操作员,描述,顺序,日期(输出),流水号(输出),错误编号(输出)，成功标志
			exec p850009 859999,@mi_oper_code,@mi_cust_no,9999,@desc,@dates_out output,@lsh_out output,@err output,'1'
			--结束日志
		end
	end
	
	create table #result(
		trading_no	varchar(10) null,	--交易中心代码 
		trading_name	varchar(40) null,	--交易中心名称
		cust_no		varchar(16) null,
		cust_name	varchar(8)  null,
		cust_class	char(10)    null,
		cust_status	char(1)	    null
	)
	
	
	exec   @ret=	tykh_query_trading_no  	@mi_oper_code    ,    --操作员    
        					@mi_trading_no   ,    --交易中心代码 
        					@mi_cust_no      ,    --客户号      
        					@mi_cust_class       --客户类 
	if @ret <>0
	begin
		goto l_fatal
	end
	
	--6.4.5.1 20070605 增加输出参数组织机构代码、组织机构简称、合作机构、合作机构简称
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
		cust_no varchar(16) null,       --客户号
		cust_name varchar(8) null,      --客户名称
		cust_full_name  varchar(80) null,  --客户全称
		cert_type  char(1) null,        --证件类型
		cert_no  varchar(18) null,      --证件号码
		zip  char(6) null,              --邮编
		addr varchar(80) null,                  --地址
		phone varchar(40) null,         --电话
		mobile  varchar(40) null,       --手机
		fax     varchar(40) null,               --传真
		email   varchar(60) null,               --电子邮件
		frdb    varchar(20) null,               --法人
		frdb_id varchar(20) null,               --法人身份证号 zlm 20080422 6.6.0.2
		contract_no     varchar(20) null,     --合同编号    zlm 20080421 6.6.0.1
		cust_class      char(10) null,      --客户类
		sharemoney      char(1) null,      --类内资金共享
		open_date       char(8) null,       --开户日期
		close_date      char(8) null,      --销户日期
		cust_corp       char(1) null,       --客户性质
		cmd_assign1     varchar(20) null,     --指令下达人1
		cmd_assign_id1  varchar(18) null,  --指令下达人身份证号1
		cmd_assign2     varchar(20) null,     --指令下达人2
		cmd_assign_id2  varchar(18) null,  --指令下达人身份证号2
		cmd_assign3     varchar(20) null,     --指令下达人3
		cmd_assign_id3  varchar(18) null,  --指令下达人身份证号3
		fund_allot1     varchar(20) null,     --资金调拨人1
		fund_allot_id1  varchar(18) null,  --资金调拨人身份证号1
		fund_allot2     varchar(20) null,     --资金调拨人2
		fund_allot_id2  varchar(18) null,   --资金调拨人身份证号2
		note    varchar(80) null,            --备注
		cust_status     char(1) null,      --状态
		set_status      varchar(8) null,        --设置情况
		open_oper_code  varchar(10) null,  --开户操作员
		close_oper_code varchar(10) null,  --销户操作员
		organ_insti     varchar(20) null,       --组织机构
		organ_name      varchar(20) null,       --组织机构简称
		coop_insti      varchar(20) null,       --合作机构
		coop_name       varchar(20) null,       --合作机构简称
		broker_no varchar(255) null --经纪人代码 --zjf 20070919 输出增加经纪人代码
	)

	declare @if_access char
	select @if_access = if_access from operator where oper_code = @mi_oper_code

	--20080516 szy 增加交易时大数据量查询限制
	--限制查询
	--输出限制
	if @mi_limit = '1' and @num <> 0
	begin
		select @num  = @num - 1
		set rowcount @num
	end

	if @if_access = '0'     -- 不受限
	begin
		--6.6.5.1 取消合计采用取insert的@@rowcoun方式

		--6.4.0.1 20061208 拆分客户号加快查询速度
		if @mi_cust_no = ''
		begin
			--6.4.5.1 20070605 增加输出参数组织机构代码、组织机构简称、合作机构、合作机构简称
			insert  #cust
			select
					cust_whole.cust_no,     --客户号
					cust_basic.cust_name,   --客户名称
					cust_whole.cust_full_name,  --客户全称
					cust_basic.cert_type,           --证件类型
					cust_basic.cert_no,     --证件号码
					cust_whole.zip,                 --邮编
					cust_whole.addr,                --地址
					cust_whole.phone,       --电话
					cust_whole.mobile,      --手机
					cust_whole.fax,                 --传真
					cust_whole.email,               --电子邮件
					cust_whole.frdb,                --法人
					cust_whole.frdb_id,             --法人身份证号
					cust_whole.contract_no,     --合同编号
					cust_basic.cust_class,      --客户类
					cust_basic.sharemoney,      --类内资金共享
					cust_whole.open_date,       --开户日期
					cust_whole.close_date,      --销户日期
					cust_basic.cust_corp,       --客户性质
					--cust_whole.low_interest,  --最低权益标准
					cust_whole.cmd_assign1,     --指令下达人1
					cust_whole.cmd_assign_id1,  --指令下达人身份证号1
					cust_whole.cmd_assign2,     --指令下达人2
					cust_whole.cmd_assign_id2,  --指令下达人身份证号2
					cust_whole.cmd_assign3,     --指令下达人3
					cust_whole.cmd_assign_id3,  --指令下达人身份证号3
					cust_whole.fund_allot1,     --资金调拨人1
					cust_whole.fund_allot_id1,  --资金调拨人身份证号1
					cust_whole.fund_allot2,     --资金调拨人2
					cust_whole.fund_allot_id2,   --资金调拨人身份证号2
					cust_whole.note,            --备注
					cust_basic.cust_status,      --状态 wlj 20040105 add
					case if_hand when '1' then 'S'  --是否设置手续费
					                 else ' ' end +
					case if_margin when '1' then 'B' --是否设置保证金
					                 else ' ' end +
					case if_code when '1' then 'J' --是否设置交易编码
					                 else ' ' end +
					case if_auth when '1' then 'Q' --是否设置权限
					                 else ' ' end +
					case if_prop when '1' then 'P' --是否设置属性
					                 else ' ' end +
					case if_ret when '1' then 'F'  --是否设置返佣
					                 else ' ' end,
					cust_whole.open_oper_code,  --开户操作员        shiyl 20060316
					cust_whole.close_oper_code,  --销户操作员       shiyl 20060316
					--6.4.5.1 20070605 增加输出参数组织机构代码、组织机构简称、合作机构、合作机构简称
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
			--6.4.5.2 20070614 增加输入参数组织机构代码、合作机构
			--20100707 6.8.2.1 修正组织机构、合作机构查询的问题
			and     (@organ_inner_id = '' or cust_basic.organ_inner_id = @organ_inner_id or cust_basic.organ_inner_id like @organ_inner_id + '|%')
			and     (@coop_inner_id = '' or cust_basic.coop_inner_id = @coop_inner_id or cust_basic.coop_inner_id like @coop_inner_id + '|%')
			and (@mi_cust_corp = '' or cust_basic.cust_corp = @mi_cust_corp) -- 6.4.5.2 20070919 增加输入参数客户性质
			--order by cust_basic.cust_no,cust_basic.cert_type

			--6.6.5.1 更新组织机构名称统一放着后面
		end
		else --客户号不为空
        begin
			--6.4.5.1 20070605 增加输出参数组织机构代码、组织机构简称、合作机构、合作机构简称
			insert  #cust
			select
   					cust_whole.cust_no,     --客户号
   					cust_basic.cust_name,   --客户名称
   					cust_whole.cust_full_name,  --客户全称
   					cust_basic.cert_type,           --证件类型
   					cust_basic.cert_no,     --证件号码
   					cust_whole.zip,                 --邮编
   					cust_whole.addr,                --地址
   					cust_whole.phone,       --电话
   					cust_whole.mobile,      --手机
   					cust_whole.fax,                 --传真
   					cust_whole.email,               --电子邮件
   					cust_whole.frdb,                --法人
   					cust_whole.frdb_id,             --法人身份证号
   					cust_whole.contract_no,     --合同编号
   					cust_basic.cust_class,      --客户类
   					cust_basic.sharemoney,      --类内资金共享
   					cust_whole.open_date,       --开户日期
   					cust_whole.close_date,      --销户日期
   					cust_basic.cust_corp,       --客户性质
   					--cust_whole.low_interest,  --最低权益标准
   					cust_whole.cmd_assign1,     --指令下达人1
   					cust_whole.cmd_assign_id1,  --指令下达人身份证号1
   					cust_whole.cmd_assign2,     --指令下达人2
   					cust_whole.cmd_assign_id2,  --指令下达人身份证号2
   					cust_whole.cmd_assign3,     --指令下达人3
   					cust_whole.cmd_assign_id3,  --指令下达人身份证号3
   					cust_whole.fund_allot1,     --资金调拨人1
   					cust_whole.fund_allot_id1,  --资金调拨人身份证号1
   					cust_whole.fund_allot2,     --资金调拨人2
   					cust_whole.fund_allot_id2,   --资金调拨人身份证号2
   					cust_whole.note,            --备注
   					cust_basic.cust_status,      --状态 wlj 20040105 add
   					case if_hand when '1' then 'S'  --是否设置手续费
   					                 else ' ' end +
   					case if_margin when '1' then 'B' --是否设置保证金
   					                 else ' ' end +
   					case if_code when '1' then 'J' --是否设置交易编码
   					                 else ' ' end +
   					case if_auth when '1' then 'Q' --是否设置权限
   					                 else ' ' end +
   					case if_prop when '1' then 'P' --是否设置属性
   					                 else ' ' end +
   					case if_ret when '1' then 'F'  --是否设置返佣
   					                 else ' ' end,
   					cust_whole.open_oper_code,  --开户操作员        shiyl 20060316
   					cust_whole.close_oper_code,  --销户操作员       shiyl 20060316
   					--6.4.5.1 20070605 增加输出参数组织机构代码、组织机构简称、合作机构、合作机构简称
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
			--6.4.5.2 20070614 增加输入参数组织机构代码、合作机构
			--20100707 6.8.2.1 修正组织机构、合作机构查询的问题
			and     (@organ_inner_id = '' or cust_basic.organ_inner_id = @organ_inner_id or cust_basic.organ_inner_id like @organ_inner_id + '|%')
			and     (@coop_inner_id = '' or cust_basic.coop_inner_id = @coop_inner_id or cust_basic.coop_inner_id like @coop_inner_id + '|%')
			and (@mi_cust_corp = '' or cust_basic.cust_corp = @mi_cust_corp) -- 6.4.5.2 20070919 增加输入参数客户性质
			--order by cust_basic.cust_no,cust_basic.cert_type

			--6.6.5.1 更新组织机构名称统一放着后面
		end
	end
	else --操作员受限
	begin
		--6.6.5.1 取消合计采用取insert的@@rowcoun方式
		--6.4.0.1 20061208 拆分客户号加快查询速度
		if @mi_cust_no = ''
		begin
		--6.4.5.1 20070605 增加输出参数组织机构代码、组织机构简称、合作机构、合作机构简称
			insert  #cust
			select
 				cust_whole.cust_no,     --客户号
 				cust_basic.cust_name,   --客户名称
 				cust_whole.cust_full_name,  --客户全称
 				cust_basic.cert_type,           --证件类型
 				cust_basic.cert_no,     --证件号码
 				cust_whole.zip,                 --邮编
 				cust_whole.addr,                --地址
 				cust_whole.phone,       --电话
 				cust_whole.mobile,      --手机
 				cust_whole.fax,                 --传真
 				cust_whole.email,               --电子邮件
 				cust_whole.frdb,                --法人
 				cust_whole.frdb_id,             --法人身份证号
 				cust_whole.contract_no,     --合同编号
 				cust_basic.cust_class,      --客户类
 				cust_basic.sharemoney,      --类内资金共享
 				cust_whole.open_date,       --开户日期
 				cust_whole.close_date,      --销户日期
 				cust_basic.cust_corp,       --客户性质
 				--cust_whole.low_interest,  --最低权益标准
 				cust_whole.cmd_assign1,     --指令下达人1
 				cust_whole.cmd_assign_id1,  --指令下达人身份证号1
 				cust_whole.cmd_assign2,     --指令下达人2
 				cust_whole.cmd_assign_id2,  --指令下达人身份证号2
 				cust_whole.cmd_assign3,     --指令下达人3
 				cust_whole.cmd_assign_id3,  --指令下达人身份证号3
 				cust_whole.fund_allot1,     --资金调拨人1
 				cust_whole.fund_allot_id1,  --资金调拨人身份证号1
 				cust_whole.fund_allot2,     --资金调拨人2
 				cust_whole.fund_allot_id2,   --资金调拨人身份证号2
 				cust_whole.note,            --备注
 				cust_basic.cust_status,      --状态 wlj 20040105 add
 				case if_hand when '1' then 'S'  --是否设置手续费
 				                 else ' ' end +
 				case if_margin when '1' then 'B' --是否设置保证金
 				                 else ' ' end +
 				case if_code when '1' then 'J' --是否设置交易编码
 				                 else ' ' end +
 				case if_auth when '1' then 'Q' --是否设置权限
 				                 else ' ' end +
 				case if_prop when '1' then 'P' --是否设置属性
 				                 else ' ' end +
 				case if_ret when '1' then 'F'  --是否设置返佣
 				                 else ' ' end,
 				cust_whole.open_oper_code,  --开户操作员        shiyl 20060316
 				cust_whole.close_oper_code,  --销户操作员       shiyl 20060316
 				--6.4.5.1 20070605 增加输出参数组织机构代码、组织机构简称、合作机构、合作机构简称
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
			--6.4.5.2 20070614 增加输入参数组织机构代码、合作机构
			--20100707 6.8.2.1 修正组织机构、合作机构查询的问题
			and     (@organ_inner_id = '' or cust_basic.organ_inner_id = @organ_inner_id or cust_basic.organ_inner_id like @organ_inner_id + '|%')
			and     (@coop_inner_id = '' or cust_basic.coop_inner_id = @coop_inner_id or cust_basic.coop_inner_id like @coop_inner_id + '|%')
			and (@mi_cust_corp = '' or cust_basic.cust_corp = @mi_cust_corp) -- 6.4.5.2 20070919 增加输入参数客户性质
			--order by cust_basic.cust_no,cust_basic.cert_type

			--6.6.5.1 更新组织机构名称统一放着后面
		end
		else --客户号不为空
		begin
			--6.4.5.1 20070605 增加输出参数组织机构代码、组织机构简称、合作机构、合作机构简称
			insert  #cust
			select
				cust_whole.cust_no,     --客户号
				cust_basic.cust_name,   --客户名称
				cust_whole.cust_full_name,  --客户全称
				cust_basic.cert_type,           --证件类型
				cust_basic.cert_no,     --证件号码
				cust_whole.zip,                 --邮编
				cust_whole.addr,                --地址
				cust_whole.phone,       --电话
				cust_whole.mobile,      --手机
				cust_whole.fax,                 --传真
				cust_whole.email,               --电子邮件
				cust_whole.frdb,                --法人
				cust_whole.frdb_id,             --法人身份证号
				cust_whole.contract_no,     --合同编号
				cust_basic.cust_class,      --客户类
				cust_basic.sharemoney,      --类内资金共享
				cust_whole.open_date,       --开户日期
				cust_whole.close_date,      --销户日期
				cust_basic.cust_corp,       --客户性质
				--cust_whole.low_interest,  --最低权益标准
				cust_whole.cmd_assign1,     --指令下达人1
				cust_whole.cmd_assign_id1,  --指令下达人身份证号1
				cust_whole.cmd_assign2,     --指令下达人2
				cust_whole.cmd_assign_id2,  --指令下达人身份证号2
				cust_whole.cmd_assign3,     --指令下达人3
				cust_whole.cmd_assign_id3,  --指令下达人身份证号3
				cust_whole.fund_allot1,     --资金调拨人1
				cust_whole.fund_allot_id1,  --资金调拨人身份证号1
				cust_whole.fund_allot2,     --资金调拨人2
				cust_whole.fund_allot_id2,   --资金调拨人身份证号2
				cust_whole.note,            --备注
				cust_basic.cust_status,      --状态 wlj 20040105 add
				case if_hand when '1' then 'S'  --是否设置手续费
				                 else ' ' end +
				case if_margin when '1' then 'B' --是否设置保证金
				                 else ' ' end +
				case if_code when '1' then 'J' --是否设置交易编码
				                 else ' ' end +
				case if_auth when '1' then 'Q' --是否设置权限
				                 else ' ' end +
				case if_prop when '1' then 'P' --是否设置属性
				                 else ' ' end +
				case if_ret when '1' then 'F'  --是否设置返佣
				                 else ' ' end,
				cust_whole.open_oper_code,  --开户操作员        shiyl 20060316
				cust_whole.close_oper_code,  --销户操作员       shiyl 20060316
				--6.4.5.1 20070605 增加输出参数组织机构代码、组织机构简称、合作机构、合作机构简称
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
			--6.4.5.2 20070614 增加输入参数组织机构代码、合作机构
			--20100707 6.8.2.1 修正组织机构、合作机构查询的问题
			and     (@organ_inner_id = '' or cust_basic.organ_inner_id = @organ_inner_id or cust_basic.organ_inner_id like @organ_inner_id + '|%')
			and     (@coop_inner_id = '' or cust_basic.coop_inner_id = @coop_inner_id or cust_basic.coop_inner_id like @coop_inner_id + '|%')
			and (@mi_cust_corp = '' or cust_basic.cust_corp = @mi_cust_corp) -- 6.4.5.2 20070919 增加输入参数客户性质
			--order by cust_basic.cust_no,cust_basic.cert_type

			--6.6.5.1 更新组织机构名称统一放着后面
		end
	end
	select @ocode = @@error, @rowcount_var = @@rowcount
	if (@ocode <> 0)
	begin
		select @omsg='客户资料一般查询出错！'
		goto l_fatal
	end
	if @rowcount_var = 0
	begin
			select @ocode=9999,@omsg='没有查询结果！'
			select "fatal"=@ocode, @omsg
			return -999
	end


	--更新组织机构名称
	update  #cust
	set     #cust.organ_name = isnull(organ_info.organ_name,'')
	from    #cust,organ_info
	where   organ_info.organ_no = #cust.organ_insti
	--更新合作机构名称
	update  #cust
	set     #cust.coop_name = isnull(organ_info.organ_name,'')
	from    #cust,organ_info
	where   organ_info.organ_no = #cust.coop_insti

	--6.6.5.1 插入合计
	declare @cust_sum_name varchar(80)
	select @cust_sum_name = ''
	if @mi_limit = '1' and @num <> 0
	begin
		select @cust_sum_name = '查询限制下'
	end
	if @mi_cust_no = '' and @mi_cust_class = '' and @mi_sum_flag <> '0'
	begin
		select @cust_sum_name = @cust_sum_name + '共有客户：'
		select
			'' as cust_no,
			'合计：' cust_name,
			 @cust_sum_name as cust_full_name,
			'','','','','','','','','','',
			'',
			convert(varchar,count(*)) as cust_class,
			'','','','','','','','','','',
			'','','','','','','','','',
			--6.4.5.1 20070605 增加输出参数组织机构代码、组织机构简称、合作机构、合作机构简称
			'','','','','',''
		from    #cust a ,#result b  --zlm 6.8.4.1 20120327
		where   a.cust_no = b.cust_no
		and     ( b.trading_no = @mi_trading_no  or  @mi_trading_no = '')	
	end
	if @mi_cust_class <> '' and @mi_sum_flag <> '0'
	begin
		select @cust_sum_name = @cust_sum_name + '该客户类共有客户：'
		select
			'' as cust_no,
			'合计：' cust_name,
			 @cust_sum_name as cust_full_name,
			'','','','','','','','','','',
			'',
			convert(varchar,count(*)) as cust_class,
			'','','','','','','','','','',
			'','','','','','','','','',
			--6.4.5.1 20070605 增加输出参数组织机构代码、组织机构简称、合作机构、合作机构简称
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
		begin	--第一次进入
			select @p_prev_cust = @c_cust_no
			select @p_broker_str = @c_broker_no
		end
		else if @c_cust_no = @p_prev_cust
		begin	--和前一客户号相同
			select @p_broker_str = @p_broker_str + ',' + @c_broker_no
		end
		else if @c_cust_no <> @p_prev_cust
		begin	--和前一客户号不同
			insert into #cust_broker(cust_no,broker_no_str)
			values( @p_prev_cust , @p_broker_str )

			select @p_prev_cust = @c_cust_no
			select @p_broker_str = @c_broker_no
		end

		fetch cur_broker into @c_cust_no , @c_broker_no
	end

	--把最后一个客户的经纪人信息插入到表中去。
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

	select  a.cust_no ,       --客户号
		a.cust_name,      --客户名称
		cust_full_name,  --客户全称
		cert_type,      --证件类型
		cert_no,        --证件号码
		zip,                    --邮编
		addr,           --地址
		phone,          --电话
		mobile,         --手机
		fax,                    --传真
		email,                  --电子邮件
		frdb,                   --法人
		frdb_id,                --法人身份证号
		contract_no,     --合同编号
		a.cust_class,      --客户类
		sharemoney,      --类内资金共享
		open_date,       --开户日期
		close_date,      --销户日期
		cust_corp,       --客户性质
		cmd_assign1,     --指令下达人1
		cmd_assign_id1,  --指令下达人身份证号1
		cmd_assign2,     --指令下达人2
		cmd_assign_id2,  --指令下达人身份证号2
		cmd_assign3,     --指令下达人3
		cmd_assign_id3,  --指令下达人身份证号3
		fund_allot1,     --资金调拨人1
		fund_allot_id1,  --资金调拨人身份证号1
		fund_allot2,     --资金调拨人2
		fund_allot_id2,   --资金调拨人身份证号2
		note,            --备注
		a.cust_status,      --状态
		set_status,     --设置情况
		open_oper_code,  --开户操作员
		close_oper_code,  --销户操作员
		organ_insti,    --组织机构
		organ_name,     --组织机构名称
		coop_insti,     --合作机构
		coop_name,		--合作机构名称
		broker_no,   --经纪人代码
		b.trading_no  --交易中心
	from    #cust a ,#result b  --zlm 6.8.4.1 20120327
	where   a.cust_no = b.cust_no
	and     ( b.trading_no = @mi_trading_no  or  @mi_trading_no = '')
	order by cust_no,cert_type

	--szy 20080523 总是将rowcount参数恢复
	set rowcount 0

        --20080516 szy 增加交易时大数据量查询限制
	--如果记录日志
	if @mi_limit = '1' and @log_flag = '1'
	begin
		--将对应的no字段改为0
		update	oper_log
		set	no = 0
		where	oper_date = @cur_date
		and	jour_no = @lsh_out
		and	no = 9999
	end

        return 0
l_fatal:
	--20080516 szy 增加交易时大数据量查询限制
	--如果记录日志
	if @mi_limit = '1' and @log_flag = '1'
	begin
		--将对应的no字段改为8888
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
	'6.8.6.1',			--版本号
	'2',				--操作标志
	'p859999',			--sp功能号
	@update_flag output		--修改标志
if @update_flag <> '0'
	print '出现错误。create proc p859999.sql失败！'
else
	print 'create proc p859999.sql '
go

