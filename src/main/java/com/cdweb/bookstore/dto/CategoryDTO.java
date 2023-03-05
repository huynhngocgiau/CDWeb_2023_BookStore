package com.cdweb.bookstore.dto;

import java.sql.Date;

public class CategoryDTO {
    private int categoryID;
    private String code;
    private String name;

    public int getCategoryId() {
        return categoryID;
    }

    public void setCategoryId(int catId) {
        this.categoryID = catId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
