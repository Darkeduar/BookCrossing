package com.github.darkeduar.book;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {

    List<Book> findAllByUserId(Long id);
    List<Book> findAllByCategoryId(Long id);
    List<Book> findAllByForExchangeIsTrue();

}
