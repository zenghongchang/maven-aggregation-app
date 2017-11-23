package edu.hnust.application.orm.user;

import java.io.Serializable;

@SuppressWarnings("serial")
public class LoginLog implements Serializable {
    private Long id;    
    private String loginIp;    
    private Integer creator;// 登陆人
    private String createdTime;// 登陆时间    
    private String loginOutTime;// 登出时间
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getLoginIp() {
        return loginIp;
    }
    
    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }
    
    public Integer getCreator() {
        return creator;
    }
    
    public void setCreator(Integer creator) {
        this.creator = creator;
    }
    
    public String getCreatedTime() {
        return createdTime;
    }
    
    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }
    
    public String getLoginOutTime() {
        return loginOutTime;
    }
    
    public void setLoginOutTime(String loginOutTime) {
        this.loginOutTime = loginOutTime;
    }
    
    @Override
    public String toString() {
        return "LoginLog [id=" + id + ", loginIp=" + loginIp + ", creator=" + creator + ", createdTime=" + createdTime + ", loginOutTime=" + loginOutTime + "]";
    }
}