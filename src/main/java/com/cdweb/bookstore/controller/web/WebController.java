package com.cdweb.bookstore.controller.web;

import com.cdweb.bookstore.dto.BookDTO;
import com.cdweb.bookstore.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.List;

@RestController
public class WebController {
    @Autowired
    private IBookService bookService;

    @GetMapping(value = {"/", "/trang-chu"})
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("web/index.html");
        return mav;
    }

    @GetMapping("/lien-he")
    public ModelAndView contact() {
        return new ModelAndView("web/contact.html");
    }

    @GetMapping("/chi-tiet-san-pham")
    public ModelAndView productDetail() {
        ModelAndView mav = new ModelAndView("web/detail.html");
        return mav;
    }

    @GetMapping("/gio-hang")
    public ModelAndView cart(Principal principal) {
        return principal == null ? new ModelAndView("web/signin.html") : new ModelAndView("web/cart.html");
    }

    @GetMapping("/thanh-toan")
    public ModelAndView checkout() {
        ModelAndView mav = new ModelAndView("web/checkout.html");
        return mav;
    }

    @GetMapping("/ve-chung-toi")
    public ModelAndView about() {
        return new ModelAndView("web/about");
    }

    @GetMapping("/dang-nhap")
    public ModelAndView signin(@RequestParam(name = "error", required = false) boolean error) {
        ModelAndView mav = new ModelAndView("web/signin");
        if (error) mav.addObject("message", "Email hoặc mật khẩu không đúng");
        return mav;
    }

    //admin book
    @GetMapping("/admin-page/book-management")
    public ModelAndView listBook() {
        return new ModelAndView("admin/book-management/books");
    }

    @GetMapping("/admin-page/add-book")
    public ModelAndView addBook() {
        return new ModelAndView("admin/book-management/addBook");
    }

    @GetMapping("/admin-page/edit-book")
    public ModelAndView editBook() {
        return new ModelAndView("admin/book-management/editBook");
    }

    //amdin category
    @GetMapping("/admin-page/category-management")
    public ModelAndView listCategory() {
        return new ModelAndView("admin/category-management/categories");
    }

    @GetMapping("/admin-page/add-category")
    public ModelAndView addCategory() {
        return new ModelAndView("admin/category-management/addCategory");
    }

    @GetMapping("/admin-page/edit-category")
    public ModelAndView editCategory() {
        return new ModelAndView("admin/category-management/editCategory");
    }

    //admin author
    @GetMapping("/admin-page/author-management")
    public ModelAndView listAuthor() {
        return new ModelAndView("admin/author-management/authors");
    }

    @GetMapping("/admin-page/add-author")
    public ModelAndView addAuthor() {
        return new ModelAndView("admin/author-management/addAuthor");
    }

    @GetMapping("/admin-page/edit-author")
    public ModelAndView editAuthor() {
        return new ModelAndView("admin/author-management/editAuthor");
    }

    //order
    @GetMapping("/admin-page/order-management")
    public ModelAndView listOrder() {
        return new ModelAndView("admin/order-management/orders");
    }

    //account
    @GetMapping("/admin-page/account-management")
    public ModelAndView listAccount() {
        return new ModelAndView("admin/account-management/accounts");
    }
}
