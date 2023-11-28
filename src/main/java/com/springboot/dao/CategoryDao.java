package com.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.springboot.model.Category;


public interface CategoryDao extends JpaRepository<Category,Integer> {

	@Query(value = "SELECT * FROM category c WHERE c.is_delete = 0", nativeQuery = true)
	List<Category> getCategoryList();
}
