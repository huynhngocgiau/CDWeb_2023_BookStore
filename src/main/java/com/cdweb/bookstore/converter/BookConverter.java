package com.cdweb.bookstore.converter;

import com.cdweb.bookstore.dto.BookDTO;
import com.cdweb.bookstore.entities.BookEntity;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BookConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BookEntity toEntity(BookDTO bookDto) {
        return modelMapper.map(bookDto, BookEntity.class);
    }

    public BookDTO toDTO(BookEntity bookEntity) {
        return modelMapper.map(bookEntity, BookDTO.class);
    }
}
