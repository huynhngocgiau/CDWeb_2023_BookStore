package com.cdweb.bookstore.dto;

public class CartDTO {
    private int cartID;
    private int quantity;
    private UserDTO user;
    private BookDTO book;

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public UserDTO getUser() {
        return user;
    }

    public void setUser(UserDTO user) {
        this.user = user;
    }

    public BookDTO getBook() {
        return book;
    }

    public void setBook(BookDTO book) {
        this.book = book;
    }

    public double getTotalAmount() {
        return this.quantity * book.getPrice() * (1 - book.getDiscount_percent() / 100);
    }

}