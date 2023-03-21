package com.cdweb.bookstore.repository;

import com.cdweb.bookstore.entities.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UsersRepository extends JpaRepository<UserEntity, Integer> {
    public UserEntity findByEmailIgnoreCaseAndIsEnable(String email, boolean isEnable);

    @Query(value = "select confirm_token from users where userID=?1", nativeQuery = true)
    public String getConfirmTokenById(int id);

    public UserEntity findByEmailIgnoreCase(String email);

    public UserEntity findByUserID(int id);
}
