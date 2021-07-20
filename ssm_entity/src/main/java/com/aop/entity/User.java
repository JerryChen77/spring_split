package com.aop.entity;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.io.Serializable;

/**
 * @author Cjl
 * @date 2021/7/8 12:41
 */
@Component("user")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User implements Serializable {
    private Integer cardId;
    private String username;
    private double accountBalance;

    @JSONField(serialize = false)
    private String accountPassword;


    @JSONField(serialize = false)
    private Integer userId;

    private String img;

    private Integer isAdmin;
}
