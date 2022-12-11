package com.devti.aula.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devti.aula.model.Cidade;
import com.devti.aula.model.Cliente;
import com.devti.aula.repositories.ClienteRepository;

@Service
public class ClienteService {

	@Autowired
	ClienteRepository rep;
	
	
	
	
	public void excluir(Integer id) {
		Cliente clienteExcluir = rep.findById(id).get();
		if(clienteExcluir != null) {
			rep.delete(clienteExcluir);
		}
	}
	

	
	
	
	public Cliente incluir(Cliente c) {
			return rep.save(c);
	}
	public Cliente alterar(Cliente c) {
		return rep.save(c);
	}
	
	
	public List<Cliente> listarTodos(){
		return rep.findAll();
	}
	
	public List<Cliente> buscarPorCidade(Cidade c) {
		return rep.findByCidade(c);
	}
}
