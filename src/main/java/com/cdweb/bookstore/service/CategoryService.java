package com.cdweb.bookstore.service;

import com.cdweb.bookstore.dto.CategoryDTO;

import java.util.List;

public interface CategoryService {
    public List<CategoryDTO> findAll();
}
