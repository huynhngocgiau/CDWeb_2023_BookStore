package com.cdweb.bookstore.controller.web;

import com.cdweb.bookstore.api.output.CartOutput;
import com.cdweb.bookstore.dto.BookDTO;
import com.cdweb.bookstore.dto.CartDTO;
import com.cdweb.bookstore.service.ICartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.List;

@RestController
public class CartController {
    @Autowired
    private ICartService cartService;

    @GetMapping("/them-san-pham")
    public CartDTO addProduct(@RequestParam(name = "bookID", required = false) int bookId,
                              @RequestParam(name = "quantity", required = false) int quantity,
                              Principal principal) {
        if (principal != null) {
            return cartService.addProduct(principal.getName(), bookId, quantity);
        }
        //tạo cart mới set user null, tạo book để nó đừng lỗi
        CartDTO result= new CartDTO();
        result.setBook(new BookDTO());
        return result;
    }

    @GetMapping("get-books")
    public CartOutput getBooks(Principal principal) {
        if (principal == null) return null;
        CartOutput output = new CartOutput();
        double total = 0.0;
        List<CartDTO> booksDb = cartService.getBooks(principal.getName());
        for (CartDTO c : booksDb) {
            total += c.getBook().getPrice() * (1 - (c.getBook().getDiscountPercent() / 100)) * c.getQuantity();
        }
        output.setTotal(total);
        output.setBooksList(booksDb);
        return output;
    }

    @GetMapping("xoa-san-pham")
    public CartOutput deleteBook(@RequestParam(name = "bookID") int bookId, Principal principal) {
        if (principal == null) return null;
        List<CartDTO> cartDeleted = cartService.deleteBook(principal.getName(), bookId);
        CartOutput outputDelete = new CartOutput();
        double total = 0.0;
        for (CartDTO c : cartDeleted) {
            total += c.getBook().getPrice() * (1 - (c.getBook().getDiscountPercent() / 100)) * c.getQuantity();
        }
        outputDelete.setTotal(total);
        outputDelete.setBooksList(cartDeleted);
        return outputDelete;
    }

    @GetMapping("update-quantity")
    public CartOutput updateQuantity(@RequestParam(name = "bookID") int bookId,
                                     @RequestParam(name = "quantity") int newQuantity,
                                     Principal principal) {
        if (principal == null) return null;
        List<CartDTO> cartUpdate = cartService.updateQuantity(principal.getName(), bookId, newQuantity);
        CartOutput outputUpdate = new CartOutput();
        double total = 0.0;
        for (CartDTO c : cartUpdate) {
            total += c.getBook().getPrice() * (1 - (c.getBook().getDiscountPercent() / 100)) * c.getQuantity();
        }
        outputUpdate.setTotal(total);
        outputUpdate.setBooksList(cartUpdate);
        return outputUpdate;
    }
}
