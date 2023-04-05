package com.cdweb.bookstore.api;

import com.cdweb.bookstore.dto.CartDTO;

import java.util.ArrayList;
import java.util.List;

public class CartOutput {
    private double total;
    private List<CartDTO> booksList = new ArrayList<>();

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public List<CartDTO> getBooksList() {
        return booksList;
    }

    public void setBooksList(List<CartDTO> booksList) {
        this.booksList = booksList;
    }

    public double getTotalMoney() {
        //15k ship
        return total + 15000;
    }
}
