package com.ufpr.tcc.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ufpr.tcc.api.bean.Cliente;
import com.ufpr.tcc.api.service.BaseService;
import com.ufpr.tcc.api.service.ClienteService;

@RestController
@RequestMapping("api/clientes")
public class ClienteController extends BaseRestController<Cliente, Long>{

	@Autowired
	private ClienteService clienteservice;
	
	@Override
	protected BaseService<Cliente, Long> getService() {
		return this.clienteservice;
	}

}
