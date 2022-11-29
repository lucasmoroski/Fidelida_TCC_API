package com.ufpr.tcc.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ufpr.tcc.api.bean.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Long>{

}
