package com.ufpr.tcc.api.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.ufpr.tcc.api.bean.Cliente;
import com.ufpr.tcc.api.repository.ClienteRepository;
import com.ufpr.tcc.api.service.ClienteService;

@Service
public class ClienteServiceImpl extends BaseServiceImpl<Cliente, Long> implements ClienteService{

	@Autowired
	private ClienteRepository clienterepository;
	
	@Override
	protected JpaRepository<Cliente, Long> getRepository() {
		
		return this.clienterepository;
	}

}
