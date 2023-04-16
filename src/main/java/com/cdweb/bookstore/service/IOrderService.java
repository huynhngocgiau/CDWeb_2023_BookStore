package com.cdweb.bookstore.service;

import com.cdweb.bookstore.dto.OrderDTO;

import java.util.List;

public interface IOrderService {
    public OrderDTO save(OrderDTO order);

    public List<OrderDTO> findAll(int id);
}
