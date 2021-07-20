package com.aop.advice;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.util.Arrays;

/**
 * @author Cjl
 * @date 2021/7/8 17:57
 */
@Component("logger")
@Aspect
public class LoggerAdvice {
    org.apache.log4j.Logger logger = Logger.getLogger(LoggerAdvice.class);

    @Pointcut("execution(* com.aop.service..*.*(..))")
    public void myPoint(){}

    @AfterReturning("LoggerAdvice.myPoint()")
    public void logger(JoinPoint joinPoint){
        Object[] args = joinPoint.getArgs();
        String name = joinPoint.getSignature().getName();
        System.out.println("********logger日志："+name+"方法执行"+"方法参数为："+(args!=null? Arrays.asList(args):null));
    }

}
