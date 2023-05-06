package com.cdweb.bookstore.controller.web;

import com.cdweb.bookstore.api.output.CartOutput;
import com.cdweb.bookstore.api.input.OrderInput;
import com.cdweb.bookstore.dto.BookDTO;
import com.cdweb.bookstore.dto.CartDTO;
import com.cdweb.bookstore.dto.OrderDTO;
import com.cdweb.bookstore.dto.OrderlineDTO;
import com.cdweb.bookstore.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@RestController
public class OrderController {
    @Autowired
    private ICartService cartService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IOrderService orderService;
    @Autowired
    private IOrderlineService orderlineService;
    @Autowired
    private IBookService bookService;

    @PostMapping("/thanh-toan")
    //lay list cart item, total dem qua trang thanh toan
    public ModelAndView getCartItemToCheckout(@ModelAttribute("order") OrderInput input, Principal principal) {
        if (principal == null) {
            return new ModelAndView("web/signin.html");
        }
        CartOutput output = new CartOutput();
        double total = 0;
        //ds id cac sp
        for (Integer c : input.getCarts()) {
            CartDTO item = cartService.getById(c);
            //tong tien cua moi sp
            total += item.getTotalAmount();
            output.getBooksList().add(item);
        }
        //set lai tong tien cho ouput
        output.setTotal(total);
        ModelAndView mav = new ModelAndView("web/checkout.html");
        mav.addObject("items", output);
        mav.addObject("user", userService.findByEmailAndIsEnable(principal.getName()));
        return mav;
    }

    @PostMapping("/dat-hang")
    public ModelAndView checkOut(@ModelAttribute("order") OrderInput order, Principal principal) {
        ModelAndView mav = new ModelAndView("web/cart.html");
        List<OrderlineDTO> orderLineList = new ArrayList<>();
        double total = 0;
        //ds id cac sp
        for (Integer c : order.getCarts()) {
            CartDTO cart = cartService.getById(c);
            //tong tien cua moi sp
            total += cart.getTotalAmount();
            //tao orderline
            OrderlineDTO line = new OrderlineDTO();
            line.setBook(cart.getBook());
            line.setQuantity(cart.getQuantity());
            line.setTotalPrice(cart.getTotalAmount());

            //thêm line vào list (lát set cho order)
            //xóa luôn sp đã đặt trong cart
            orderLineList.add(line);
            cartService.deleteCart(cart);

            //tăng quantity cho book
            BookDTO book = bookService.findById(cart.getBook().getId());
            //cart.quantity là số lượng sách mà người dùng đặt mua
            bookService.updateQuantity(book.getQuantitySold() + cart.getQuantity(), cart.getBook().getId());
        }
        //tạo order mới
        OrderDTO newOrder = new OrderDTO();
        newOrder.setCreatedAt(LocalDate.now());
        //dl lay tu model attribute
        newOrder.setAddress(order.getAddress());
        newOrder.setName(order.getName());
        newOrder.setPhone(order.getPhone());
        newOrder.setNote(order.getNote());
        //set list orderline cho order
        newOrder.setOrderlines(orderLineList);
        newOrder.setUser(userService.findByEmailAndIsEnable(principal.getName()));
        newOrder.setStatus("Đang xử lý..");
        newOrder.setTotalPrice(total + 15000);
        OrderDTO result = orderService.save(newOrder);

        //chạy list orderline de set lai orderid
        for (OrderlineDTO l : orderLineList) {
            l.setOrder(result);
            orderlineService.save(l);
        }
        mav.addObject("message", "Đặt hàng thành công. Vui lòng truy cập trang đơn hàng để theo dõi.");
        return mav;
    }

    @GetMapping("/don-hang")
    public ModelAndView checkOrder(Principal principal) {
        ModelAndView mav = new ModelAndView("web/checkOrder.html");
        if (principal == null) return new ModelAndView("web/signin.html");
        mav.addObject("orders", orderService.findAllByUserId(userService.findByEmailAndIsEnable(principal.getName()).getUserID()));
        return mav;
    }
}
