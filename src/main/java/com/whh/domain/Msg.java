package com.whh.domain;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的PageInfo返回类
 */
public class Msg {

    //定义一个状态码200成功 500失败
    private Integer code;
    //提示信息
    private String msg;
    //用户返回给浏览器的数据
    private Map<String,Object> extend = new HashMap<>();

    //处理成功
    public static Msg success(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("处理成功!");
        return result;
    }
    //处理失败
    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(500);
        result.setMsg("处理失败!");
        return result;
    }

    public Msg add(String key,Object value){
        this.getExtend().put(key,value);
        return this;
    }

    public Msg() {
    }

    public Msg(Integer code, String msg, Map<String, Object> extend) {
        this.code = code;
        this.msg = msg;
        this.extend = extend;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
