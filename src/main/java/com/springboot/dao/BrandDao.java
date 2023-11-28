package com.springboot.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.springboot.model.Brand;


public interface BrandDao extends JpaRepository<Brand,Integer> {

	@Query(value = "SELECT * FROM brand b WHERE b.is_delete = 0", nativeQuery = true)
	List<Brand> getBrandList();
}
