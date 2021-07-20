package com.aop.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Cjl
 * @date 2021/7/14 19:31
 */
public class MyLoginInterceptor implements HandlerInterceptor {

    //在处理器handler之前执行，抽取handler冗余代码
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        Object user = request.getSession().getAttribute("user");
        if (null!=user){
            return true;
        }
        response.sendRedirect(request.getContextPath()+"/login/login.jsp");
        return false;
    }

    //在handler之后执行，进一步的响应定制
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    //在页面渲染完毕之后执行，资源回收
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
