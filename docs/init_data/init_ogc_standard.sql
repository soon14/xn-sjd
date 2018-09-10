DROP TABLE IF EXISTS `tcoin_btc_xaddress`;
CREATE TABLE `tcoin_btc_xaddress` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `address` varchar(255) DEFAULT NULL COMMENT '比特币地址',
  `privatekey` varchar(255) DEFAULT NULL COMMENT '私钥',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tcoin_coin`;
CREATE TABLE `tcoin_coin` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `symbol` varchar(64) NOT NULL DEFAULT '' COMMENT '英文简称',
  `ename` varchar(64) DEFAULT NULL COMMENT '英文名称',
  `cname` varchar(64) DEFAULT NULL COMMENT '中文名称',
  `type` varchar(32) NOT NULL COMMENT '分类 0-以太币 1-比特币 2—万维币 0T-以太token币 2T-万维token币',
  `unit` int(11) NOT NULL COMMENT '单位',
  `icon` varchar(255) NOT NULL COMMENT '币种图标',
  `pic1` varchar(255) DEFAULT NULL COMMENT '图标1',
  `pic2` varchar(255) DEFAULT NULL COMMENT '图标2',
  `pic3` varchar(255) DEFAULT NULL COMMENT '图标3',
  `order_no` int(11) NOT NULL COMMENT 'UI序号',
  `collect_start` decimal(64,0) NOT NULL COMMENT '归集阀值',
  `withdraw_fee` decimal(64,0) NOT NULL COMMENT '取现手续费',
  `contract_address` varchar(255) DEFAULT NULL COMMENT '合约地址',
  `contract_abi` text COMMENT '合约ABI',
  `status` varchar(8) NOT NULL COMMENT '状态',
  `updater` varchar(32) NOT NULL COMMENT '最后操作人',
  `update_datetime` datetime NOT NULL COMMENT '最后操作时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='钱包支持币种';

DROP TABLE IF EXISTS `tcoin_eth_xaddress`;
CREATE TABLE `tcoin_eth_xaddress` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `address` varchar(255) NOT NULL COMMENT '以太坊地址',
  `keystore_pwd` varchar(255) NOT NULL COMMENT 'keystore密码',
  `keystore_name` text COMMENT 'keystore文件名',
  `keystore_content` text COMMENT 'keystore文件内容',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ETH用户分发地址';

DROP TABLE IF EXISTS `tcoin_eth_maddress`;
CREATE TABLE `tcoin_eth_maddress` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `address` varchar(255) DEFAULT NULL COMMENT '以太坊地址',
  `keystore_pwd` varchar(255) NOT NULL COMMENT 'keystore密码',
  `keystore_name` text COMMENT 'keystore文件名',
  `keystore_content` text COMMENT 'keystore文件内容',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `abandon_datetime` datetime DEFAULT NULL COMMENT '弃用时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ETH平台散取地址';

DROP TABLE IF EXISTS `tcoin_eth_waddress`;
CREATE TABLE `tcoin_eth_waddress` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `address` varchar(255) DEFAULT NULL COMMENT '以太坊地址',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `abandon_datetime` datetime DEFAULT NULL COMMENT '弃用时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ETH平台归集地址';

DROP TABLE IF EXISTS `tcoin_eth_transaction`;
CREATE TABLE `tcoin_eth_transaction` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `hash` varchar(255) NOT NULL COMMENT '交易哈希',
  `nonce` bigint(32) NOT NULL COMMENT '交易次数',
  `block_hash` varchar(255) NOT NULL COMMENT '区块哈希',
  `block_number` bigint(32) NOT NULL COMMENT '区块号',
  `block_create_datetime` datetime NOT NULL COMMENT '区块形成时间',
  `transaction_index` bigint(32) NOT NULL COMMENT '交易index',
  `from` varchar(255) NOT NULL COMMENT '转出地址',
  `to` varchar(255) NOT NULL COMMENT '转入地址',
  `value` decimal(64,0) NOT NULL COMMENT '交易额',
  `sync_datetime` datetime NOT NULL COMMENT '同步时间',
  `gas_price` decimal(64,0) NOT NULL COMMENT 'gas价格',
  `gas_limit` bigint(20) NOT NULL COMMENT 'gas最大使用限制',
  `gas_used` bigint(20) NOT NULL COMMENT 'gas实际使用量',
  `gas_fee` decimal(64,0) NOT NULL COMMENT 'gas手续费',
  `input` text COMMENT 'input 输入',
  `public_key` text COMMENT 'publicKey',
  `raw` text COMMENT 'raw',
  `r` text COMMENT 'r',
  `s` text COMMENT 's',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash_UNIQUE` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ETH交易记录';

DROP TABLE IF EXISTS `tcoin_token_event`;
CREATE TABLE `tcoin_token_event` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `hash` varchar(255) NOT NULL COMMENT '交易哈希',
  `token_from` varchar(255) DEFAULT NULL COMMENT 'token币发起地址',
  `token_to` varchar(255) DEFAULT NULL COMMENT 'token币接收地址',
  `token_value` decimal(64,0) DEFAULT NULL COMMENT 'token币数量',
  `token_log_index` bigint(32) DEFAULT NULL COMMENT 'event_log_index',
  `symbol` varchar(32) NOT NULL COMMENT '币种符号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ETHtoken交易event';

DROP TABLE IF EXISTS `tcoin_personal_address`;
CREATE TABLE `tcoin_personal_address` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `symbol` varchar(32) DEFAULT NULL COMMENT '币种',
  `address` varchar(255) DEFAULT NULL COMMENT '提现地址',
  `label` varchar(64) DEFAULT NULL COMMENT '标签',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) DEFAULT NULL COMMENT '最后操作人',
  `update_datetime` datetime DEFAULT NULL COMMENT '最后一次更时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户取现地址';

