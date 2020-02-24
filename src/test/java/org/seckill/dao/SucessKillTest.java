package org.seckill.dao;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.entity.SuccessKilled;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class SucessKillTest {

    @Resource
    private SucessKill sucessKill;

    @Test
    public void insertSuccessKilled() {
        long seckillId=1001;
        long userPhone=178102986L;
        int insertCount=sucessKill.insertSuccessKilled(seckillId,userPhone);
        System.out.println("insertCount="+insertCount);
    }

    @Test
    public void queryByIdWithSeckill() {
        long seckillId=1001;
        long userPhone=178102986L;
        SuccessKilled successKilled=sucessKill.queryByIdWithSeckill(seckillId,userPhone);
        System.out.println(successKilled);
        System.out.println(sucessKill.getClass());
    }
}
