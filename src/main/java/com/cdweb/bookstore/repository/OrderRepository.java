package com.cdweb.bookstore.repository;

import com.cdweb.bookstore.entities.OrderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<OrderEntity, Integer> {
    public List<OrderEntity> findAllByUserUserID(int id);

    public OrderEntity findByOrderID(int id);

    @Transactional
    @Modifying
    public void deleteByOrderID(int id);

}
