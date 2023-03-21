package com.cdweb.bookstore.service;

import com.cdweb.bookstore.dto.UserDTO;

public interface IUserService {
    public UserDTO findByEmailAndIsEnable(String email);

    public UserDTO sendMail(UserDTO user);

    public String getConfirmCode(int id);

    public UserDTO confirmEmail(int id);

    public UserDTO sendMailForgotPassword(String userEmail);
}
