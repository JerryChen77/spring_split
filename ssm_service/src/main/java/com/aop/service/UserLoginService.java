package com.aop.service;

import com.aop.entity.ResultVO;

/**
 * @author Cjl
 * @date 2021/7/13 20:29
 */
public interface UserLoginService {
    ResultVO login(String username, String password);
}
