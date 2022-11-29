package com.ufpr.tcc.api.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.ufpr.tcc.api.bean.Fidelidade;
import com.ufpr.tcc.api.repository.FidelidadeRepository;
import com.ufpr.tcc.api.service.FidelidadeService;

@Service
public class FidelidadeServiceImpl extends BaseServiceImpl<Fidelidade, Long> implements FidelidadeService{

	@Autowired
	private FidelidadeRepository fidelidaderepository;
	
	@Override
	protected JpaRepository<Fidelidade, Long> getRepository() {
		// TODO Auto-generated method stub
		return this.fidelidaderepository;
	}

}
