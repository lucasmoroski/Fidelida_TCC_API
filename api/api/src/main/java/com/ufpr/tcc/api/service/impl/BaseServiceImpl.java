package com.ufpr.tcc.api.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ufpr.tcc.api.service.BaseService;

public abstract class BaseServiceImpl<TENTITY, TID> implements BaseService<TENTITY, TID> {
	
	
	protected abstract JpaRepository<TENTITY, TID> getRepository();
	
	@Override
	public List<TENTITY> buscarTodos() throws Exception {
		List<TENTITY>lista = new ArrayList<>();
		lista = this.getRepository().findAll();
		return lista;
	}
	
	@Override
	public TENTITY save(TENTITY t) throws Exception {
		
		return this.getRepository().save(t);
	}
	
	@Override
	public TENTITY update(TENTITY t) throws Exception {
		return this.getRepository().save(t);
	}
	
	@Override
	public void delete(TID id) throws Exception {
		Optional<TENTITY> t = this.getRepository().findById(id);
		this.getRepository().delete(t.get());
	}
	
	@Override
	public TENTITY buscarPorId(TID id) throws Exception {
		
		return this.getRepository().findById(id).get();
	}
	
}
