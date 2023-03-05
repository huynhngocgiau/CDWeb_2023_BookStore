package com.cdweb.bookstore.repository;

import com.cdweb.bookstore.dto.BookDTO;
import com.cdweb.bookstore.entities.BookEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookRepository extends JpaRepository<BookEntity, Integer> {
    //tìm tất cả saách theo danh mục, phân trang
    public Page<BookEntity> findByCategoryCode(String code, Pageable pageable);
    //tìm tất cả sách, có phân trang
    public Page<BookEntity> findAll(Pageable pageable);
    //đếm số sách theo danh mục
    public int countAllByCategoryCode(String code);
    //đếm tất cả sách
    public int countAllByActive(boolean isActive);
    public List<BookEntity> findFirst8ByActiveAndHot(boolean isActive, boolean isHot);

    public List<BookEntity> findFirst8ByActiveAndNews(boolean isActive, boolean isNew);
}
