package com.cdweb.bookstore.service;

import com.cdweb.bookstore.dto.CategoryDTO;
import com.cdweb.bookstore.entities.CategoryEntity;

import java.util.List;

public interface ICategoryService {
    public List<CategoryDTO> findAll();

    public CategoryDTO findById(int id);

    public void save(CategoryDTO categoryDTO);

    public void deleteByCatId(int id);

    public void updateCat(CategoryDTO cat);
    public List<CategoryDTO> findTenCat();
}
