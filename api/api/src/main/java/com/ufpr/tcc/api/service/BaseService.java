package com.ufpr.tcc.api.service;

import java.util.List;

public interface BaseService<TENTITY, TID> {
	TENTITY save(TENTITY t)throws Exception;
	void delete(TID id)throws Exception;
	TENTITY update(TENTITY t)throws Exception;
	TENTITY buscarPorId(TID id)throws Exception;
	List<TENTITY>buscarTodos()throws Exception;
}
