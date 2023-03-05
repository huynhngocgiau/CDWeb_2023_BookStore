package com.cdweb.bookstore.service;

import com.cdweb.bookstore.dto.BookDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IBookService {
    public List<BookDTO> findByCategoryCode(String categoryCode, Pageable pageable);
    public List<BookDTO> findAll(Pageable pageable);
    public int countByCategory(String code);
    public int countAll(boolean isActive);
    public List<BookDTO> findHotBook(boolean isActive, boolean isHot);
    public List<BookDTO> findNewBook(boolean isActive,boolean isNew);
}
