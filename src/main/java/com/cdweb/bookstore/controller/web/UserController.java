package com.cdweb.bookstore.controller.web;

import com.cdweb.bookstore.dto.UserDTO;
import com.cdweb.bookstore.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

@RestController
public class UserController {
    @Autowired
    private IUserService userService;

    @GetMapping("/check-mail")
    public String findByEmailAndIsEnable(@RequestParam(name = "email", required = false) String email) {
        UserDTO user = userService.findByEmailAndIsEnable(email);
        String result = "";
        if (user != null) {
            user.setPassword("");
            result = user.getEmail();
        }
        return result;
    }

    @PostMapping("/dang-ky")
    public ModelAndView postRegister(@ModelAttribute("User") UserDTO user) {
        ModelAndView mav = new ModelAndView("web/confirmCode.html");
        UserDTO userDTO = userService.sendMail(user);
        if (userDTO != null) {
            //neu sendmail thanh cong thi gui id de xac dinh confirm token
            mav.addObject("userId", userDTO.getUserID());
        }
        return mav;
    }

    @PostMapping("/confirm-account")
    public ModelAndView confirmAccount(@RequestParam(name = "confirmCode") String code,
                                       @RequestParam(name = "userId") int id) {
        ModelAndView mav = null;
        //request sẽ gồm code người dùng nhập vào và id dc gửi qua
        //lấy code đó so sánh với code được lấy ra từ user tìm dc theo id
        //nếu giống nhau thì set enable lại r trả về view sign in
        if (code.equalsIgnoreCase(userService.getConfirmCode(id))) {
            UserDTO userDTO = userService.confirmEmail(id);
            mav = new ModelAndView("web/signin.html");
        }
        return mav;
    }

    @GetMapping("/quen-mat-khau")
    public ModelAndView getForgetPassword() {
        return new ModelAndView("web/forgetPassword.html");
    }

    @GetMapping("/gui-mail-quen-mat-khau")
    public ModelAndView sendMailForgetPassword(@RequestParam(name = "mailForgot") String email) {
        ModelAndView mav = new ModelAndView("web/forgetPassword.html");
        UserDTO result = userService.sendMailForgotPassword(email);
        if (result == null) mav.addObject("message", "Tài khoản không tồn tại.");
        else mav.addObject("message", "Vui lòng check mail để nhận mật khẩu");
        return mav;
    }

    @GetMapping("/getUser")
    public UserDTO getUser(Principal principal) {
        if (principal != null) {
            UserDTO user = this.userService.findByEmailAndIsEnable(principal.getName());
            user.setPassword("");
            return user;
        } else {
            return new UserDTO();
        }
    }
}
