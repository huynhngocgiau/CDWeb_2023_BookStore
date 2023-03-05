package com.cdweb.bookstore.service.impl;

import com.cdweb.bookstore.converter.BookConverter;
import com.cdweb.bookstore.dto.BookDTO;
import com.cdweb.bookstore.entities.BookEntity;
import com.cdweb.bookstore.repository.BookRepository;
import com.cdweb.bookstore.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class BookServiceImp implements IBookService {
    @Autowired
    private BookRepository bookRepo;
    @Autowired
    private BookConverter bookConverter;


    @Override
    public List<BookDTO> findByCategoryCode(String categoryCode, Pageable pageable) {
        List<BookDTO> results= new ArrayList<>();
        for (BookEntity b: bookRepo.findByCategoryCode(categoryCode, pageable).getContent()) {
            results.add(bookConverter.toDTO(b));
        }
        return results;
    }

    @Override
    public List<BookDTO> findAll(Pageable pageable) {
        List<BookDTO> results= new ArrayList<>();

        //hàm findAll(pageable) sẽ trả về Page<BookEntity>, để chuyển Page thành List thì dùng hàm getContent()
        for (BookEntity b: bookRepo.findAll(pageable).getContent()) {
            results.add(bookConverter.toDTO(b));
        }
        return results;
    }

    @Override
    public int countByCategory(String code) {
        return bookRepo.countAllByCategoryCode(code);
    }

    public int countAll(boolean isActive){
        return bookRepo.countAllByActive(isActive);
    }

    @Override
    public List<BookDTO> findHotBook(boolean isActive, boolean isHot) {
        List<BookDTO> results= new ArrayList<>();
        for (BookEntity b: bookRepo.findFirst8ByActiveAndHot(isActive, isHot)) {
            results.add(bookConverter.toDTO(b));
        }
        return results;
    }

    @Override
    public List<BookDTO> findNewBook(boolean isActive, boolean isNew) {
        List<BookDTO> results= new ArrayList<>();
        for (BookEntity b: bookRepo.findFirst8ByActiveAndNews(isActive, isNew)) {
            results.add(bookConverter.toDTO(b));
        }
        return results;
    }
}