DROP TABLE IF EXISTS `tstd_account`;
CREATE TABLE `tstd_account` (
  `account_number` varchar(32) NOT NULL COMMENT '账户编号',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `currency` varchar(8) DEFAULT NULL COMMENT '币种',
  `address` varchar(255) DEFAULT NULL COMMENT '区块链地址',
  `type` varchar(4) DEFAULT NULL COMMENT '类别（B端账号，C端账号，平台账号）',
  `status` varchar(2) DEFAULT NULL COMMENT '状态（正常/程序冻结/人工冻结）',
  `amount` decimal(64,0) DEFAULT NULL COMMENT '余额',
  `frozen_amount` decimal(64,0) DEFAULT NULL COMMENT '冻结金额',
  `md5` varchar(32) DEFAULT NULL COMMENT 'MD5',
  `in_amount` decimal(64,0) DEFAULT '0' COMMENT '总充值金额（入金）',
  `out_amount` decimal(64,0) DEFAULT '0' COMMENT '总取现金额（出金）',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `last_order` varchar(32) DEFAULT NULL COMMENT '最近一次变动对应的流水编号',
  PRIMARY KEY (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户';

DROP TABLE IF EXISTS `tstd_jour`;
CREATE TABLE `tstd_jour` (
  `code` varchar(32) NOT NULL COMMENT '编号',
  `type` varchar(32) DEFAULT NULL COMMENT '流水类型（余额流水、冻结流水）',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `account_number` varchar(32) DEFAULT NULL COMMENT '账户编号',
  `account_type` varchar(4) DEFAULT NULL COMMENT '账户类型',
  `currency` varchar(8) DEFAULT NULL COMMENT '币种',
  `biz_type` varchar(32) DEFAULT NULL COMMENT '业务类型',
  `biz_note` varchar(255) DEFAULT NULL COMMENT '业务说明',
  `trans_amount` decimal(64,0) DEFAULT NULL COMMENT '变动金额',
  `pre_amount` decimal(64,0) DEFAULT NULL COMMENT '变动前金额',
  `post_amount` decimal(64,0) DEFAULT NULL COMMENT '变动后金额',
  `status` varchar(4) DEFAULT NULL COMMENT '状态',
  `channel_type` varchar(32) DEFAULT NULL COMMENT '支付渠道类型',
  `channel_order` varchar(255) DEFAULT NULL COMMENT '支付渠道单号',
  `ref_no` varchar(255) DEFAULT NULL COMMENT '系统内部参考订单号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `work_date` varchar(8) DEFAULT NULL COMMENT '拟对账时间',
  `check_user` varchar(32) DEFAULT NULL COMMENT '对账人',
  `check_note` varchar(255) DEFAULT NULL COMMENT '对账说明',
  `check_datetime` datetime DEFAULT NULL COMMENT '对账时间',
  `adjust_user` varchar(32) DEFAULT NULL COMMENT '调账人',
  `adjust_note` varchar(255) DEFAULT NULL COMMENT '调账说明',
  `adjust_datetime` datetime DEFAULT NULL COMMENT '调账时间',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户流水';

DROP TABLE IF EXISTS `tstd_charge`;
CREATE TABLE `tstd_charge` (
  `code` varchar(32) NOT NULL COMMENT '编号',
  `account_number` varchar(32) DEFAULT NULL COMMENT '账户编号',
  `account_type` varchar(4) DEFAULT NULL COMMENT '账户类型',
  `amount` decimal(64,0) DEFAULT NULL COMMENT '充值金额',
  `currency` varchar(8) DEFAULT NULL COMMENT '币种',
  `biz_type` varchar(32) DEFAULT NULL COMMENT '关联业务类型',
  `biz_note` varchar(255) DEFAULT NULL COMMENT '关联业务备注',
  `biz_no` varchar(255) DEFAULT NULL COMMENT '关联订单号',
  `pay_card_info` varchar(255) DEFAULT NULL COMMENT '支付渠道账号信息',
  `pay_card_no` varchar(255) DEFAULT NULL COMMENT '支付渠道账号',
  `status` varchar(4) NOT NULL COMMENT '状态 1待支付 2支付失败 3支付成功',
  `apply_user` varchar(32) DEFAULT NULL COMMENT '申请人',
  `apply_note` varchar(255) DEFAULT NULL COMMENT '申请说明',
  `apply_datetime` datetime DEFAULT NULL COMMENT '申请时间',
  `pay_user` varchar(32) DEFAULT NULL COMMENT '支付回录人',
  `pay_note` varchar(255) DEFAULT NULL COMMENT '支付渠道说明',
  `pay_datetime` datetime DEFAULT NULL COMMENT '支付时间',
  `channel_type` varchar(32) DEFAULT NULL COMMENT '支付渠道',
  `channel_order` varchar(64) DEFAULT NULL COMMENT '支付渠道单号',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值订单';

DROP TABLE IF EXISTS `tstd_withdraw`;
CREATE TABLE `tstd_withdraw` (
  `code` varchar(32) NOT NULL COMMENT '编号',
  `account_number` varchar(32) DEFAULT NULL COMMENT '账户编号',
  `account_type` varchar(4) DEFAULT NULL COMMENT '类别（B端账号，C端账号，平台账号）',
  `currency` varchar(32) DEFAULT NULL COMMENT '币种',
  `amount` decimal(64,0) DEFAULT NULL COMMENT '取现金额',
  `fee` decimal(64,0) DEFAULT NULL COMMENT '手续费',
  `actual_amount` decimal(64,0) DEFAULT NULL COMMENT '实际到账金额',
  `channel_type` varchar(32) DEFAULT NULL COMMENT '支付渠道',
  `channel_bank` varchar(32) DEFAULT NULL COMMENT '渠道银行代号',
  `channel_order` varchar(255) DEFAULT NULL COMMENT '支付渠道编号',
  `pay_card_info` varchar(255) DEFAULT NULL COMMENT '支付渠道账号信息',
  `pay_card_no` varchar(255) DEFAULT NULL COMMENT '支付渠道账号',
  `status` varchar(4) NOT NULL COMMENT '状态',
  `apply_user` varchar(32) DEFAULT NULL COMMENT '申请人',
  `apply_note` varchar(255) DEFAULT NULL COMMENT '申请说明',
  `apply_datetime` datetime DEFAULT NULL COMMENT '申请时间',
  `approve_user` varchar(32) DEFAULT NULL COMMENT '审批人',
  `approve_note` varchar(255) DEFAULT NULL COMMENT '审批说明',
  `approve_datetime` varchar(32) DEFAULT NULL COMMENT '审批时间',
  `pay_user` varchar(255) DEFAULT NULL COMMENT '支付回录人',
  `pay_note` varchar(255) DEFAULT NULL COMMENT '支付回录说明',
  `pay_fee` decimal(64,0) DEFAULT NULL COMMENT '支付渠道手续费（矿工费）',
  `pay_datetime` datetime DEFAULT NULL COMMENT '支付回录时间',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '取现订单';

DROP TABLE IF EXISTS `tstd_collect`;
CREATE TABLE `tstd_collect` (
  `code` varchar(32) NOT NULL COMMENT '编号',
  `currency` varchar(32) DEFAULT NULL COMMENT '币种',
  `from_address` text COMMENT '被归集地址',
  `to_address` text COMMENT '归集地址',
  `amount` decimal(64,0) DEFAULT NULL COMMENT '归集数量',
  `tx_hash` varchar(255) DEFAULT NULL COMMENT '交易hash',
  `tx_fee` decimal(64,0) DEFAULT NULL COMMENT '矿工费',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `create_datetime` datetime DEFAULT NULL COMMENT '发起时间',
  `confirm_datetime` datetime DEFAULT NULL COMMENT '网络记账时间',
  `finish_datetime` datetime DEFAULT NULL COMMENT '完成时间',
  `ref_no` varchar(32) DEFAULT NULL COMMENT '关联订单号',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '归集订单';

DROP TABLE IF EXISTS `tstd_deposit`;
CREATE TABLE `tstd_deposit` (
  `code` varchar(32) NOT NULL COMMENT '编号',
  `currency` varchar(32) DEFAULT NULL COMMENT '币种',
  `from_address` text COMMENT '付款地址',
  `to_address` text COMMENT '收款地址',
  `amount` decimal(64,0) DEFAULT NULL COMMENT '定存数量',
  `tx_hash` varchar(255) DEFAULT NULL COMMENT '交易hash',
  `tx_fee` decimal(64,0) DEFAULT NULL COMMENT '矿工费',
  `confirm_datetime` datetime DEFAULT NULL COMMENT '网络记账时间',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `ref_no` varchar(32) DEFAULT NULL COMMENT '关联订单号',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '定存订单';

DROP TABLE IF EXISTS `tstd_hlorder`;
CREATE TABLE `tstd_hlorder` (
  `code` varchar(32) NOT NULL COMMENT '编号',
  `account_number` varchar(32) NOT NULL COMMENT '账户编号',
  `currency` varchar(8) DEFAULT NULL COMMENT '币种',
  `jour_code` varchar(32) DEFAULT NULL COMMENT '流水号',
  `channel_type` varchar(32) DEFAULT NULL COMMENT '支付渠道',
  `direction` char(1) NOT NULL COMMENT '方向：1=蓝补；0=红冲',
  `amount` decimal(64,0) NOT NULL COMMENT '金额',
  `status` varchar(4) NOT NULL COMMENT '状态',
  `apply_user` varchar(32) NOT NULL COMMENT '申请人',
  `apply_note` varchar(255) NOT NULL COMMENT '申请说明',
  `apply_datetime` datetime DEFAULT NULL COMMENT '申请时间',
  `approve_user` varchar(32) DEFAULT NULL COMMENT '审批人',
  `approve_note` varchar(255) DEFAULT NULL COMMENT '审批说明',
  `approve_datetime` datetime DEFAULT NULL COMMENT '审批时间',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '红蓝订单';

DROP TABLE IF EXISTS `tcoin_currency_rate`;
CREATE TABLE `tcoin_currency_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(10) NOT NULL COMMENT '币种',
  `refer_currency` varchar(10) NOT NULL COMMENT '参照币种 为CNY',
  `origin` varchar(32) NOT NULL COMMENT '汇率来源',
  `rate` decimal(8,4) NOT NULL COMMENT '汇率',
  `update_datetime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '法币汇率';

DROP TABLE IF EXISTS `tcoin_market`;
CREATE TABLE `tcoin_market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(10) NOT NULL COMMENT '数字货币',
  `refer_currency` varchar(10) NOT NULL COMMENT '参照法币币种',
  `origin` varchar(32) NOT NULL COMMENT '行情来源',
  `last_price` decimal(18,4) NOT NULL COMMENT '最新成交价格',
  `bid` decimal(18,4) DEFAULT NULL COMMENT '买家期望价格',
  `ask` decimal(18,4) DEFAULT NULL COMMENT '卖家期望价格',
  `mid` decimal(18,4) NOT NULL COMMENT '中间价格',
  `low` decimal(18,4) NOT NULL COMMENT '最低价格',
  `high` decimal(18,4) NOT NULL COMMENT '最高价格',
  `volume` varchar(32) DEFAULT NULL COMMENT '交易量',
  `update_datetime` datetime NOT NULL COMMENT '更新时间',
  `coinmarketcap_id` int(10) NOT NULL COMMENT 'coinmarketcap中的币种id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `origin` (`origin`,`symbol`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '币种行情';

/*
 * 1、法币币种用currency 数字货币币种用symbol  
 * 2、金额数据库字段都用decimal(64,0) domain用BigDecimal
 * */

DROP TABLE IF EXISTS `tcoin_trade_order`;
CREATE TABLE `tcoin_trade_order` (
  `code` varchar(32) NOT NULL COMMENT '订单编号',
  `type` varchar(32) DEFAULT NULL COMMENT '订单类型',
  `ads_code` varchar(32) DEFAULT NULL COMMENT '广告编号',
  `buy_user` varchar(32) DEFAULT NULL COMMENT '买方',
  `sell_user` varchar(32) DEFAULT NULL COMMENT '卖方',
  `leave_message` text CHARACTER SET utf8mb4 COMMENT '广告留言',
  `trade_currency` varchar(32) DEFAULT NULL COMMENT '交易币种',
  `trade_coin` varchar(32) DEFAULT NULL COMMENT '交易数字货币类型',
  `trade_price` decimal(32,3) DEFAULT NULL COMMENT '交易单价',
  `trade_amount` decimal(32,3) DEFAULT NULL COMMENT '交易总额',
  `fee` decimal(64,0) DEFAULT NULL COMMENT '手续费',
  `count` decimal(64,0) DEFAULT NULL COMMENT '交易数字货币数量',
  `pay_type` varchar(32) DEFAULT NULL COMMENT '付款方式',
  `invalid_datetime` datetime DEFAULT NULL COMMENT '支付超时时间',
  `status` varchar(4) DEFAULT NULL COMMENT '订单状态',
  `sb_comment` varchar(32) DEFAULT NULL COMMENT '卖方对买方的评价',
  `bs_comment` varchar(32) DEFAULT NULL COMMENT '买方对卖方的评价',
  `mark_datetime` datetime DEFAULT NULL COMMENT '标记打款时间',
  `release_datetime` datetime DEFAULT NULL COMMENT '币释放时间',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) DEFAULT NULL COMMENT '最后更新人',
  `update_datetime` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tcoin_ads`;
CREATE TABLE `tcoin_ads` (
  `code` varchar(32) NOT NULL COMMENT '编号',
  `trade_type` varchar(32) NOT NULL COMMENT '广告类型（0购买 1出售）',
  `user_id` varchar(32) NOT NULL COMMENT '发布用户编号',
  `trade_currency` varchar(8) NOT NULL COMMENT '交易币种',
  `trade_coin` varchar(8) NOT NULL COMMENT '数字货币类型',
  `only_trust` varchar(2) NOT NULL COMMENT '是否只有信任的人可以交易',
  `premium_rate` decimal(6,4) NOT NULL COMMENT '溢价率',
  `total_count` decimal(64,0) NOT NULL COMMENT '广告的交易总额',
  `left_count` decimal(64,0) NOT NULL COMMENT '剩余可交易',
  `market_price` decimal(32,3) NOT NULL COMMENT '行情价格',
  `protect_price` decimal(32,3) NOT NULL COMMENT '保护单价',
  `true_price` decimal(32,3) NOT NULL COMMENT '溢价率换算后的真实价格',
  `min_trade` decimal(32,3) DEFAULT NULL COMMENT '单笔最小交易额',
  `max_trade` decimal(32,3) DEFAULT NULL COMMENT '单笔最大交易额',
  `pay_type` varchar(32) NOT NULL COMMENT '付款方式',
  `pay_limit` int(11) DEFAULT NULL COMMENT '付款超时时间（分钟）',
  `status` varchar(4) NOT NULL COMMENT '状态 0=草稿、1=上架中、2=下架',
  `leave_message` text CHARACTER SET utf8mb4 NOT NULL COMMENT '广告留言',
  `create_datetime` datetime NOT NULL COMMENT '创建时间',
  `update_datetime` datetime NOT NULL COMMENT '更新时间',
  `fee_rate` decimal(8,4) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tcoin_ads_display_time`;
CREATE TABLE `tcoin_ads_display_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ads_code` varchar(32) NOT NULL COMMENT '编号',
  `week` char(1) NOT NULL COMMENT '周几',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_week` (`ads_code`,`week`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tcoin_arbitrate`;
CREATE TABLE `tcoin_arbitrate` (
  `code` varchar(32) NOT NULL COMMENT '工单编号',
  `trade_order_code` varchar(32) DEFAULT NULL COMMENT '交易订单编号',
  `yuangao` varchar(32) DEFAULT NULL COMMENT '原告',
  `beigao` varchar(32) DEFAULT NULL COMMENT '被告',
  `reason` text CHARACTER SET utf8mb4 COMMENT '仲裁理由',
  `attach` text CHARACTER SET utf8mb4 COMMENT '附件',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `create_datetime` datetime DEFAULT NULL COMMENT '申请时间',
  `result` text COMMENT '处理结果',
  `updater` varchar(45) DEFAULT NULL COMMENT '处理人',
  `update_datetime` datetime DEFAULT NULL COMMENT '处理时间',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tstd_user`;
CREATE TABLE `tstd_user` (
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `login_name` varchar(64) DEFAULT NULL COMMENT '登陆名',
  `mobile` varchar(16) DEFAULT NULL COMMENT '手机号',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `login_pwd` varchar(32) DEFAULT NULL COMMENT '登陆密码',
  `login_pwd_strength` char(1) DEFAULT NULL COMMENT '登陆密码强度',
  `level` varchar(4) DEFAULT NULL COMMENT '用户等级',
  `user_referee` varchar(32) DEFAULT NULL COMMENT '推荐人',
  `id_kind` char(1) DEFAULT NULL COMMENT '证件类型',
  `id_no` varchar(32) DEFAULT NULL COMMENT '证件号码',
  `real_name` varchar(16) DEFAULT NULL COMMENT '真实姓名',
  `trade_pwd` varchar(32) DEFAULT NULL COMMENT '安全密码',
  `trade_pwd_strength` char(1) DEFAULT NULL COMMENT '安全密码强度',
  `status` varchar(2) DEFAULT NULL COMMENT '状态',
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `area` varchar(255) DEFAULT NULL COMMENT '区',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) DEFAULT NULL COMMENT '维度',
  `trade_rate` decimal(8,4) DEFAULT NULL COMMENT '交易手续费',
  `create_datetime` datetime DEFAULT NULL COMMENT '注册时间',
  `updater` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tstd_user_ext`;
CREATE TABLE `tstd_user_ext` (
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `gender` char(1) DEFAULT NULL COMMENT '性别(1 男 0 女)',
  `introduce` varchar(255) DEFAULT NULL COMMENT '自我介绍',
  `birthday` varchar(16) DEFAULT NULL COMMENT '生日',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `diploma` varchar(4) DEFAULT NULL COMMENT '学位',
  `occupation` varchar(64) DEFAULT NULL COMMENT '职业',
  `grad_datetime` datetime DEFAULT NULL COMMENT '毕业时间',
  `work_time` varchar(4) DEFAULT NULL COMMENT '工作年限',
  `pdf` varchar(255) DEFAULT NULL COMMENT '用户资料',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tstd_sign_log`;
CREATE TABLE `tstd_sign_log` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'ID主键',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `type` varchar(4) DEFAULT NULL COMMENT '分类（1-登录日志；2-签到日志）',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip',
  `client` varchar(4) DEFAULT NULL COMMENT '客户端',
  `location` varchar(255) DEFAULT NULL COMMENT '登录时定位',
  `create_datetime` datetime DEFAULT NULL COMMENT '签到时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tstd_auth_log`;
CREATE TABLE `tstd_auth_log` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'ID主键',
  `type` varchar(4) DEFAULT NULL COMMENT '认证类型',
  `auth_arg1` varchar(255) DEFAULT NULL COMMENT '入参1',
  `auth_arg2` varchar(255) DEFAULT NULL COMMENT '入参2',
  `auth_arg3` varchar(255) DEFAULT NULL COMMENT '入参3',
  `status` varchar(4) DEFAULT NULL COMMENT '状态 0=待处理 1=认证通过 2=认证不通过',
  `apply_user` varchar(32) DEFAULT NULL COMMENT '申请人',
  `apply_datetime` datetime DEFAULT NULL COMMENT '申请时间',
  `approve_user` varchar(32) DEFAULT NULL COMMENT '审核人',
  `approve_datetime` datetime DEFAULT NULL COMMENT '审核时间',
  `result` varchar(255) DEFAULT NULL COMMENT '出参',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tstd_blacklist`;
CREATE TABLE `tstd_blacklist` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'ID主键',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `type` varchar(4) DEFAULT NULL COMMENT '拉黑粒度',
  `status` varchar(4) DEFAULT NULL COMMENT '状态 0-已失效 1-已生效',
  `create_datetime` datetime DEFAULT NULL COMMENT '拉黑时间',
  `updater` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_datetime` varchar(45) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `tstd_read`;
CREATE TABLE `tstd_read` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT 'ID主键',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `sms_code` varchar(32) DEFAULT NULL COMMENT '消息编号',
  `receive_way` varchar(4) DEFAULT NULL COMMENT '接受方式(站内消息，APP推送,短信)',
  `status` varchar(4) DEFAULT NULL COMMENT '状态 0-未阅读 1-已阅读 2-已删除',
  `create_datetime` datetime DEFAULT NULL COMMENT '推送时间',
  `read_datetime` datetime DEFAULT NULL COMMENT '阅读时间',
  `delete_datetime` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tstd_sms`;
CREATE TABLE `tstd_sms` (
  `code` varchar(32) NOT NULL COMMENT '消息编号',
  `type` varchar(4) DEFAULT NULL COMMENT '消息类型（系统公告，短信内容）',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `status` varchar(4) DEFAULT NULL COMMENT '状态 0-草稿 1-已发送 2-已回撤',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_datetime` varchar(45) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsys_dict`;
CREATE TABLE `tsys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `parent_key` varchar(32) DEFAULT NULL COMMENT '父亲key',
  `dkey` varchar(32) DEFAULT NULL COMMENT 'key',
  `dvalue` varchar(255) DEFAULT NULL COMMENT 'value',
  `updater` varchar(32) DEFAULT NULL COMMENT '最近修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '最近修改人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsys_config`;
CREATE TABLE `tsys_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `ckey` varchar(255) DEFAULT NULL COMMENT 'key',
  `cvalue` text COMMENT 'value',
  `updater` varchar(32) DEFAULT NULL COMMENT '最近修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '最近修改人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsys_company`;
CREATE TABLE `tsys_company` (
  `code` varchar(32) NOT NULL COMMENT '编号',
  `name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_datetime` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsys_department`;
CREATE TABLE `tsys_department` (
  `code` varchar(32) NOT NULL COMMENT '编号',
  `company_code` varchar(32) DEFAULT NULL COMMENT '公司编号',
  `name` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `leader` varchar(255) DEFAULT NULL COMMENT '部门负责人',
  `leader_mobile` varchar(16) DEFAULT NULL COMMENT '负责人手机号',
  `parent_code` varchar(32) DEFAULT NULL COMMENT '上级部门',
  `updater` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_datetime` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tsys_user`;
CREATE TABLE `tsys_user` (
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `role_code` varchar(32) DEFAULT NULL COMMENT '角色编号',
  `department_code` varchar(32) DEFAULT NULL COMMENT '部门编号(当有部门表时才有此字段）',
  `real_name` varchar(64) DEFAULT NULL COMMENT '真实姓名',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `mobile` varchar(16) DEFAULT NULL COMMENT '手机号',
  `login_name` varchar(64) DEFAULT NULL COMMENT '登录名',
  `login_pwd` varbinary(32) DEFAULT NULL COMMENT '登录密码',
  `login_pwd_strength` char(1) DEFAULT NULL COMMENT '登录密码强度',
  `create_datetime` datetime DEFAULT NULL COMMENT '注册时间',
  `status` varchar(4) DEFAULT NULL COMMENT '状态',
  `updater` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_datetime` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` text COMMENT '备注',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsys_menu`;
CREATE TABLE `tsys_menu` (
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '编号',
  `parent_code` varchar(32) DEFAULT NULL COMMENT '父亲key',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `type` varchar(2) DEFAULT NULL COMMENT '类型',
  `url` varchar(255) DEFAULT NULL COMMENT 'url',
  `order_no` int(11) DEFAULT NULL COMMENT '次序',
  `updater` varchar(32) DEFAULT NULL COMMENT '最近修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '最近修改人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tsys_menu_role`;
CREATE TABLE `tsys_menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(32) DEFAULT NULL COMMENT '角色编号',
  `menu_code` varchar(32) DEFAULT NULL COMMENT '菜单编号',
  `updater` varchar(32) DEFAULT NULL COMMENT '最近修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '最近修改人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1144 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tsys_role`;
CREATE TABLE `tsys_role` (
  `code` varchar(32) DEFAULT NULL COMMENT '编号',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `updater`varchar(32) DEFAULT NULL COMMENT '最近修改人',
  `update_datetime` datetime DEFAULT NULL COMMENT '最近修改人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `system_code` varchar(32) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsys_cnavigate`;
CREATE TABLE `tsys_cnavigate` (
  `code` varchar(32) NOT NULL COMMENT '编号',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `url` varchar(255) DEFAULT NULL COMMENT '访问Url',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片',
  `status` varchar(4) DEFAULT NULL COMMENT '状态(1 显示 0 不显示)',
  `location` varchar(32) DEFAULT NULL COMMENT '位置',
  `order_no` int(11) DEFAULT NULL COMMENT '相对位置编号',
  `belong` varchar(32) DEFAULT NULL COMMENT '属于(1 全局 2 地方默认 3 地方默认编号)',
  `parent_code` varchar(32) DEFAULT NULL COMMENT '父编号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `content_type` varchar(32) DEFAULT NULL COMMENT '内容源类型',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsys_channel_bank`;
CREATE TABLE `tsys_channel_bank` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '编号（自增长）',
  `bank_code` varchar(32) DEFAULT NULL COMMENT '银行编号',
  `bank_name` varchar(32) DEFAULT NULL COMMENT '银行名称',
  `channel_type` varchar(4) DEFAULT NULL COMMENT '渠道类型',
  `status` varchar(4) DEFAULT NULL COMMENT '状态（启用/不启用）',
  `channel_bank` varchar(32) DEFAULT NULL COMMENT '渠道给银行的代号',
  `max_order` bigint(32) DEFAULT NULL COMMENT '笔数限制',
  `order_amount` bigint(32) DEFAULT NULL COMMENT '单笔限额',
  `day_amount` bigint(32) DEFAULT NULL COMMENT '每日限额',
  `month_amount` bigint(32) DEFAULT NULL COMMENT '每月限额',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tsimu_group`;
CREATE TABLE IF NOT EXISTS `tsimu_group` (
  `code` VARCHAR(32) NOT NULL COMMENT '编号',
  `match_code` VARCHAR(32) NOT NULL COMMENT '赛事编号',
  `team_code` VARCHAR(32) NOT NULL COMMENT '战队编号',
  `user_id` VARCHAR(32) NOT NULL COMMENT '用户编号',
  `symbol` VARCHAR(32) NOT NULL COMMENT '代币符号',
  `init_amount` DECIMAL(64,0) NOT NULL COMMENT '初始金额',
  `balance` DECIMAL(64,0) NOT NULL COMMENT ' 余额',
  `total_assets` DECIMAL(64,0) NOT NULL COMMENT '总资产',
  `total_benefit` DECIMAL(64,0) NULL COMMENT '总收益',
  `day_benefit` DECIMAL(64,0) NULL COMMENT '今日收益',
  `week_benefit` DECIMAL(64,0) NULL COMMENT '周收益',
  `month_benefit` DECIMAL(64,0) NULL COMMENT '月收益',
  `order_no` BIGINT(32) NOT NULL COMMENT '排行',
  `follow_number` BIGINT(32) NULL COMMENT '关注人数',
  `status` VARCHAR(32) NOT NULL COMMENT '状态（1-进行中，0-已结束）',
  `create_datetime` DATETIME NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`code`))
ENGINE = InnoDB DEFAULT CHARSET=utf8
COMMENT = '组合表';

DROP TABLE IF EXISTS `tsimu_group_coin`;
CREATE TABLE IF NOT EXISTS `tsimu_group_coin` (
  `id` BIGINT(32) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `group_code` VARCHAR(32) NOT NULL COMMENT '组合编号',
  `symbol` VARCHAR(32) NULL COMMENT '代币符号',
  `count` DECIMAL(64,18) NULL COMMENT '数量',
  `frozen_count` DECIMAL(64,18) NULL COMMENT '冻结数量',
  `assets` DECIMAL(64,18) NULL COMMENT '币种资产',
  `rate` DECIMAL(18,4) NULL COMMENT '占比',
  PRIMARY KEY (`id`))
ENGINE = InnoDB DEFAULT CHARSET=utf8
COMMENT = '币种配置表';

DROP TABLE IF EXISTS `tsimu_group_coin`;
CREATE TABLE IF NOT EXISTS `tsimu_group_coin` (
  `account_number` varchar(32) NOT NULL COMMENT '账户编号',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `group_code` VARCHAR(32) NOT NULL COMMENT '组合编号',
  `symbol` VARCHAR(32) NULL COMMENT '代币符号',
  `count` DECIMAL(64,18) NULL COMMENT '数量',
  `frozen_count` DECIMAL(64,18) NULL COMMENT '冻结数量',
  `assets` DECIMAL(64,18) NULL COMMENT '币种资产',
  `rate` DECIMAL(18,4) NULL COMMENT '占比',
  `last_order` varchar(32) DEFAULT NULL COMMENT '最近一次变动对应的流水编号',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`account_number`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4
COMMENT = '币种配置账户表';

DROP TABLE IF EXISTS `tsimu_group_coin_jour`;
CREATE TABLE `tsimu_group_coin_jour` (
  `code` varchar(32) NOT NULL COMMENT '编号',
  `ref_no` varchar(32) DEFAULT NULL COMMENT '参考订单号',
  `account_number` varchar(32) DEFAULT NULL COMMENT '账户编号',
  `trans_amount` bigint(32) DEFAULT NULL COMMENT '变动金额',
  `group_code` VARCHAR(32) NOT NULL COMMENT '组合编号',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `symbol` varchar(8) DEFAULT NULL COMMENT '币种',
  `biz_type` varchar(32) DEFAULT NULL COMMENT '业务类型',
  `biz_note` varchar(255) DEFAULT NULL COMMENT '业务类型',
  `pre_amount` bigint(32) DEFAULT NULL COMMENT '变动前金额',
  `post_amount` bigint(32) DEFAULT NULL COMMENT '变动后金额',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`code`)) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
COMMENT = '币种配置账户流水表';


DROP TABLE IF EXISTS `tsimu_attention`;
CREATE TABLE IF NOT EXISTS `tsimu_attention` (
  `code` VARCHAR(32) NOT NULL COMMENT '编号',
  `type` VARCHAR(32) NOT NULL COMMENT '类型(1-关注/0-提醒)',
  `user_id` VARCHAR(32) NOT NULL COMMENT '用户编号',
  `group_code` VARCHAR(32) NOT NULL COMMENT '组合编号',
  `group_user_id` VARCHAR(32) NOT NULL COMMENT '组合用户编号',
  `create_datetime` DATETIME NOT NULL COMMENT '关注时间',
  PRIMARY KEY (`code`))
ENGINE = InnoDB DEFAULT CHARSET=utf8
COMMENT = '关注表';

DROP TABLE IF EXISTS `tsimu_day_benefit`;
CREATE TABLE IF NOT EXISTS `tsimu_day_benefit` (
  `id` BIGINT(32) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `group_code` VARCHAR(32) NOT NULL COMMENT '组合编号',
  `yesterday_assets` DECIMAL(64,18) NULL COMMENT '昨日总资产',
  `today_assets` DECIMAL(64,18) NULL COMMENT '今日总资产',
  `benefit` DECIMAL(64,18) NULL COMMENT '收益',
  `benefit_rate` DECIMAL(18,4) NULL COMMENT '收益率',
  `create_datetime` DATETIME NOT NULL COMMENT '产生日期',
  PRIMARY KEY (`id`))
ENGINE = InnoDB DEFAULT CHARSET=utf8
COMMENT = '每日收益统计表';

DROP TABLE IF EXISTS `tsimu_order`;
CREATE TABLE IF NOT EXISTS `tsimu_order` (
  `code` VARCHAR(32) NOT NULL COMMENT '编号',
  `group_code` VARCHAR(32) NOT NULL COMMENT '组合编号',
  `user_id` VARCHAR(32) NOT NULL COMMENT '用户编号',
  `exchange` VARCHAR(255) NOT NULL COMMENT '交易所',
  `symbol` VARCHAR(32) NOT NULL COMMENT '交易币种',
  `to_symbol` VARCHAR(32) NOT NULL COMMENT '计价币种',
  `type` VARCHAR(32) NOT NULL COMMENT '类型(1-市价，0-限价)',
  `direction` VARCHAR(32) NOT NULL COMMENT '买卖方向(0-买入，1-卖出)',
  `price` DECIMAL(64,18) NOT NULL COMMENT '委托价格',
  `total_count` DECIMAL(64,18) NOT NULL COMMENT '委托总数量',
  `total_amount` DECIMAL(64,18) NOT NULL COMMENT '委托总金额',
  `traded_count` DECIMAL(64,18) NULL COMMENT '已成交数量',
  `traded_amount` DECIMAL(64,18) NULL COMMENT '已成交总金额',
  `traded_fee` DECIMAL(64,18) NULL COMMENT '已成交总手续费',
  `last_traded_datetime` DATETIME NULL COMMENT '最后成交时间',
  `create_datetime` DATETIME NOT NULL COMMENT '创建时间',
  `cancel_datetime` DATETIME NULL COMMENT '撤销时间',
  `status` VARCHAR(32) NULL COMMENT '状态(0-待成交, 1-部分成交, 2-部分成交撤销, 3-完全成交, 4-已撤销)',
  PRIMARY KEY (`code`))
ENGINE = InnoDB DEFAULT CHARSET=utf8
COMMENT = '委托单';

DROP TABLE IF EXISTS `tsimu_order_detail`;
CREATE TABLE IF NOT EXISTS `tsimu_order_detail` (
  `code` VARCHAR(32) NOT NULL COMMENT '编号',
  `order_code` VARCHAR(32) NULL COMMENT '委托单编号',
  `traded_price` DECIMAL(64,18) NULL COMMENT '成交价格',
  `traded_count` DECIMAL(64,18) NULL COMMENT '成交数量',
  `traded_amount` DECIMAL(64,18) NULL COMMENT '成交总金额',
  `traded_fee` DECIMAL(64,18) NULL COMMENT '成交手续费',
  `create_datetime` DATETIME NULL COMMENT '成交时间',
  PRIMARY KEY (`code`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4
COMMENT = '成交明细单';

DROP TABLE IF EXISTS `tmk_coin`;
CREATE TABLE IF NOT EXISTS `tmk_coin` (
  `id` BIGINT(11) NOT NULL COMMENT '序号',
  `symbol` VARCHAR(32) NOT NULL COMMENT '币种符号',
  `cname` VARCHAR(255) NOT NULL COMMENT '中文简称',
  `ename` VARCHAR(255) NOT NULL COMMENT '英文简称',
  `type` VARCHAR(32) NULL COMMENT '类型',
  `unit` INT(11) NOT NULL COMMENT '单位',
  `logo` VARCHAR(255) NOT NULL COMMENT '图标',
  `order_no` BIGINT(11) NULL COMMENT 'UI序号',
  `status` VARCHAR(32) NULL COMMENT '状态',
  `updater` VARCHAR(32) NULL COMMENT '更新人',
  `update_datetime` DATETIME NULL COMMENT '更新时间',
  `remark` TEXT NULL COMMENT '备注',
  PRIMARY KEY (`id`))
ENGINE = InnoDB DEFAULT CHARSET=utf8
COMMENT = '币种';

DROP TABLE IF EXISTS `tmk_exchange`;
CREATE TABLE IF NOT EXISTS `tmk_exchange` (
  `id` BIGINT(11) NOT NULL COMMENT '序号',
  `ename` VARCHAR(255) NOT NULL COMMENT '交易所英文名',
  `cname` VARCHAR(255) NOT NULL COMMENT '交易所名称',
  `introduce` TEXT NULL COMMENT '简介',
  `status` VARCHAR(32) NULL COMMENT '状态',
  `order_no` BIGINT(11) NULL COMMENT 'UI序号',
  `updater` VARCHAR(32) NULL COMMENT '更新人',
  `update_datetime` DATETIME NULL COMMENT '更新时间',
  `remark` TEXT NULL COMMENT '备注',
  PRIMARY KEY (`id`))
ENGINE = InnoDB DEFAULT CHARSET=utf8
COMMENT = '交易所';

DROP TABLE IF EXISTS `tmk_exchange_pair`;
CREATE TABLE IF NOT EXISTS `tmk_exchange_pair` (
  `id` BIGINT(11) NOT NULL COMMENT '序号',
  `exchange_ename` VARCHAR(255) NULL COMMENT '交易所英文名',
  `symbol` VARCHAR(32) NULL COMMENT '基础币种',
  `to_symbol` VARCHAR(32) NULL COMMENT '计价币种',
  `price` DECIMAL(64,18) NULL COMMENT '最新价格',
  PRIMARY KEY (`id`))
ENGINE = InnoDB DEFAULT CHARSET=utf8
COMMENT = '交易对';


/*
-- Query: SELECT 
code,name,type,url,order_no,'admin' updater, now() as update_datetime,remark,parent_code,system_code 
FROM ogc_standard.tsys_menu where code ='COINSM201700000000000000' or parent_code ='COINSM201700000000000000'
or parent_code='COINSM201700001000000001' or parent_code in (select code from tsys_menu where parent_code ='COINSM201700001000000001')
or parent_code in (select code from tsys_menu where parent_code in (select code from tsys_menu where parent_code ='COINSM201700001000000001'))
LIMIT 0, 500

-- Date: 2018-09-03 17:49
*/
INSERT INTO `tsys_user` (`user_id`,`login_name`,`login_pwd`,`login_pwd_strength`,`role_code`,`status`,`create_datetime`,`remark`) VALUES ('UTOKEN201700000000000001','admin','21218cca77804d2ba1922c33e0151105','1','COINSR201700000000000000','0',now(),'管理端系统方');
/*
-- Query: SELECT * FROM ogc_standard.tsys_role
LIMIT 0, 1000

-- Date: 2018-09-09 01:20
*/
INSERT INTO `tsys_role` (`code`,`name`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSR201700000000000000','超级管理员','admin','2018-09-05 10:10:42','','CD-HPMN000024');
INSERT INTO `tsys_role` (`code`,`name`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('JS201809041727442529132','渠道商','admin','2018-09-05 15:47:56','渠道端OSS研发','CD-HPMN000024');

/*
-- Query: SELECT * FROM ogc_standard.tsys_menu
LIMIT 0, 1000

-- Date: 2018-09-10 13:41
*/
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051124053591570','COINSM201700000000000000','邀请好友','1','#',9,'admin','2018-09-05 11:24:05','渠道商OSS','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051124265397662','COINSM201700000000000000','提成管理','1','#',91,'admin','2018-09-05 11:24:26','渠道商OSS','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051138275949411','CD201809051124053591570','物料管理','1','#',1,'admin','2018-09-05 11:38:27','邀请好友','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051138479045380','CD201809051124053591570','我的好友','1','#',2,'admin','2018-09-05 11:38:47','邀请好友','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051139090202930','CD201809051138275949411','我的链接','1','/material/myHref.htm',1,'admin','2018-09-05 11:39:09','物料管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051141221304241','CD201809051138479045380','直推好友','1','/myFriend/directRecommend.htm',1,'admin','2018-09-05 15:59:42',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051142438202544','CD201809051138479045380','间推好友','1','/myFriend/inDirectRecommend.htm',2,'admin','2018-09-05 11:42:43','我的好友','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051145106035833','CD201809051141221304241','佣金明细','2','/commissions',1,'admin','2018-09-05 11:45:10','直推好友','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051145479875640','CD201809051142438202544','佣金明细','2','/commissions',1,'admin','2018-09-05 11:45:47','间推好友','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051146229553417','CD201809051124265397662','账户查询','1','#',1,'admin','2018-09-05 11:46:22','提成管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051146413078008','CD201809051124265397662','提成管理','1','#',1,'admin','2018-09-05 11:46:41','提成管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051405155191464','CD201809051124265397662','个人中心','1','#',3,'admin','2018-09-05 14:05:15','提成管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051405551042344','CD201809051146229553417','账户查询','1','/account/account.htm',1,'admin','2018-09-05 14:05:55','账户查询','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051408294987523','CD201809051146229553417','流水查询','1','/account/ledger.htm',2,'admin','2018-09-05 16:42:13',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051409392095134','CD201809051408294987523','详情','2','/detail',1,'admin','2018-09-05 14:09:39','流水查询','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051411328471714','CD201809051408294987523','导出','2','/export',2,'admin','2018-09-05 14:11:32','流水查询','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051413379489376','CD201809051146413078008','提成概况','1','/bonus/generalSituation',1,'admin','2018-09-05 14:16:42',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051418047274499','CD201809051413379489376','未结算查询','2','/anOpenAccountQuery',1,'admin','2018-09-05 14:18:04','提成概况','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051418316285274','CD201809051413379489376','结算查询','2','/settleAccount',2,'admin','2018-09-05 14:18:31','提成概况','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051607238198144','CD201809051146413078008','未结算提成','1','/bonus/anOpenAccountQuery.htm',2,'admin','2018-09-05 16:07:23','提成管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051608052906869','CD201809051607238198144','详情','2','/detail',1,'admin','2018-09-05 16:08:05','未结算提成','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051608218214579','CD201809051607238198144','导出','2','/export',2,'admin','2018-09-05 16:08:21','未结算提成','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051619207985545','CD201809051146413078008','已结算提成','1','/bonus/settledAccounts.htm',3,'admin','2018-09-05 16:19:20','提成管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051634466196190','CD201809051619207985545','详情','2','/detail',1,'admin','2018-09-05 16:34:46','已结算提成','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051635112754986','CD201809051619207985545','导出','2','/export',2,'admin','2018-09-05 16:35:28',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051637146977544','CD201809051146413078008','已提现提成','1','/bonus/alreadyPresented.htm',4,'admin','2018-09-05 16:37:14','提成管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051637362238648','CD201809051637146977544','详情','2','/detail',1,'admin','2018-09-05 16:37:36','已提现提成','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051638035551653','CD201809051637146977544','导出','2','/export',2,'admin','2018-09-05 16:38:03','已提现提成','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051639483257564','CD201809051405155191464','支付密码','1','/user/payPwd.htm',1,'admin','2018-09-05 16:39:48','个人中心','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051641034004212','CD201809051405155191464','登录密码','1','/user/loginPwd.htm',2,'admin','2018-09-05 16:41:03','个人中心','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051644355282742','CD201809051405155191464','常用地址','1','/user/oftenUseAddress.htm',3,'admin','2018-09-05 16:44:35','个人中心','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051649013452399','CD201809051644355282742','新增','2','/add',1,'admin','2018-09-05 16:49:01','常用地址','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051649147231670','CD201809051644355282742','修改','2','/edit',2,'admin','2018-09-05 16:49:14','常用地址','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809051649377511418','CD201809051644355282742','删除','2','/delete',3,'admin','2018-09-05 16:49:37','常用地址','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052125269658739','COINSM201708241036442974134','客户管理','1','#',1,'admin','2018-09-05 21:25:26','业务管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052133110665681','CD201809052125269658739','会员查询','1','/user/customer.htm',1,'admin','2018-09-05 21:33:11','客户管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052134198039294','CD201809052125269658739','本地账户','1','/user/customerAccount.htm',2,'admin','2018-09-07 15:16:38','客户管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052134495702119','CD201809052125269658739','黑名单管理','1','/user/customerBlackList.htm',3,'admin','2018-09-05 21:34:49','客户管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052136114289655','COINSM201708241036442974134','渠道商管理','1','#',2,'admin','2018-09-05 21:36:11','业务管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052137218766831','CD201809052136114289655','渠道商管理','1','/user/channelDealer.htm',1,'admin','2018-09-05 21:37:21','渠道商管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052137489482816','COINSM201708241036442974134','OTC交易管理','1','#',3,'admin','2018-09-05 21:37:48','业务管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052138586862118','CD201809052137489482816','购买交易','1','/trade/buyTrade.htm',1,'admin','2018-09-05 21:38:58','OTC交易管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052140143284570','CD201809052137489482816',' 出售交易','1','/trade/saleTrade.htm',2,'admin','2018-09-08 15:55:39',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052141549247652','CD201809052137489482816','手续费管理','1','/trade/handsFee.htm',3,'admin','2018-09-05 21:41:54','OTC交易管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052142445109941','COINSM201708241036442974134','OTC订单管理','1','#',4,'admin','2018-09-05 21:42:44','业务管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052144306648932','CD201809052142445109941','进行中订单','1','/trade/underWayOrder.htm',1,'admin','2018-09-05 21:44:30','OTC订单管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052146488026384','CD201809052142445109941','已完成订单','1','/trade/finishOrder.htm',2,'admin','2018-09-05 21:46:48','OTC订单管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052147299071070','COINSM201708241036442974134','仲裁管理','1','#',5,'admin','2018-09-05 21:47:29','业务管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052148454144163','CD201809052147299071070','仲裁订单','1','/trade/arbitrationOrder.htm',1,'admin','2018-09-05 21:48:45','仲裁管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052150341693037','CD201809052147299071070','仲裁通知人','1','/trade/arbitrationNotifier.htm',2,'admin','2018-09-05 21:50:34','仲裁管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052150570498318','COINSM201708241036442974134','行情管理','1','#',6,'admin','2018-09-05 21:50:57','业务管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052156405923391','CD201809052150570498318','交易对管理','1','/quotation/tradePair.htm',1,'admin','2018-09-05 21:56:40','行情管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052158448858418','CD201809052150570498318','ETH行情','1','/quotation/quotationETH.htm',2,'admin','2018-09-05 21:58:44','行情管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052159397799817','CD201809052150570498318','BTC行情','1','/quotation/quotationBTC.htm',3,'admin','2018-09-05 21:59:39','行情管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052200116745385','CD201809052150570498318','X行情','1','/quotation/quotationX.htm',4,'admin','2018-09-05 22:00:11','行情管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052203136726234','CD201809052150570498318','法币汇率','1','/quotation/exchangeRate.htm',5,'admin','2018-09-05 22:03:13','行情管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052204145597575','COINSM201708241036442974134','币种管理','1','#',7,'admin','2018-09-05 22:04:14','业务管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052204528098194','CD201809052204145597575','币种管理','1','/biz/coin.htm',1,'admin','2018-09-08 17:57:22',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052205469178859','COINSM201708241036442974134','活动管理','1','#',8,'admin','2018-09-05 22:05:46','业务管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052207246843059','CD201809052205469178859','邀请好友','1','/activity/invitingFriends.htm',1,'admin','2018-09-05 22:07:24','活动管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052208211505928','CD201809052205469178859','邀请好友活动说明','1','/activity/invitingExplain.htm',2,'admin','2018-09-05 22:08:21','活动管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052213545525408','COINSM201708241036442974134','业务规则','1','#',9,'admin','2018-09-05 22:13:54','业务管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052214568823551','CD201809052213545525408','用户vip规则','1','/rules/userVipRules.htm',1,'admin','2018-09-05 22:14:56','业务规则','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052215472238157','CD201809052133110665681','账户查询','2','/accountQuery',1,'admin','2018-09-05 22:15:47','会员查询','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052216223529162','CD201809052133110665681','禁止登陆','2','/rock',2,'admin','2018-09-05 22:16:22','会员查询','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052216543742301','CD201809052133110665681','允许登陆','2','/active',3,'admin','2018-09-05 22:16:54','会员查询','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052223419907238','CD201809052133110665681','添加备注','2','/addRemark',4,'admin','2018-09-05 22:23:41','会员查询','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052223584803501','CD201809052133110665681','详情','2','/detail',5,'admin','2018-09-05 22:23:58','会员查询','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052239244044390','CD201809052137218766831','加盟','2','/add',1,'admin','2018-09-05 22:39:24','渠道商管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052240446795241','CD201809052137218766831','修改','2','/edit',2,'admin','2018-09-05 22:40:44','渠道商管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052242106997562','CD201809052137218766831','流水查询','2','/ledgerQuery',3,'admin','2018-09-05 22:42:10','渠道商管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052246070023047','CD201809052137218766831','查看下级','2','/lowerLevelQuery',4,'admin','2018-09-05 22:46:07','渠道商管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052254389624805','CD201809052137218766831','禁止登陆','2','/rock',5,'admin','2018-09-05 22:54:38','渠道商管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052255030234550','CD201809052137218766831','允许登陆','2','/active',6,'admin','2018-09-05 22:55:03','渠道商管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052255365644822','CD201809052137218766831','详情','2','/detail',7,'admin','2018-09-05 22:55:36','渠道商管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052303264695662','CD201809052134198039294','委托单查询','2','/entrustQuery',1,'admin','2018-09-05 23:03:26','本地账户','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052347082127121','CD201809052134198039294','流水查询','2','/ledgerQuery',2,'admin','2018-09-05 23:47:08','本地账户','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052348274836098','CD201809052134495702119','加入黑名单','2','/add',1,'admin','2018-09-05 23:48:27','黑名单管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052348579185573','CD201809052134495702119','移除黑名单','2','/delete',2,'admin','2018-09-05 23:48:57','黑名单管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052351043292064','CD201809052138586862118','卖给他','2','/toSell',1,'admin','2018-09-05 23:51:04','购买交易','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052351205649496','CD201809052138586862118','详情','2','/detail',2,'admin','2018-09-05 23:51:20','购买交易','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052352139457549','CD201809052140143284570','购买','2','/buy',1,'admin','2018-09-05 23:52:13','出售交易','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052352271164666','CD201809052140143284570','详情','2','/detail',2,'admin','2018-09-05 23:52:27','出售交易','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052352557113883','CD201809052141549247652','修改','2','/edit',1,'admin','2018-09-05 23:52:55','手续费管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052353390421859','CD201809052144306648932','详情','2','/detail',1,'admin','2018-09-05 23:53:39','进行中订单','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052353575279598','CD201809052146488026384','详情','2','/detail',1,'admin','2018-09-05 23:53:57','已完成订单','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052354357976401','CD201809052148454144163','处理订单','2','/resolve',1,'admin','2018-09-05 23:54:35','仲裁订单','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052354554913153','CD201809052148454144163','详情','2','/detail',2,'admin','2018-09-05 23:54:55','仲裁订单','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052355148785594','CD201809052150341693037','新增','2','/add',1,'admin','2018-09-05 23:55:14','仲裁通知人','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052355298787409','CD201809052150341693037','修改','2','/edit',2,'admin','2018-09-05 23:55:29','仲裁通知人','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052356195844721','CD201809052204528098194','新增发布','2','/add',1,'admin','2018-09-05 23:56:19','币种管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052356322561380','CD201809052204528098194','修改','2','/edit',2,'admin','2018-09-05 23:56:32','币种管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052357092924351','CD201809052204528098194','重新发布','2','/up',3,'admin','2018-09-05 23:57:09','币种管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052357312823409','CD201809052204528098194','撤下','2','/down',4,'admin','2018-09-05 23:57:31','币种管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052357440548999','CD201809052204528098194','详情','2','/detail',5,'admin','2018-09-05 23:57:44','币种管理','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809052358113583569','CD201809052207246843059','修改','2','/edit',1,'admin','2018-09-05 23:58:11','邀请好友','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809090138558681866','SM201711081421358326980','弃用','2','/dele',2,'admin','2018-09-09 01:38:55','ETH-提币地址','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809090139336681247','SM201711081421358326980BTC','弃用','2','/dele',2,'admin','2018-09-09 01:39:33','BTC-提币地址','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('CD201809101326097707550','COINSM2017121215543215610','测试','2','test',99,'研发人员','2018-09-10 13:37:13',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201612071021105964','COINSM201700000000000000','ETH财务管理','1','#',3,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201612071021105964BTC','COINSM201700000000000000','BTC财务管理','1','#',6,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201612071021105964TOKEN','COINSM201700000000000000','TOKEN财务管理','1','#',6,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201612071022206883','COINSM201612071021105964','外部账对账','1','#',5,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201612071022206883BTC','COINSM201612071021105964BTC','外部账对账','1','#',5,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201612071022206883TOKEN','COINSM201612071021105964TOKEN','外部账对账','1','#',5,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710225078473','COINSM201612071021105964','内部账对账','1','#',6,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710225078473BTC','COINSM201612071021105964BTC','内部账对账','1','#',6,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710225078473TOKEN','COINSM201612071021105964TOKEN','内部账对账','1','#',6,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710233232137','COINSM201612071021105964','平台账户','1','#',2,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710233232137BTC','COINSM201612071021105964BTC','平台账户','1','#',2,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710233232137TOKEN','COINSM201612071021105964TOKEN','平台账户','1','#',2,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710421392861','COINSM201612071022206883','充币对账','1','/finance/autoReconControl.htm',1,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710421392861BTC','COINSM201612071022206883BTC','充币对账','1','/BTC-finance/autoReconControl.htm',1,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710421392861TOKEN','COINSM201612071022206883TOKEN','充币对账','1','/TOKEN-finance/autoReconControl.htm',1,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710443551388','COINSM201612071022206883','提币对账','1','/finance/roughHand.htm',2,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710443551388BTC','COINSM201612071022206883BTC','提币对账','1','/BTC-finance/roughHand.htm',2,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710443551388TOKEN','COINSM201612071022206883TOKEN','提币对账','1','/TOKEN-finance/roughHand.htm',2,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710470696888','COINSM2016120710225078473','买入对账','1','/finance/twoRoll.htm',1,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710470696888BTC','COINSM2016120710225078473BTC','买入对账','1','/BTC-finance/twoRoll.htm',1,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710470696888TOKEN','COINSM2016120710225078473TOKEN','买入对账','1','/TOKEN-finance/twoRoll.htm',1,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710484209132','COINSM2016120710225078473','卖出对账','1','/finance/inRoughHand.htm',2,'admin','2018-09-08 08:27:09','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710484209132BTC','COINSM2016120710225078473BTC','卖出对账','1','/BTC-finance/inRoughHand.htm',2,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710484209132TOKEN','COINSM2016120710225078473TOKEN','卖出对账','1','/TOKEN-finance/inRoughHand.htm',2,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710583381112','COINSM2016120710233232137','平台账户','1','/finance/breakBalance.htm',1,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710583381112BTC','COINSM2016120710233232137BTC','平台账户','1','/BTC-finance/breakBalance.htm',1,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120710583381112TOKEN','COINSM2016120710233232137TOKEN','平台账户','1','/TOKEN-finance/breakBalance.htm',1,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120711021944714','COINSM201707251143314118180','线下充值','1','/finance/offlineRecharge.htm',1,'admin','2018-09-08 22:54:15',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120711021944714BTC','COINSM201707251143314118180BTC','线下充值','1','/BTC-finance/offlineRecharge.htm',1,'admin','2018-09-08 22:54:30',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120711021944714TOKEN','COINSM201707251143314118180TOKEN','线下充值','1','/TOKEN-finance/offlineRecharge.htm',1,'admin','2018-09-08 22:54:42',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120816125733948','COINSM2016120710421392861','对账','2','/edit',1,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120816125733948BTC','COINSM2016120710421392861BTC','对账','2','/edit',1,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120816125733948TOKEN','COINSM2016120710421392861TOKEN','对账','2','/edit',1,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120816133940523','COINSM2016120710421392861','详情','2','/detail',2,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120816133940523BTC','COINSM2016120710421392861BTC','详情','2','/detail',2,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120816133940523TOKEN','COINSM2016120710421392861TOKEN','详情','2','/detail',2,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120911033945882','COINSM2016120710443551388','对账','2','/edit',1,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120911033945882BTC','COINSM2016120710443551388BTC','对账','2','/edit',1,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120911033945882TOKEN','COINSM2016120710443551388TOKEN','对账','2','/edit',1,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120911042060088','COINSM2016120710443551388','详情','2','/detail',2,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120911042060088BTC','COINSM2016120710443551388BTC','详情','2','/detail',2,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120911042060088TOKEN','COINSM2016120710443551388TOKEN','详情','2','/detail',2,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201612091114505291','COINSM2016120710470696888','对账','2','/edit',1,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201612091114505291BTC','COINSM2016120710470696888BTC','对账','2','/edit',1,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201612091114505291TOKEN','COINSM2016120710470696888TOKEN','对账','2','/edit',1,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120911160661084','COINSM2016120710470696888','详情','2','/detail',2,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120911160661084BTC','COINSM2016120710470696888BTC','详情','2','/detail',2,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120911160661084TOKEN','COINSM2016120710470696888TOKEN','详情','2','/detail',2,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120911293120195','COINSM2016120710484209132','对账','2','/edit',1,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120911293120195BTC','COINSM2016120710484209132BTC','对账','2','/edit',1,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120911293120195TOKEN','COINSM2016120710484209132TOKEN','对账','2','/edit',1,'admin','2018-09-08 08:27:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120911301231346','COINSM2016120710484209132','详情','2','/detail',2,'admin','2018-09-08 08:27:11','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120911301231346BTC','COINSM2016120710484209132BTC','详情','2','/detail',2,'admin','2018-09-08 08:27:11','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016120911301231346TOKEN','COINSM2016120710484209132TOKEN','详情','2','/detail',2,'admin','2018-09-08 08:27:11','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016122219590218515','COINSM2016120710470696888','导出','2','/export',9,'admin','2018-09-08 08:27:11','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016122219590218515BTC','COINSM2016120710470696888BTC','导出','2','/export',9,'admin','2018-09-08 08:27:11','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016122219590218515TOKEN','COINSM2016120710470696888TOKEN','导出','2','/export',9,'admin','2018-09-08 08:27:11','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016122220000572417','COINSM2016120710484209132','导出','2','/export',9,'admin','2018-09-08 08:27:11','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016122220000572417BTC','COINSM2016120710484209132BTC','导出','2','/export',9,'admin','2018-09-08 08:27:11','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016122220000572417TOKEN','COINSM2016120710484209132TOKEN','导出','2','/export',9,'admin','2018-09-08 08:27:11','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016122317321369746','COINSM2016120711021944714','代申请','2','/add',1,'admin','2018-09-08 08:27:11','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016122317321369746BTC','COINSM2016120711021944714BTC','代申请','2','/add',1,'admin','2018-09-08 08:27:11','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016122317321369746TOKEN','COINSM2016120711021944714TOKEN','代申请','2','/add',1,'admin','2018-09-08 08:27:11','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016122413510161245','COINSM2016120711021944714','审核','2','/check',2,'admin','2018-09-08 08:27:11','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016122413510161245BTC','COINSM2016120711021944714BTC','审核','2','/check',2,'admin','2018-09-08 08:27:11','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2016122413510161245TOKEN','COINSM2016120711021944714TOKEN','审核','2','/check',2,'admin','2018-09-08 08:27:11','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201700000000000000','','根目录','1','#',1,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201700001000000001','COINSM201700000000000000','系统管理','1','#',1,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201700001000000002','COINSM201700001000000001','运维管理','1','#',2,'admin','2018-09-05 10:10:04',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201700001000000003','COINSM201700001000000002','菜单管理','1','/system/menu.htm',1,'admin','2018-09-05 10:10:04',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201700001000000004','COINSM201700001000000003','新增','2','/add',1,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017032911200961325','COINSM201700001000000003','修改','2','/edit',2,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017033020005366333','COINSM201707251006045006005','banner管理','1','/public/banner.htm',1,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017033020015631166','COINSM2017033020005366333','新增','2','/add',1,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017033020021094115','COINSM2017033020005366333','修改','2','/edit',2,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017033020022649991','COINSM2017033020005366333','删除','2','/delete',3,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017033020024827112','COINSM2017033020005366333','详情','2','/detail',4,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201707251006045006005','COINSM201700001000000001','广告位管理','1','#',5,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201707251143314118180','COINSM201612071021105964','充币管理','1','#',3,'admin','2018-09-08 15:20:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201707251143314118180BTC','COINSM201612071021105964BTC','充币管理','1','#',3,'admin','2018-09-08 15:20:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201707251143314118180TOKEN','COINSM201612071021105964TOKEN','充币管理','1','#',3,'admin','2018-09-08 15:20:10','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201707251148117352030','COINSM201707251143314118180','充值查询','1','/finance/offlineRechargeQuery.htm',2,'admin','2018-09-08 15:26:43','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201707251148117352030BTC','COINSM201707251143314118180BTC','充值查询','1','/BTC-finance/offlineRechargeQuery.htm',2,'admin','2018-09-08 15:26:43','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201707251148117352030TOKEN','COINSM201707251143314118180TOKEN','充值查询','1','/BTC-finance/offlineRechargeQuery.htm',2,'admin','2018-09-08 15:26:43','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201707251331497821971','COINSM201707251148117352030','导出','2','/export',5,'admin','2018-03-29 06:45:23','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201707251331497821971BTC','COINSM201707251148117352030BTC','导出','2','/export',5,'admin','2018-03-29 06:45:23','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201707251331497821971TOKEN','COINSM201707251148117352030TOKEN','导出','2','/export',5,'admin','2018-03-29 06:45:23','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201708241024194086655','COINSM201700001000000003','删除','2','/delete',3,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201708241036442974134','COINSM201700000000000000','业务管理','1','#',2,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM201708241037322072730','COINSM201700000000000000','统计分析','1','#',9,'admin','2018-09-08 16:34:58',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017101716241339082','COINSM201700001000000001','运营管理','1','#',1,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017101716253866426','COINSM2017101716241339082','角色管理','1','/system/role.htm',1,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017101716261754674','COINSM2017101716241339082','用户管理','1','/system/user.htm',2,'admin','2018-09-08 15:50:47',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017101716450533995','COINSM2017101716253866426','分配菜单','2','/change',4,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017101717551955993','COINSM2017101716253866426','新增','2','/add',1,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017101717560118734','COINSM2017101716253866426','修改','2','/edit',2,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017101717563661357','COINSM2017101716253866426','删除','2','/delete',3,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017101719082391126','COINSM2017101716261754674','新增','2','/add',1,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017101719094151894','COINSM2017101716261754674','重置密码','2','/reset',2,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017101719100760088','COINSM2017101716261754674','激活 / 注销','2','/rock',4,'admin','2018-09-08 15:49:20',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017101719110981215','COINSM2017101716261754674','设置角色','2','/assign',5,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017112911152991684','COINSM201700001000000001','消息推送','1','#',3,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017112911280249973','COINSM2017112911152991684','公告管理','1','/public/notice.htm',1,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017112914292031228','COINSM2017112911280249973','新增','2','/add',1,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017112914295002950','COINSM2017112911280249973','修改','2','/edit2',2,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017112914322481897','COINSM2017112911280249973','发布/撤下','2','/push',3,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017112914325471772','COINSM2017112911280249973','详情','2','/detail',5,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017121215543215610','COINSM201700001000000001','文章管理','1','#',4,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('COINSM2017121216045274832','COINSM2017121215543215610','关于我们','1','/public/aboutus_addedit.htm',1,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081400404895487','SM201711081111547852084','修改','2','/edit',1,'admin','2018-09-08 08:30:18','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081404308124201','COINSM201612071021105964','会员账户','1','#',2,'admin','2018-09-08 08:30:18','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081404308124201BTC','COINSM201612071021105964BTC','会员账户','1','#',2,'admin','2018-09-08 08:30:18','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081404308124201TOKEN','COINSM201612071021105964TOKEN','会员账户','1','#',2,'admin','2018-09-08 08:30:18','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081409307984995','SM201711081404308124201','分发地址','1','/finance/diviAddress.htm',1,'admin','2018-09-08 08:30:18','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081409307984995BTC','SM201711081404308124201BTC','分发地址','1','/BTC-finance/diviAddress.htm',1,'admin','2018-09-08 08:30:18','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081409307984995TOKEN','SM201711081404308124201TOKEN','分发地址','1','/TOKEN-finance/diviAddress.htm',1,'admin','2018-09-08 08:30:18','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081410356859335','SM201711081409307984995','流水查询','2','/diviLedger',1,'admin','2018-09-08 08:30:18','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081416278853402','COINSM201612071021105964','提币管理','1','#',3,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081416278853402BTC','COINSM201612071021105964BTC','提币管理','1','#',3,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081416278853402TOKEN','COINSM201612071021105964TOKEN','提币管理','1','#',3,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081421358326980','SM201711081416278853402','提币地址','1','/finance/TBAddress.htm',2,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081421358326980BTC','SM201711081416278853402BTC','提币地址','1','/BTC-finance/TBAddress.htm',2,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081421358326980TOKEN','SM201711081416278853402TOKEN','提币地址','1','/TOKEN-finance/TBAddress.htm',2,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081423308601904','SM201711081421358326980','生成','2','/add',1,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081423308601904BTC','SM201711081421358326980BTC','生成','2','/add',1,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081423308601904TOKEN','SM201711081421358326980TOKEN','生成','2','/add',1,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081424358887020','SM201711081416278853402','线下提币','1','/finance/TBunderline.htm',3,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081424358887020BTC','SM201711081416278853402BTC','线下提币','1','/BTC-finance/TBunderline.htm',3,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081424358887020TOKEN','SM201711081416278853402TOKEN','线下提币','1','/TOKEN-finance/TBunderline.htm',3,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081426026276170','SM201711081424358887020','批量审核','2','/multiCheck',2,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081426026276170BTC','SM201711081424358887020BTC','批量审核','2','/multiCheck',2,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081426026276170TOKEN','SM201711081424358887020TOKEN','批量审核','2','/multiCheck',2,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081426421228978','SM201711081424358887020','提币广播','2','/sp',3,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081426421228978BTC','SM201711081424358887020BTC','提币广播','2','/sp',3,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081426421228978TOKEN','SM201711081424358887020TOKEN','提币广播','2','/sp',3,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081431005882968','COINSM201612071021105964','归集管理','1','#',4,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081431005882968BTC','COINSM201612071021105964BTC','归集管理','1','#',4,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081431005882968TOKEN','COINSM201612071021105964TOKEN','归集管理','1','#',4,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081436354534709','SM201711081431005882968','归集地址','1','/finance/GJAddress.htm',2,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081436354534709BTC','SM201711081431005882968BTC','归集地址','1','/BTC-finance/GJAddress.htm',2,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081436354534709TOKEN','SM201711081431005882968TOKEN','归集地址','1','/TOKEN-finance/GJAddress.htm',2,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081437069726688','SM201711081436354534709','新增','2','/add',1,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081437069726688BTC','SM201711081436354534709BTC','新增','2','/add',1,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081437069726688TOKEN','SM201711081436354534709TOKEN','新增','2','/add',1,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081437452861020','SM201711081436354534709','弃用','2','/dele',2,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081437452861020BTC','SM201711081436354534709BTC','弃用','2','/dele',2,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081437452861020TOKEN','SM201711081436354534709TOKEN','弃用','2','/dele',2,'admin','2018-09-08 08:30:19','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081442278817722','SM201711081431005882968','归集查询','1','/finance/GJQuery.htm',3,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081442278817722BTC','SM201711081431005882968BTC','归集查询','1','/BTC-finance/GJQuery.htm',3,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081442278817722TOKEN','SM201711081431005882968TOKEN','归集查询','1','/TOKEN-finance/GJQuery.htm',3,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081444203473881','SM201711081442278817722','详情','2','/detail',2,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081444203473881BTC','SM201711081442278817722BTC','详情','2','/detail',2,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711081444203473881TOKEN','SM201711081442278817722TOKEN','详情','2','/detail',2,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711091113070529521','COINSM201612071021105964','不平账处理','1','#',6,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711091113070529521BTC','COINSM201612071021105964BTC','不平账处理','1','#',6,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711091113070529521TOKEN','COINSM201612071021105964TOKEN','不平账处理','1','#',6,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711091346241039616','SM201711091113070529521','不平账处理','1','/finance/unfairOutAccount.htm',1,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711091346241039616BTC','SM201711091113070529521BTC','不平账处理','1','/BTC-finance/unfairOutAccount.htm',1,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711091346241039616TOKEN','SM201711091113070529521TOKEN','不平账处理','1','/TOKEN-finance/unfairOutAccount.htm',1,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711091347287638130','SM201711091346241039616','审核','2','/exam',1,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711091347287638130BTC','SM201711091346241039616BTC','审核','2','/exam',1,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711091347287638130TOKEN','SM201711091346241039616TOKEN','审核','2','/exam',1,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711091347562977987','SM201711091346241039616','详情','2','/detail',2,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711091347562977987BTC','SM201711091346241039616BTC','详情','2','/detail',2,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711091347562977987TOKEN','SM201711091346241039616TOKEN','详情','2','/detail',2,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711091348223364368','SM201711091346241039616','导出','2','/export',3,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711091348223364368BTC','SM201711091346241039616BTC','导出','2','/export',3,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711091348223364368TOKEN','SM201711091346241039616TOKEN','导出','2','/export',3,'admin','2018-09-08 08:30:20','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711181220013316605','COINSM2017121215543215610','注册协议','1','/public/register_addedit.htm',5,'admin','2018-09-05 10:10:04','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711231353203735078','COINSM2017121215543215610','购买广告说明','1','/public/buyADS.htm',6,'admin','2018-09-05 10:10:05','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711231354531532054','COINSM2017121215543215610','卖币广告说明','1','/public/sellETH.htm',7,'admin','2018-09-05 10:10:05','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711232222591772487','SM201711231353203735078','修改','2','/edit',1,'admin','2018-09-05 10:10:05','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711232223319261758','SM201711231354531532054','修改','2','/edit',1,'admin','2018-09-05 10:10:05','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711251639118496237','COINSM2017121215543215610','交易提醒说明','1','/public/TransactionRemind.htm',75,'admin','2018-09-05 10:10:05','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711251639362545256','SM201711251639118496237','修改','2','/edit',1,'admin','2018-09-05 10:10:05','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711272034567989636','COINSM2017121215543215610','联系客服','1','/public/service_addedit.htm',16,'admin','2018-09-05 10:10:05','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711281438072475181','COINSM201700001000000001','版本管理','1','#',22,'admin','2018-09-05 10:10:05','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711281440352206679','SM201711281438072475181','Android版本管理','1','/edition/versionAc.htm',1,'admin','2018-09-05 10:10:05','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711281440497751340','SM201711281440352206679','修改','2','/edit',1,'admin','2018-09-05 10:10:05','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711281441276181084','SM201711281438072475181','IOS版本管理','1','/edition/versionIc.htm',2,'admin','2018-09-05 10:10:05','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201711281442162104491','SM201711281441276181084','修改','2','/edit',1,'admin','2018-09-05 10:10:05','','CD-HPMN000024');
INSERT INTO `tsys_menu` (`code`,`parent_code`,`name`,`type`,`url`,`order_no`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES ('SM201801020529137343821','COINSM2017121215543215610','隐私政策','1','/public/privacy_addedit.htm',2,'admin','2018-09-05 10:10:05','','CD-HPMN000024');


/*
-- Query: SELECT * FROM ogc_standard.tsys_menu_role
LIMIT 0, 1000

-- Date: 2018-09-09 01:23
*/
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (75,'JS201809041727442529132','CD201809051138275949411','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (76,'JS201809041727442529132','CD201809051139090202930','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (77,'JS201809041727442529132','CD201809051141221304241','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (78,'JS201809041727442529132','CD201809051145106035833','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (79,'JS201809041727442529132','CD201809051145479875640','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (80,'JS201809041727442529132','CD201809051146229553417','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (81,'JS201809041727442529132','CD201809051405551042344','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (82,'JS201809041727442529132','CD201809051409392095134','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (83,'JS201809041727442529132','COINSM201700000000000000','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (84,'JS201809041727442529132','CD201809051138479045380','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (85,'JS201809041727442529132','CD201809051142438202544','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (86,'JS201809041727442529132','CD201809051408294987523','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (87,'JS201809041727442529132','CD201809051411328471714','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (88,'JS201809041727442529132','CD201809051124053591570','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (89,'JS201809041727442529132','CD201809051124265397662','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (90,'JS201809041727442529132','CD201809051146413078008','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (91,'JS201809041727442529132','CD201809051413379489376','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (92,'JS201809041727442529132','CD201809051418047274499','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (93,'JS201809041727442529132','CD201809051418316285274','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (94,'JS201809041727442529132','CD201809051607238198144','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (95,'JS201809041727442529132','CD201809051608052906869','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (96,'JS201809041727442529132','CD201809051608218214579','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (97,'JS201809041727442529132','CD201809051619207985545','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (98,'JS201809041727442529132','CD201809051634466196190','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (99,'JS201809041727442529132','CD201809051635112754986','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (100,'JS201809041727442529132','CD201809051637146977544','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (101,'JS201809041727442529132','CD201809051637362238648','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (102,'JS201809041727442529132','CD201809051638035551653','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (103,'JS201809041727442529132','CD201809051405155191464','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (104,'JS201809041727442529132','CD201809051639483257564','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (105,'JS201809041727442529132','CD201809051641034004212','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (106,'JS201809041727442529132','CD201809051644355282742','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (107,'JS201809041727442529132','CD201809051649013452399','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (108,'JS201809041727442529132','CD201809051649147231670','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (109,'JS201809041727442529132','CD201809051649377511418','admin','2018-09-05 16:49:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (945,'COINSR201700000000000000','CD201809052125269658739','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (946,'COINSR201700000000000000','CD201809052133110665681','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (947,'COINSR201700000000000000','CD201809052137218766831','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (948,'COINSR201700000000000000','CD201809052138586862118','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (949,'COINSR201700000000000000','CD201809052144306648932','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (950,'COINSR201700000000000000','CD201809052148454144163','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (951,'COINSR201700000000000000','CD201809052156405923391','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (952,'COINSR201700000000000000','CD201809052204528098194','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (953,'COINSR201700000000000000','CD201809052207246843059','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (954,'COINSR201700000000000000','CD201809052214568823551','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (955,'COINSR201700000000000000','CD201809052215472238157','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (956,'COINSR201700000000000000','CD201809052239244044390','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (957,'COINSR201700000000000000','CD201809052303264695662','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (958,'COINSR201700000000000000','CD201809052348274836098','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (959,'COINSR201700000000000000','CD201809052351043292064','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (960,'COINSR201700000000000000','CD201809052352139457549','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (961,'COINSR201700000000000000','CD201809052352557113883','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (962,'COINSR201700000000000000','CD201809052353390421859','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (963,'COINSR201700000000000000','CD201809052353575279598','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (964,'COINSR201700000000000000','CD201809052354357976401','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (965,'COINSR201700000000000000','CD201809052355148785594','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (966,'COINSR201700000000000000','CD201809052356195844721','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (967,'COINSR201700000000000000','CD201809052358113583569','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (968,'COINSR201700000000000000','COINSM2016120710421392861','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (969,'COINSR201700000000000000','COINSM2016120710421392861BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (970,'COINSR201700000000000000','COINSM2016120710470696888','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (971,'COINSR201700000000000000','COINSM2016120710470696888BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (972,'COINSR201700000000000000','COINSM2016120710583381112','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (973,'COINSR201700000000000000','COINSM2016120710583381112BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (974,'COINSR201700000000000000','COINSM2016120711021944714','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (975,'COINSR201700000000000000','COINSM2016120711021944714BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (976,'COINSR201700000000000000','COINSM2016120816125733948','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (977,'COINSR201700000000000000','COINSM2016120816125733948BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (978,'COINSR201700000000000000','COINSM2016120911033945882','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (979,'COINSR201700000000000000','COINSM2016120911033945882BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (980,'COINSR201700000000000000','COINSM201612091114505291','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (981,'COINSR201700000000000000','COINSM201612091114505291BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (982,'COINSR201700000000000000','COINSM2016120911293120195','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (983,'COINSR201700000000000000','COINSM2016120911293120195BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (984,'COINSR201700000000000000','COINSM2016122317321369746','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (985,'COINSR201700000000000000','COINSM2016122317321369746BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (986,'COINSR201700000000000000','COINSM201700000000000000','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (987,'COINSR201700000000000000','COINSM201700001000000001','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (988,'COINSR201700000000000000','COINSM201700001000000003','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (989,'COINSR201700000000000000','COINSM201700001000000004','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (990,'COINSR201700000000000000','COINSM2017033020005366333','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (991,'COINSR201700000000000000','COINSM2017033020015631166','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (992,'COINSR201700000000000000','COINSM2017101716241339082','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (993,'COINSR201700000000000000','COINSM2017101716253866426','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (994,'COINSR201700000000000000','COINSM2017101717551955993','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (995,'COINSR201700000000000000','COINSM2017101719082391126','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (996,'COINSR201700000000000000','COINSM2017112911280249973','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (997,'COINSR201700000000000000','COINSM2017112914292031228','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (998,'COINSR201700000000000000','COINSM2017121216045274832','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (999,'COINSR201700000000000000','SM201711081409307984995','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1000,'COINSR201700000000000000','SM201711081409307984995BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1001,'COINSR201700000000000000','SM201711081410356859335','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1002,'COINSR201700000000000000','SM201711081423308601904','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1003,'COINSR201700000000000000','SM201711081423308601904BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1004,'COINSR201700000000000000','SM201711081437069726688','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1005,'COINSR201700000000000000','SM201711081437069726688BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1006,'COINSR201700000000000000','SM201711091346241039616','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1007,'COINSR201700000000000000','SM201711091346241039616BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1008,'COINSR201700000000000000','SM201711091347287638130','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1009,'COINSR201700000000000000','SM201711091347287638130BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1010,'COINSR201700000000000000','SM201711232222591772487','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1011,'COINSR201700000000000000','SM201711232223319261758','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1012,'COINSR201700000000000000','SM201711251639362545256','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1013,'COINSR201700000000000000','SM201711281440352206679','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1014,'COINSR201700000000000000','SM201711281440497751340','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1015,'COINSR201700000000000000','SM201711281442162104491','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1016,'COINSR201700000000000000','CD201809052134198039294','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1017,'COINSR201700000000000000','CD201809052136114289655','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1018,'COINSR201700000000000000','CD201809052140143284570','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1019,'COINSR201700000000000000','CD201809052146488026384','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1020,'COINSR201700000000000000','CD201809052150341693037','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1021,'COINSR201700000000000000','CD201809052158448858418','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1022,'COINSR201700000000000000','CD201809052208211505928','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1023,'COINSR201700000000000000','CD201809052216223529162','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1024,'COINSR201700000000000000','CD201809052240446795241','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1025,'COINSR201700000000000000','CD201809052347082127121','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1026,'COINSR201700000000000000','CD201809052348579185573','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1027,'COINSR201700000000000000','CD201809052351205649496','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1028,'COINSR201700000000000000','CD201809052352271164666','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1029,'COINSR201700000000000000','CD201809052354554913153','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1030,'COINSR201700000000000000','CD201809052355298787409','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1031,'COINSR201700000000000000','CD201809052356322561380','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1032,'COINSR201700000000000000','COINSM2016120710233232137','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1033,'COINSR201700000000000000','COINSM2016120710233232137BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1034,'COINSR201700000000000000','COINSM2016120710443551388','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1035,'COINSR201700000000000000','COINSM2016120710443551388BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1036,'COINSR201700000000000000','COINSM2016120710484209132','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1037,'COINSR201700000000000000','COINSM2016120710484209132BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1038,'COINSR201700000000000000','COINSM2016120816133940523','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1039,'COINSR201700000000000000','COINSM2016120816133940523BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1040,'COINSR201700000000000000','COINSM2016120911042060088','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1041,'COINSR201700000000000000','COINSM2016120911042060088BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1042,'COINSR201700000000000000','COINSM2016120911160661084','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1043,'COINSR201700000000000000','COINSM2016120911160661084BTC','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1044,'COINSR201700000000000000','COINSM2016120911301231346','admin','2018-09-08 23:30:52',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1045,'COINSR201700000000000000','COINSM2016120911301231346BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1046,'COINSR201700000000000000','COINSM2016122413510161245','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1047,'COINSR201700000000000000','COINSM2016122413510161245BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1048,'COINSR201700000000000000','COINSM201700001000000002','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1049,'COINSR201700000000000000','COINSM2017032911200961325','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1050,'COINSR201700000000000000','COINSM2017033020021094115','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1051,'COINSR201700000000000000','COINSM201708241036442974134','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1052,'COINSR201700000000000000','COINSM2017101716261754674','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1053,'COINSR201700000000000000','COINSM2017101717560118734','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1054,'COINSR201700000000000000','COINSM2017101719094151894','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1055,'COINSR201700000000000000','COINSM2017112914295002950','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1056,'COINSR201700000000000000','SM201711081404308124201','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1057,'COINSR201700000000000000','SM201711081404308124201BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1058,'COINSR201700000000000000','SM201711081421358326980','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1059,'COINSR201700000000000000','SM201711081421358326980BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1060,'COINSR201700000000000000','SM201711081426026276170','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1061,'COINSR201700000000000000','SM201711081426026276170BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1062,'COINSR201700000000000000','SM201711081436354534709','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1063,'COINSR201700000000000000','SM201711081436354534709BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1064,'COINSR201700000000000000','SM201711081437452861020','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1065,'COINSR201700000000000000','SM201711081437452861020BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1066,'COINSR201700000000000000','SM201711081444203473881','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1067,'COINSR201700000000000000','SM201711081444203473881BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1068,'COINSR201700000000000000','SM201711091347562977987','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1069,'COINSR201700000000000000','SM201711091347562977987BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1070,'COINSR201700000000000000','SM201711281441276181084','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1071,'COINSR201700000000000000','SM201801020529137343821','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1072,'COINSR201700000000000000','CD201809052134495702119','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1073,'COINSR201700000000000000','CD201809052137489482816','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1074,'COINSR201700000000000000','CD201809052141549247652','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1075,'COINSR201700000000000000','CD201809052159397799817','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1076,'COINSR201700000000000000','CD201809052216543742301','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1077,'COINSR201700000000000000','CD201809052242106997562','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1078,'COINSR201700000000000000','CD201809052357092924351','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1079,'COINSR201700000000000000','COINSM201612071021105964','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1080,'COINSR201700000000000000','COINSM2017033020022649991','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1081,'COINSR201700000000000000','COINSM201707251143314118180','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1082,'COINSR201700000000000000','COINSM201707251143314118180BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1083,'COINSR201700000000000000','COINSM201708241024194086655','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1084,'COINSR201700000000000000','COINSM2017101717563661357','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1085,'COINSR201700000000000000','COINSM2017112911152991684','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1086,'COINSR201700000000000000','COINSM2017112914322481897','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1087,'COINSR201700000000000000','SM201711081416278853402','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1088,'COINSR201700000000000000','SM201711081416278853402BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1089,'COINSR201700000000000000','SM201711081424358887020','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1090,'COINSR201700000000000000','SM201711081424358887020BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1091,'COINSR201700000000000000','SM201711081426421228978','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1092,'COINSR201700000000000000','SM201711081426421228978BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1093,'COINSR201700000000000000','SM201711081442278817722','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1094,'COINSR201700000000000000','SM201711081442278817722BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1095,'COINSR201700000000000000','SM201711091348223364368','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1096,'COINSR201700000000000000','SM201711091348223364368BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1097,'COINSR201700000000000000','CD201809052142445109941','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1098,'COINSR201700000000000000','CD201809052200116745385','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1099,'COINSR201700000000000000','CD201809052223419907238','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1100,'COINSR201700000000000000','CD201809052246070023047','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1101,'COINSR201700000000000000','CD201809052357312823409','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1102,'COINSR201700000000000000','COINSM2017033020024827112','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1103,'COINSR201700000000000000','COINSM2017101716450533995','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1104,'COINSR201700000000000000','COINSM2017101719100760088','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1105,'COINSR201700000000000000','COINSM2017121215543215610','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1106,'COINSR201700000000000000','SM201711081431005882968','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1107,'COINSR201700000000000000','SM201711081431005882968BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1108,'COINSR201700000000000000','CD201809052147299071070','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1109,'COINSR201700000000000000','CD201809052203136726234','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1110,'COINSR201700000000000000','CD201809052223584803501','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1111,'COINSR201700000000000000','CD201809052254389624805','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1112,'COINSR201700000000000000','CD201809052357440548999','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1113,'COINSR201700000000000000','COINSM201612071022206883','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1114,'COINSR201700000000000000','COINSM201612071022206883BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1115,'COINSR201700000000000000','COINSM201707251006045006005','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1116,'COINSR201700000000000000','COINSM2017101719110981215','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1117,'COINSR201700000000000000','COINSM2017112914325471772','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1118,'COINSR201700000000000000','SM201711181220013316605','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1119,'COINSR201700000000000000','CD201809052150570498318','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1120,'COINSR201700000000000000','CD201809052255030234550','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1121,'COINSR201700000000000000','COINSM201612071021105964BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1122,'COINSR201700000000000000','COINSM2016120710225078473','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1123,'COINSR201700000000000000','COINSM2016120710225078473BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1124,'COINSR201700000000000000','SM201711091113070529521','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1125,'COINSR201700000000000000','SM201711091113070529521BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1126,'COINSR201700000000000000','SM201711231353203735078','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1127,'COINSR201700000000000000','CD201809052204145597575','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1128,'COINSR201700000000000000','CD201809052255365644822','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1129,'COINSR201700000000000000','SM201711231354531532054','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1130,'COINSR201700000000000000','CD201809052205469178859','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1131,'COINSR201700000000000000','CD201809052213545525408','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1132,'COINSR201700000000000000','COINSM2016122219590218515','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1133,'COINSR201700000000000000','COINSM2016122219590218515BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1134,'COINSR201700000000000000','COINSM2016122220000572417','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1135,'COINSR201700000000000000','COINSM2016122220000572417BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1136,'COINSR201700000000000000','COINSM201708241037322072730','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1137,'COINSR201700000000000000','SM201711272034567989636','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1138,'COINSR201700000000000000','SM201711281438072475181','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1139,'COINSR201700000000000000','SM201711251639118496237','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1140,'COINSR201700000000000000','COINSM201707251148117352030','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1141,'COINSR201700000000000000','COINSM201707251331497821971','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1142,'COINSR201700000000000000','COINSM201707251148117352030BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');
INSERT INTO `tsys_menu_role` (`id`,`role_code`,`menu_code`,`updater`,`update_datetime`,`remark`,`system_code`) VALUES (1143,'COINSR201700000000000000','COINSM201707251331497821971BTC','admin','2018-09-08 23:30:53',NULL,'CD-HPMN000024');

/*
-- Query: SELECT * FROM ogc_standard.tsys_config
LIMIT 0, 1000

-- Date: 2018-09-10 13:48
*/
INSERT INTO `tsys_config` (`id`,`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`) VALUES (1,'trade_rule','activity_trade_fee_rate','-1','admin','2018-09-08 22:49:39','活动期间交易手续费率，小于0表示关闭活动');
INSERT INTO `tsys_config` (`id`,`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`) VALUES (5,'qiniu','qiniu_access_key','Dc0pMP8ImFm78-uk4iGsOPpB2-vHc64D07OsOQVi','admin','2018-09-06 08:10:58','七牛云key1');
INSERT INTO `tsys_config` (`id`,`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`) VALUES (6,'qiniu','qiniu_secret_key','3NP-tpZP9-5fH-R-FhvKTfYpPPVFNvjFF3JXmrcq','admin','2018-09-06 08:10:58','七牛云key1');
INSERT INTO `tsys_config` (`id`,`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`) VALUES (7,'qiniu','qiniu_bucket','test','admin','2018-09-06 08:10:58','存储空间');
INSERT INTO `tsys_config` (`id`,`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`) VALUES (8,'qiniu','qiniu_domain','ounm8iw2d.bkt.clouddn.com','admin','2018-09-06 08:10:58','访问域名');
INSERT INTO `tsys_config` (`id`,`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`) VALUES (9,'user_rate','default_user_trade_rate','0','admin','2018-09-07 00:00:00','初始用户广告费率');
INSERT INTO `tsys_config` (`id`,`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`) VALUES (10,'coin_price_x','eth_coin_price_x','10','admin','2018-09-08 00:00:00','eth价格计算x');
INSERT INTO `tsys_config` (`id`,`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`) VALUES (11,'coin_price_x','btc_coin_price_x','5000','admin','2018-09-08 00:00:00','bec价格计算x');
INSERT INTO `tsys_config` (`id`,`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`) VALUES (12,'coin_price_x','hpm_coin_price_x','0','admin','2018-09-08 00:00:00','hpm价格计算x');
INSERT INTO `tsys_config` (`id`,`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`) VALUES (13,'coin_type','0','BTC','admin','2018-09-08 00:00:00','比特币');
INSERT INTO `tsys_config` (`id`,`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`) VALUES (14,'coin_type','1','ETH','admin','2018-09-08 00:00:00','以太坊');
INSERT INTO `tsys_config` (`id`,`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`) VALUES (15,'coin_type','0T','HPM','admin','2018-09-08 00:00:00','x币');
INSERT INTO `tsys_config` (`id`,`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`) VALUES (16,'coin_status','0','已发布','admin','2018-09-08 00:00:00','币种状态');
INSERT INTO `tsys_config` (`id`,`type`,`ckey`,`cvalue`,`updater`,`update_datetime`,`remark`) VALUES (17,'coin_status','1','已撤下','admin','2018-09-09 00:00:00','币种状态');

/*
-- Query: SELECT * FROM ogc_standard.tsys_dict
LIMIT 0, 1000

-- Date: 2018-09-09 01:11
*/
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (1,'0',NULL,'1','1','tao','2018-08-23 13:39:07',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (2,'0',NULL,'2','1','tao','2018-08-23 14:23:30',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (3,'0',NULL,'role_level','角色等级','admin','2018-09-04 09:26:14',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (4,'1','role_level','1','运维','admin','2018-09-04 09:26:14',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (5,'1','role_level','2','运营','admin','2018-09-04 09:26:14',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (6,'1','role_level','3','客户','admin','2018-09-04 09:26:14',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (7,'0',NULL,'user_status','用户状态','admin','2018-09-04 09:47:08',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (8,'1','user_status','0','正常','admin','2018-09-04 09:47:08',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (9,'1','user_status','1','程序锁定','admin','2018-09-04 09:47:09',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (10,'1','user_status','2','人工锁定','admin','2018-09-04 09:47:09',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (11,'0',NULL,'trade_order_status','订单状态','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (12,'1','trade_order_status','-1','待下单','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (13,'1','trade_order_status','0','待支付','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (14,'1','trade_order_status','1','已支付待释放','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (15,'1','trade_order_status','2','已释放待评价','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (16,'1','trade_order_status','3','已完成','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (17,'1','trade_order_status','4','已取消','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (18,'1','trade_order_status','5','仲裁中','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (19,'0',NULL,'jour_biz_type','流水业务类型','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (20,'1','jour_biz_type','charge','充值','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (21,'1','jour_biz_type','withdraw','取现','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (22,'1','jour_biz_type','buy','交易买入','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (23,'1','jour_biz_type','sell','交易卖出','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (24,'1','jour_niz_type','tradefee','交易手续费','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (25,'1','jour_biz_type','withdrawfee','取现手续费','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (26,'1','jour_biz_type','invite','邀请好友分成','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (27,'1','jour_biz_type','tradefrozen','交易冻结','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (28,'1','jour_biz_type','tradeunfrozen','交易解冻','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (29,'1','jour_biz_type','withdrawfrozen','取现冻结','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (30,'1','jour_biz_type','withdrawunfrozen','取现解冻','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (31,'1','jour_biz_type','transfer_in','转账收入','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (32,'1','jour_biz_type','transfer_out','转账支出','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (33,'1','jour_biz_type','hc','红冲','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (34,'1','jour_biz_type','lb','蓝补','admin','2018-09-08 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (35,'0',NULL,'coin_type','币种类型','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (36,'1','coin_type','0','以太坊','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (37,'1','coin_type','1','比特币','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (38,'1','coin_type','0T','X币','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (39,'0',NULL,'coin_status','币种状态','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (40,'1','coin_status','0','已发布','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (41,'1','coin_status','1','已撤下','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (42,'0',NULL,'ads_status','广告状态','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (43,'1','ads_status','0','草稿','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (44,'1','ads_status','1','已上架','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (45,'1','ads_status','2','已下架','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (46,'0',NULL,'arbitrate_status','仲裁状态','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (47,'1','arbitrate_status','0','待处理','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (48,'1','arbitrate_status','1','已处理','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (49,'1','arbitrate_status','2','已取消','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (50,'0',NULL,'charge_status','支付状态','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (51,'1','charge_status','1','待支付','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (52,'1','charge_status','2','支付失败','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (53,'1','charge_status','3','支付成功','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (54,'0',NULL,'withdraw_status','取现状态','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (55,'1','withdraw_status','1','待审批','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (56,'1','withdraw_status','2','审批不通过','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (57,'1','withdraw_status','3','审批通过待广播','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (58,'1','withdraw_status','4','广播中','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (59,'1','withdraw_status','5','广播失败','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (60,'1','withdraw_status','6','广播成功','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (61,'0',NULL,'maddress_status','散取地址状态','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (62,'1','maddress_status','0','可使用','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (63,'1','maddress_status','1','广播使用中','admin','2018-09-09 00:00:00',NULL);
INSERT INTO `tsys_dict` (`id`,`type`,`parent_key`,`dkey`,`dvalue`,`updater`,`update_datetime`,`remark`) VALUES (64,'1','maddress_status','2','已弃用','admin','2018-09-09 00:00:00',NULL);

/*
-- Query: SELECT * FROM ogc_standard.tcoin_market
LIMIT 0, 1000

-- Date: 2018-09-08 23:56
*/
INSERT INTO `tcoin_market` (`symbol`,`refer_currency`,`origin`,`last_price`,`bid`,`ask`,`mid`,`low`,`high`,`volume`,`update_datetime`,`coinmarketcap_id`) VALUES ('BTC','CNY','cctrade',45000.0000,NULL,NULL,45000.0000,20000.0000,60000.0000,NULL,'2018-09-08 00:00:00',1);
INSERT INTO `tcoin_market` (`symbol`,`refer_currency`,`origin`,`last_price`,`bid`,`ask`,`mid`,`low`,`high`,`volume`,`update_datetime`,`coinmarketcap_id`) VALUES ('HPM','CNY','cctrade',20.0000,NULL,NULL,20.0000,40.0000,10.0000,NULL,'2018-09-08 00:00:00',2);
INSERT INTO `tcoin_market` (`symbol`,`refer_currency`,`origin`,`last_price`,`bid`,`ask`,`mid`,`low`,`high`,`volume`,`update_datetime`,`coinmarketcap_id`) VALUES ('ETH','CNY','cctrade',2000.0000,NULL,NULL,2000.0000,4000.0000,1000.0000,NULL,'2018-09-08 00:00:00',3);
