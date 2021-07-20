package com.aop.service.impl;

import com.aop.entity.ResultVO;
import com.aop.entity.User;
import com.aop.mapper.UserMapper;
import com.aop.service.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Cjl
 * @date 2021/7/13 20:30
 */
@Service
public class UserLoginServiceImpl implements UserLoginService {
    @Autowired
    ResultVO resultVO;
    @Autowired
    UserMapper userMapper;
    @Override
    public ResultVO login(String username, String password) {
//        ClassPathXmlApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//        ResultVO resultVO = ioc.getBean(ResultVO.class);

        User byUsername = userMapper.findByUsername(username);
        if (byUsername==null){
            resultVO.setSuccess(false);
            resultVO.setMessage("用户不存在，请先注册");
            return resultVO;
        }else if (byUsername.getAccountPassword().equals(password)){
            resultVO.setSuccess(true);
            resultVO.setMessage("用户名密码正确！！！");
            resultVO.setData(byUsername);
            return resultVO;
        }else{
            resultVO.setSuccess(false);
            resultVO.setMessage("用户名密码错误！！！");
            return resultVO;
        }
    }
}
