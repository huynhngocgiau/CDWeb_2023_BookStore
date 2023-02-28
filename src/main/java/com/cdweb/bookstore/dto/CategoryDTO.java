package com.cdweb.bookstore.dto;

import java.sql.Date;

public class CategoryDTO {
    private int categoryID;
    private String code;
    private String name;
//    private Date created_at;
//    private Date updated_at;

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

//    public Date getCreated_at() {
//        return created_at;
//    }
//
//    public void setCreated_at(Date created_at) {
//        this.created_at = created_at;
//    }
//
//    public Date getUpdated_at() {
//        return updated_at;
//    }
//
//    public void setUpdated_at(Date updated_at) {
//        this.updated_at = updated_at;
//    }

    @Override
    public String toString() {
        return "CategoryDTO{" +
                "catId=" + categoryID +
                ", code='" + code + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
