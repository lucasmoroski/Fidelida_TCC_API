package com.ufpr.tcc.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ufpr.tcc.api.bean.Produto;
import com.ufpr.tcc.api.service.BaseService;
import com.ufpr.tcc.api.service.ProdutoService;

@RestController
@RequestMapping("api/produtos")
public class ProdutoController extends BaseRestController<Produto, Long> {

	@Autowired
	private ProdutoService produtoservice;
	
	@Override
	protected BaseService<Produto, Long> getService() {
		return this.produtoservice;
	}
}
