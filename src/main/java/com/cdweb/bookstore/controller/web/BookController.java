package com.cdweb.bookstore.controller.web;

import com.cdweb.bookstore.api.BookOutput;
import com.cdweb.bookstore.dto.BookDTO;
import com.cdweb.bookstore.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.awt.print.Book;
import java.util.List;

@RestController
public class BookController {
    @Autowired
    private IBookService bookService;

    //?category=truyen-tranh&page=1&size=8&sort=price&order=asc
    //xu li cho request ajax
    @GetMapping("/danh-sach-san-pham")
    public BookOutput findAll(
            @RequestParam(name = "category", required = false, defaultValue = "null") String category,
            @RequestParam(name = "author", required = false, defaultValue = "null") String author,
            @RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
            @RequestParam(name = "hot", required = false, defaultValue = "false") boolean isHot,
            @RequestParam(name = "news", required = false, defaultValue = "false") boolean isNew,
            @RequestParam(name = "sort", required = false, defaultValue = "id") String sortBy,
            @RequestParam(name = "order", required = false, defaultValue = "asc") String sortOrder,
            @RequestParam(name = "title", required = false, defaultValue = "null") String title,
            @RequestParam(name = "from", required = false) Integer from,
            @RequestParam(name = "to", required = false) Integer to
    ) {
        //mặc định có 9 sản phẩm mỗi trang
        final int SIZE = 9;
        BookOutput output = new BookOutput();

        //sort
        Sort sortable = null;
        if (sortOrder.equalsIgnoreCase("asc"))
            sortable = Sort.by(sortBy).ascending();
        else sortable = Sort.by(sortBy).descending();

        Pageable pageable = PageRequest.of(page - 1, SIZE, sortable);
        if (!title.equalsIgnoreCase("null")) {
            output.setResult(bookService.findAllContainTitle(title, pageable));
            output.setPage(page);
            output.setTotalPage((int) Math.round(Math.ceil((double) (bookService.countAllByTitleContains(title)) / SIZE)));

        } else if (from != null && to != null) {
            output.setResult(bookService.findByPriceBetween(from, to, pageable));
            output.setPage(page);
            output.setTotalPage((int) Math.round(Math.ceil((double) (bookService.countAllByPriceBetween(from, to)) / SIZE)));
        } else if (from != null && to == null) {
            output.setResult(bookService.findByPriceGreaterThan(from, pageable));
            output.setPage(page);
            output.setTotalPage((int) Math.round(Math.ceil((double) (bookService.countAllByPriceGreaterThan(from)) / SIZE)));
        } else if (!category.equalsIgnoreCase("null")) {
            output.setResult(bookService.findByCategoryCode(category, pageable));
            output.setPage(page);
            output.setTotalPage((int) Math.round(Math.ceil((double) (bookService.countByCategory(category)) / SIZE)));

        } else if (!author.equalsIgnoreCase("null")) {
            output.setResult(bookService.findAllByAuthorCode(author, pageable));
            output.setPage(page);
            output.setTotalPage((int) Math.round(Math.ceil((double) (bookService.countByAuthorCode(author)) / SIZE)));

        } else if (isHot) {
            output.setResult(bookService.findAllHotBook(true, true, pageable));
            output.setPage(page);
            output.setTotalPage((int) Math.round(Math.ceil((double) (bookService.countAllByHot(true, true)) / SIZE)));

        } else if (isNew) {
            output.setResult(bookService.findAllNewBook(true, true, pageable));
            output.setPage(page);
            output.setTotalPage((int) Math.round(Math.ceil((double) (bookService.countAllByNews(true, true)) / SIZE)));
        } else {
            output.setResult(bookService.findAll(pageable));
            output.setPage(page);
            output.setTotalPage((int) Math.round(Math.ceil((double) (bookService.countAllByActive(true)) / SIZE)));
        }
        return output;
    }

    //dieu huong sang trang san pham
    @GetMapping("/san-pham")
    public ModelAndView shop() {
        ModelAndView mav = new ModelAndView("web/shop.html");
        return mav;
    }

    //chuyen huong qua trang chi tiet
    @GetMapping("/chi-tiet")
    public ModelAndView detail(@RequestParam(name = "id") Integer id) {
        ModelAndView mav = new ModelAndView("web/detail.html");
        BookDTO bookDb = bookService.findById(id);
        mav.addObject("list", bookService.findByCategoryIdAnQuantityGreaterThan(bookDb.getCategory().getCategoryID(), 50));
        return mav;
    }

    @GetMapping("/getDetailBook")
    public BookDTO getDetail(@RequestParam(name = "id") int id) {
        return bookService.findById(id);
    }

    @GetMapping("/hot-book")
    public List<BookDTO> findHotBook() {
        return bookService.findHotBook(true, true);
    }

    @GetMapping("/new-book")
    public List<BookDTO> findNewBook() {
        return bookService.findNewBook(true, true);
    }

    @GetMapping("/autocomplete")
    public List<String> autoCompleteTitle(@RequestParam("title") String title) {
        return bookService.autoCompleteTilte(title);
    }
}
