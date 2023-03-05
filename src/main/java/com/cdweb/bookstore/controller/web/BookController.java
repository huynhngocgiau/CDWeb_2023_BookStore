package com.cdweb.bookstore.controller.web;

import com.cdweb.bookstore.dto.BookDTO;
import com.cdweb.bookstore.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
public class BookController {
    @Autowired
    private IBookService bookService;

    //?category=truyen-tranh&page=1&size=8&sort=price&order=asc
    @GetMapping("/danh-sach-san-pham")
    public ModelAndView findAll(
            @RequestParam(name = "category", required = false, defaultValue = "null") String category,
            @RequestParam(name = "page", required = true, defaultValue = "1") Integer page
            ) {
        //mặc định có 8 sản phẩm mỗi trang
        final int SIZE=8;
        Pageable pageable= PageRequest.of(page-1, SIZE);
        ModelAndView mav= new ModelAndView("web/shop.html");
        if (!category.equalsIgnoreCase("null")){
            mav.addObject("books", bookService.findByCategoryCode(category, pageable));
            mav.addObject("page", page);
            mav.addObject("totalPage", (int) Math.ceil((bookService.countByCategory(category))/SIZE));

        }
        else {
            mav.addObject("books", bookService.findAll(pageable));
            mav.addObject("page", page);
            mav.addObject("totalPage", (int) Math.ceil((bookService.countAll(true))/SIZE));
        }
        return mav;
    }
}
