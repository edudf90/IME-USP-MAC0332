package loja;


import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Pedido {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String cliente;
	private String data;
	private BigInteger total;
	private BigInteger qntItens;

	@OneToMany (mappedBy = "pedido", cascade = CascadeType.ALL)
	private List<Item> lista = new ArrayList<Item>();
	
	public String getCliente() {
		return cliente;
	}

	public void setCliente(String cliente) {
		this.cliente = cliente;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<Item> getLista() {
		return lista;
	}

	public void setLista(List<Item> lista){
		this.lista = lista;
	}
	
	public void calculaQntItens(){
		qntItens = BigInteger.valueOf(0);
		for (Item item:lista){
			if (item.getPedido().getId() == id)
				qntItens = qntItens.add(BigInteger.valueOf(item.getQuantidade()));
		}
	}
	
	public void calculaValorTotal (){
		total = BigInteger.valueOf(0);
		for (Item item:lista){
			if (item.getPedido().getId() == id)
				total = total.add(BigInteger.valueOf(item.getQuantidade()*item.getValorUni()));
		}
	}

	public BigInteger getTotal() {
		return total;
	}

	public BigInteger getQntItens() {
		return qntItens;
	}
}
