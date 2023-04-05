package com.cdweb.bookstore.dto;

import com.cdweb.bookstore.entities.CategoryEntity;
import jakarta.persistence.Column;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

<<<<<<< Updated upstream
import java.sql.Date;
import java.sql.Timestamp;
=======
>>>>>>> Stashed changes
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

public class BookDTO {
    private int id;

    private String title;

    private int year_public;

    private int total_page;

    private String publisher;

    private String description;

    private int price;

    private double discount_percent;

    private int quantitySold;

    private CategoryDTO category;
//    private List<BookImageDTO> images = new ArrayList<>();

    //getter & setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getYear_public() {
        return year_public;
    }

    public void setYear_public(int year_public) {
        this.year_public = year_public;
    }

    public int getTotal_page() {
        return total_page;
    }

    public void setTotal_page(int total_page) {
        this.total_page = total_page;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public double getDiscount_percent() {
        return discount_percent;
    }

    public void setDiscount_percent(int discount_percent) {
        this.discount_percent = discount_percent;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        this.quantitySold = quantitySold;
    }

    public CategoryDTO getCategory() {
        return category;
    }

    public void setCategory(CategoryDTO category) {
        this.category = category;
    }

//    public List<BookImageDTO> getImages() {
//        return images;
//    }
//
//    public void setImages(List<BookImageDTO> images) {
//        this.images = images;
//    }

    public String getDiscountPrice() {
        double percent = this.discount_percent / 100;
        double discountPrice = this.price * (1 - percent);
        DecimalFormat df = new DecimalFormat("###,###,###");
        return df.format(discountPrice) + " VNĐ";

    }

    public double getDiscount() {
        double percent = this.discount_percent / 100;
        double discountPrice = this.price * (1 - percent);
        return discountPrice;

    }

    public String formatPrice(int price) {
        DecimalFormat df = new DecimalFormat("###,###,###");
        return df.format(price) + " VNĐ";
    }

    public String getPriceFormat() {
        DecimalFormat df = new DecimalFormat("###,###,###");
        return df.format(this.price) + " VNĐ";
    }

    public String getPercentFormat() {
        return "-" + this.discount_percent + "%";
    }
}
