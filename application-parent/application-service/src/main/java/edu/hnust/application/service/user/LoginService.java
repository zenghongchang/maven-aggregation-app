package edu.hnust.application.service.user;

import edu.hnust.application.orm.user.LoginLog;

public interface LoginService {
    public LoginLog queryLoginLogById(Long id);
}