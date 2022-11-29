package com.ufpr.tcc.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ufpr.tcc.api.bean.Fidelidade;
import com.ufpr.tcc.api.service.BaseService;
import com.ufpr.tcc.api.service.FidelidadeService;

@RestController
@RequestMapping("api/fidelidades")
public class FidelidadeController extends BaseRestController<Fidelidade, Long>{

	@Autowired
	private FidelidadeService fidelidadeservice;
	@Override
	protected BaseService<Fidelidade, Long> getService() {
		// TODO Auto-generated method stub
		return this.fidelidadeservice;
	}

}
