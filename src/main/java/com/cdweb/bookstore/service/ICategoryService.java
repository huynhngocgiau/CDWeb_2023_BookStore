package com.cdweb.bookstore.service;

import com.cdweb.bookstore.dto.CategoryDTO;

import java.util.List;

public interface ICategoryService {
    public List<CategoryDTO> findAll();
}
