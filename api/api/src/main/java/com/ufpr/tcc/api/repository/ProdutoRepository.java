package com.ufpr.tcc.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.ufpr.tcc.api.bean.Produto;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long>{

}