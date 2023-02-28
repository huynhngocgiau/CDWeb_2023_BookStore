package com.cdweb.bookstore.service.impl;

import com.cdweb.bookstore.converter.CategoryConverter;
import com.cdweb.bookstore.dto.CategoryDTO;
import com.cdweb.bookstore.entities.CategoryEntity;
import com.cdweb.bookstore.repository.CategoryRepository;
import com.cdweb.bookstore.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class CategoryServiceImp implements CategoryService {
    @Autowired
    private CategoryRepository catRepo;
    @Autowired
    private CategoryConverter catConverter;
    @Override
    public List<CategoryDTO> findAll() {
        //repository sẽ lây ra tất cả các category trong dtb
        List<CategoryEntity> catEntities= catRepo.findAll();
        List<CategoryDTO> results= new ArrayList<>();

        //tiến hành convert từ entity sang dto rồi add vào list
        for (CategoryEntity c: catEntities) {
            results.add(catConverter.toDTO(c));
        }
        return results;
    }
}
