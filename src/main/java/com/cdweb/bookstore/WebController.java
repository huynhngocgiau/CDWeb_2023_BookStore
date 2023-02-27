package com.cdweb.bookstore;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebController {
    @GetMapping("/")
    public String index(){
        return "web/index";
    }

    @GetMapping("/shop")
    public String shop(){
        return "web/shop";
    }
    @GetMapping("/contact")
    public String contact(){
        return "web/contact";
    }

    @GetMapping("/product/detail")
    public String productDetail(){
        return "web/detail";
    }
    @GetMapping("/cart")
    public String cart(){
        return "web/cart";
    }
    @GetMapping("/checkout")
    public String checkout(){
        return "web/checkout";
    }
    @GetMapping("/about")
    public String about(){
        return "web/about";
    }
<<<<<<< Updated upstream
=======
    @GetMapping("/signin")
    public String signin(){
        return "web/signin";
    }
 //admin book
    @GetMapping("/admin-page/book-management")
    public String listBook() {
        return "admin/book-management/books";
    }

    @GetMapping("/admin-page/add-book")
    public String addBook() {
        return "admin/book-management/addBook";
    }
    @GetMapping("/admin-page/edit-book")
    public String editBook() {
        return "admin/book-management/editBook";
    }

    //amdin category
    @GetMapping("/admin-page/category-management")
    public String listCategory() {
        return "admin/category-management/categories";
    }

    @GetMapping("/admin-page/add-category")
    public String addCategory() {
        return "admin/category-management/addCategory";
    }
    @GetMapping("/admin-page/edit-category")
    public String editCategory() {
        return "admin/category-management/editCategory";
    }

    //admin author
    @GetMapping("/admin-page/author-management")
    public String listAuthor() {
        return "admin/author-management/authors";
    }

    @GetMapping("/admin-page/add-author")
    public String addAuthor() {
        return "admin/author-management/addAuthor";
    }
    @GetMapping("/admin-page/edit-author")
    public String editAuthor() {
        return "admin/author-management/editAuthor";
    }

    //order
    @GetMapping("/admin-page/order-management")
    public String listOrder() {
        return "admin/order-management/orders";
    }

    //account
    @GetMapping("/admin-page/account-management")
    public String listAccount() {
        return "admin/account-management/accounts";
    }
>>>>>>> Stashed changes
}
