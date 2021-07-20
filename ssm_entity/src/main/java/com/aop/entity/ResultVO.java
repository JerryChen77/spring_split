package com.aop.entity;

import org.springframework.stereotype.Component;

/**
 * @author Cjl
 * @date 2021/6/18 22:02
 * ResultVO：封装后台向前台传输的数据的类
 */
@Component("ResultVO")

public class ResultVO {
    /**
     * 是否成功
     */
    private boolean success;
    /**
     * 响应消息
     */
    private String message;
    /**
     * 附加数据
     */
    private Object data;
    private ResultVO(String message, Object data) {
        this.message = message;
        this.data = data;
    }

    public ResultVO() {
    }

    public ResultVO(boolean success, String message, Object data) {
        this.success = success;
        this.message = message;
        this.data = data;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public static ResultVO ok(String message, Object data){
        ResultVO resultVO = new ResultVO(message,data);
        resultVO.setSuccess(true);
        return resultVO;
    }

    public static ResultVO error(String message, Object data){
        ResultVO resultVO = new ResultVO(message,data);
        resultVO.setSuccess(false);
        return resultVO;
    }

}
