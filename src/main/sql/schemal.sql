--创建数据库脚本
CREATE  DATABASE seckill;
--使用数据库
use seckill;
--创建秒杀库存表
CREATE TABLE seckill(
  `seckill_id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
  `name` varchar (120) NOT NULL COMMENT '商品名称',
  `number` int NOT NULL COMMENT '库存数量',
  `start_time` varchar NOT NULL COMMENT '秒杀开启时间',
  `end_time` varchar NOT NULL COMMENT '秒杀结束时间',
  `create_time` varchar NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY(seckill_id),
  key idx_start_time(start_time),
  key idx_end_time(end_time),
  key idx_create_time(create_time)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表';

--初始化数据
insert into
  seckill(name,number,start_time,end_time)
  values
    ('8元秒杀科比海报',100,'2020-01-01 08:24:00','2020-12-01 16:00:00'),
    ('8元秒杀科比自传',100,'2020-01-01 08:24:00','2020-12-01 16:00:00'),
    ('24元秒杀科比球衣',100,'2020-01-01 08:24:00','2020-12-01 16:00:00'),
    ('240元秒杀签名球鞋',100,'2020-01-01 08:24:00','2020-12-01 16:00:00');

--秒杀成功明细表
--用户登录认证的相关的信息
CREATE TABLE success_killed(
  `seckill_id` bigint NOT NULL COMMENT '秒杀商品id',
  `user_phone` bigint NOT NULL COMMENT '用户手机号',
  `state` bigint NOT NULL DEFAULT -1 COMMENT '状态表示：-1：无效，0：成功，1：已付款',
  `create_time` varchar NOT NULL COMMENT '创建时间',
  PRIMARY KEY (seckill_id,user_phone),
  key idx_create_time(create_time)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表';