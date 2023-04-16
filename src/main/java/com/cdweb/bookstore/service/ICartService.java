package com.cdweb.bookstore.service;

import com.cdweb.bookstore.dto.CartDTO;
import com.cdweb.bookstore.entities.CartEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface ICartService {
    public CartDTO addProduct(String email, int bookId, int quantity);

    public List<CartDTO> getBooks(String email);

    public List<CartDTO> deleteBook(String email, int bookId);

    public List<CartDTO> updateQuantity(String email, int bookId, int quantity);

    public CartDTO getById(int id);

    public void deleteCart(CartDTO cart);
}
