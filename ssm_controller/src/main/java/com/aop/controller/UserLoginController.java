package com.aop.controller;


import com.aop.entity.ResultVO;
import com.aop.entity.User;
import com.aop.service.impl.UserLoginServiceImpl;
import com.aop.service.impl.UserServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author Cjl
 * @date 2021/6/28 16:26
 */
@Controller
@RequestMapping("userLogin")
@SessionAttributes({"user","users"})
public class UserLoginController {
    @Autowired
    private UserLoginServiceImpl userLoginService;
    @Autowired
    private UserServiceImpl userService;

    @RequestMapping("login")
    public ModelAndView login(String username, String password, String kaptcha, HttpServletRequest request, ModelAndView modelAndView){

            ResultVO resultVO = userLoginService.login(username, password);
            //获取正确的验证码
            String kaptchaExpected = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);

            if (null!=kaptcha){
                if (kaptcha.equalsIgnoreCase(kaptchaExpected)){
                        System.out.println("验证码正确");
                        if (resultVO.isSuccess()){
                            System.out.println("密码正确");
                            /**
                             * 把当前登录的user赋到session域中，供interceptor使用，检查是否登录
                             */
                            User user = (User) resultVO.getData();
                            modelAndView.addObject("user",user);
                            if (user.getIsAdmin()==1){
                                modelAndView.addObject("pageNum",1);
                                modelAndView.setViewName("forward:/userLogin/findByPageNo");
                            }else{
                                modelAndView.setViewName("forward:/commonUser.jsp");
                            }
                            return modelAndView;
                        }else {
                            /**
                             * 如果resultVO.isSuccess()为false，或其他判断条件为false则跳到下面下面↓
                             * 用此方法显示错误信息弹窗
                             */
                            String message = resultVO.getMessage();
                            modelAndView.addObject("error","alert('"+message+"');window.location.href='/login/login.jsp';");
                            modelAndView.setViewName("forward:/login/login.jsp");
                            return modelAndView;
                        }
                }else{
                    modelAndView.addObject("error","alert('验证码错误!!');window.location.href='/login/login.jsp';");
                    modelAndView.setViewName("forward:/login/login.jsp");
                    System.out.println("验证码错误！");
                    return modelAndView;
                }
            }else{
                modelAndView.addObject("error","alert('未输入验证码!!');window.location.href='/login/login.jsp';");
                modelAndView.setViewName("forward:/login/login.jsp");
                return modelAndView;
            }
        }

    @RequestMapping("findByPageNo")
    public String findByPageNo(HttpServletRequest request){
        Integer pageNum = (Integer) request.getAttribute("pageNum");
        if (pageNum==null){
            String pageNum1 = request.getParameter("pageNum");
            int i = Integer.parseInt(pageNum1);
            pageNum =i;
        }
        PageHelper.startPage(pageNum,5);
        List<User> users = userService.selectAll();

        PageInfo pageInfo = new PageInfo(users);
        request.getSession().setAttribute("pageInfo",pageInfo);
        request.getSession().setAttribute("users",(Page)users);
        return "redirect:/admin.jsp";
    }


    }

