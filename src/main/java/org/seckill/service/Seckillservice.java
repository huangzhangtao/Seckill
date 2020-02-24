package org.seckill.service;

import org.seckill.dto.Exposer;
import org.seckill.dto.SeckillExecution;
import org.seckill.entity.Seckill;
import org.seckill.exception.RepeatKillException;
import org.seckill.exception.SeckillCloseException;
import org.seckill.exception.SeckillException;

import java.util.List;

public interface Seckillservice {

    List<Seckill> getSeckillList();

    Seckill getById(long seckillId);

    /**
     * 输出秒杀接口的地址
     * 秒杀开启时输出接口地址
     * 否则输出秒杀时间和系统时间
     * @param seckillId
     */
    Exposer exportSeckillUrl(long seckillId);

    /**
     * 执行秒杀操作
     * @param seckillId
     * @param userPhone
     * @param md5 匹配md5是否一致，判断用户秒杀地址是否正常
     */
    SeckillExecution executeSeckill(long seckillId,long userPhone,String md5)
            throws SeckillException, RepeatKillException, SeckillCloseException;



}
