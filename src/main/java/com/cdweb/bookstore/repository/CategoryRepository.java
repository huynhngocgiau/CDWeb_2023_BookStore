package com.cdweb.bookstore.repository;

import com.cdweb.bookstore.entities.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<CategoryEntity, Integer> {
    public CategoryEntity findByCategoryID(int id);

    @Transactional
    @Modifying
    public void deleteByCategoryID(int id);

    @Transactional
    @Modifying
    @Query(value = "update category set name=:name, code=:code where categoryID=:id", nativeQuery = true)
    public void updateCategory(@Param("id") int id,
                               @Param("name") String name,
                               @Param("code") String code);
    public List<CategoryEntity> findFirst10ByOrderByCategoryIDAsc();
}
