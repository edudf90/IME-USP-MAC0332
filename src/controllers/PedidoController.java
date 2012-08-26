package controllers;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import dao.ItemDAO;
import dao.PedidoDAO;

import loja.Item;
import loja.Pedido;

@Resource
public class PedidoController {
	
	private PedidoDAO dao;
	private ItemDAO idao;
	private Result result;


	public PedidoController(PedidoDAO dao, ItemDAO idao, Result result) {
		this.dao = dao;
		this.idao = idao;
		this.result = result;
	}

	public List<Pedido> lista() {
		return dao.listaTudo();
	}

	public void adiciona(Pedido pedido){
		for(Item item:pedido.getLista()){
			item.setPedido(pedido);
			item.calculaValorTotal();
		}
		pedido.calculaQntItens();
		pedido.calculaValorTotal();
		dao.salva(pedido);
		result.redirectTo(this).lista();
	}
	
	public void cadastro() {
	}
	
	public Pedido detalhes(Pedido pedido) {
		List<Item> l = new ArrayList<Item>();
		for (Item item : idao.listaTudo()){
			if(pedido.getId().equals(item.getPedido().getId()))
				l.add(item);
		}
		pedido.setLista(l);
		return pedido;
	}
}
