package com.cdweb.bookstore.service;

import com.cdweb.bookstore.dto.OrderlineDTO;
import com.cdweb.bookstore.repository.OrderlineRepository;
import org.springframework.beans.factory.annotation.Autowired;

public interface IOrderlineService {
    public void save(OrderlineDTO orderLine);
}
