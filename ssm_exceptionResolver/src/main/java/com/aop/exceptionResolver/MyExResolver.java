package com.aop.exceptionResolver;

import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Cjl
 * @date 2021/7/14 19:13
 */
public class MyExResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        e.printStackTrace();
        ModelAndView modelAndView = new ModelAndView();

        if(e instanceof MaxUploadSizeExceededException){
            modelAndView.setViewName("redirect:/errors/error4.jsp");
        }else if(e instanceof RuntimeException){
            modelAndView.setViewName("redirect:/errors/error1.jsp");
        }else if(e instanceof Exception){
            modelAndView.setViewName("redirect:/errors/error2.jsp");
        }else{
            modelAndView.setViewName("redirect:/errors/error3.jsp");
        }

        return modelAndView;
    }
}
