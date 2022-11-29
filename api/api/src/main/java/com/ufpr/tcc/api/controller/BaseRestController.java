package com.ufpr.tcc.api.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.ufpr.tcc.api.service.BaseService;

public abstract class BaseRestController<TENTITY,TID> {
	
	protected abstract BaseService<TENTITY,TID> getService();
	
	@GetMapping
	public ResponseEntity<List<TENTITY>> listarTodos(){
		try {
			return ResponseEntity.ok(this.getService().buscarTodos());
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping(value = "/{id}")
	public ResponseEntity<TENTITY>buscarPorId(@PathVariable(name = "id") TID id){
		try {
			return ResponseEntity.ok(this.getService().buscarPorId(id));
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PostMapping()
	public ResponseEntity<TENTITY>salvar(@RequestBody TENTITY t){
		try {
			return ResponseEntity.ok(this.getService().save(t));
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PutMapping
	public ResponseEntity<TENTITY>update(@RequestBody TENTITY t){
		try {
			return ResponseEntity.ok(this.getService().save(t));
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	} 
	
	@DeleteMapping(value = "/{id}")
	public ResponseEntity<TENTITY>delete(@PathVariable(name = "id") TID id){
		try {
			this.getService().delete(id);
			return ResponseEntity.ok(null);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	} 
	
}
