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
}
