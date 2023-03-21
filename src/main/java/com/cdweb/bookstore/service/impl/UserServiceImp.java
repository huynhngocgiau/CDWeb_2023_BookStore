package com.cdweb.bookstore.service.impl;

import com.cdweb.bookstore.converter.RoleConverter;
import com.cdweb.bookstore.converter.UserConverter;
import com.cdweb.bookstore.dto.RoleDTO;
import com.cdweb.bookstore.dto.UserDTO;
import com.cdweb.bookstore.entities.RoleEntity;
import com.cdweb.bookstore.entities.UserEntity;
import com.cdweb.bookstore.repository.RoleRepository;
import com.cdweb.bookstore.repository.UsersRepository;
import com.cdweb.bookstore.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
public class UserServiceImp implements IUserService {
    @Autowired
    private UserConverter userConverter;
    @Autowired
    private UsersRepository userRepo;
//    @Autowired
    private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    @Autowired
    private RoleRepository roleRepo;
    @Autowired
    private RoleConverter roleConverter;
    @Autowired
    private JavaMailSender mailSender;

    @Override
    public UserDTO findByEmailAndIsEnable(String email) {
        //tìm những email đã xác thực (isEnable = true)
        UserEntity userEntity = userRepo.findByEmailIgnoreCaseAndIsEnable(email, true);
        if (userEntity != null) {
            return userConverter.toDTO(userEntity);
        }
        return null;
    }

    public UserDTO sendMail(UserDTO user) {
        UserEntity userEntity = new UserEntity();
        //neu nhu tai khoan vs email da ton tai thi tra ve null
        UserEntity existedUser = userRepo.findByEmailIgnoreCaseAndIsEnable(user.getEmail(), true);
        if (existedUser != null) return null;
        else {
            //neu tim dc nhung email da dang ki tai khoan nhung chua xac thuc thi xoa tk do luon
            UserEntity temp = userRepo.findByEmailIgnoreCaseAndIsEnable(user.getEmail(), false);
            if (temp != null) userRepo.delete(temp);

            //set lai pass da ma hoa
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            //tao confirm token
            user.setConfirmToken(new Random().nextInt(999999) + "");

            //tạo 1 list để lưu các role của người dùng
            List<RoleDTO> list = new ArrayList<>();
            //sau đó tìm role user thêm vào list
            RoleEntity role = roleRepo.findByName("ROLE_USER");

            list.add(roleConverter.toDTO(role));
            user.setRoles(list);
            //lưu user này rồi thì bên role entity tự động thêm user này vào list role
            userRepo.save(userConverter.toEntity(user));

            //gui confirm token qua mail
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(user.getEmail());
            message.setSubject("Bookstore - Xác nhận email để tạo tài khoản");
            message.setFrom("bookstore@gmail.com");
            message.setText("Code xác nhận mail của bạn là: " + user.getConfirmToken() + ". Vui lòng nhập code để xác nhận email");
            mailSender.send(message);
            //sau khi luu xong thì lấy user vừa lưu với email đó để gửi cái userID qua bên view confirmCode
            return userConverter.toDTO(userRepo.findByEmailIgnoreCase(user.getEmail()));
        }

    }

    @Override
    public String getConfirmCode(int id) {
        return userRepo.getConfirmTokenById(id);
    }

    @Override
    public UserDTO confirmEmail(int id) {
        UserEntity userEntity = userRepo.findByUserID(id);
        userEntity.setEnable(true);
        userRepo.save(userEntity);
        return userConverter.toDTO(userEntity);
    }

    @Override
    public UserDTO sendMailForgotPassword(String userEmail) {
        //nếu lấy email của user, tra csdl có tồn tại tài khoản thì lấy pass trong csdl gửi cho mail đó
        UserEntity result = userRepo.findByEmailIgnoreCaseAndIsEnable(userEmail, true);
        if (result != null) {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(userEmail);
            message.setSubject("Bookstore - Xác nhận email quên mật khẩu");
            message.setFrom("bookstore@gmail.com");
            message.setText("Mật khẩu tài khoản bạn là: " + result.getPassword() + ". Mật khẩu của bạn đã được mã hóa. Vui lòng truy cập: https://bcrypt-generator.com/ để giải mã mật khẩu. Để bảo mật tài khoản vui lòng đăng nhập và thay đổi mật khẩu");
            mailSender.send(message);
            return userConverter.toDTO(result);
        }
        return null;
    }
}
