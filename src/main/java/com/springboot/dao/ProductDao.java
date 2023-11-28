package com.springboot.dao;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.model.Product;

public interface ProductDao extends JpaRepository<Product,Integer> {
	
	@Query(value = "SELECT * FROM product p WHERE p.is_delete = 0", nativeQuery = true)
	List<Product> listProduct();

	@Query(value = "SELECT * FROM product p WHERE p.product_name LIKE ?1 and p.is_delete = 0", nativeQuery = true)
	List<Product> listProductByName(String Name);
	
	@Query(value = "SELECT * FROM product p WHERE p.category_code = ?1 and p.is_delete = 0", nativeQuery = true)
	List<Product> listProductByCategory(String Category);
	
	@Query(value = "SELECT * FROM product p WHERE p.branch_code = ?1 and p.is_delete = 0", nativeQuery = true)
	List<Product> listProductByBranch(String Branch);
	
	@Query(value = "SELECT * FROM product p WHERE p.brand_code = :b or p.category_code = :c or p.product_name like :key and p.is_delete = 0 ", nativeQuery = true)
	List<Product> searchFliter(@Param("key") String keyName, @Param("b") String brand, @Param("c") String category);
	
}
