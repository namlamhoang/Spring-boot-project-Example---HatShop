package com.springboot.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.model.Authorities;

public interface AuthoritiesDao extends JpaRepository<Authorities, String> {
	
	@Query(value = "select * from authorities a where a.username = ?1 and authority = 'ROLE_EMPLOYEE'",nativeQuery = true)
	Authorities getAuthEmployee(String username);

	@Modifying
	@Transactional
	@Query(value = "delete from authorities a where a.username = ?1",nativeQuery = true)
	void deleteAuth(String username);
	
	@Modifying
    @Query(value = "insert into authorities (username,authority) values (:id,:password)", nativeQuery = true)
    @Transactional
    void createAuth(@Param("id") String userName, @Param("password") String password);

}
