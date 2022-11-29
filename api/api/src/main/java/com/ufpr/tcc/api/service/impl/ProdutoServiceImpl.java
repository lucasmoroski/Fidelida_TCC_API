package com.ufpr.tcc.api.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.ufpr.tcc.api.bean.Produto;
import com.ufpr.tcc.api.repository.ProdutoRepository;
import com.ufpr.tcc.api.service.ProdutoService;

@Service
public class ProdutoServiceImpl extends BaseServiceImpl<Produto, Long> implements ProdutoService{

	@Autowired
	private ProdutoRepository produtorepository;
	

	@Override
	public JpaRepository<Produto, Long> getRepository() {
		
		return produtorepository;
	}
}
