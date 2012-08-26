package loja;

import java.math.BigInteger;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Item {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="pedido_id")
	private Pedido pedido;
	
	private String descricao;
	private int quantidade;
	private int valorUni;
	private BigInteger total;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Pedido getPedido() {
		return pedido;
	}
	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}	
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public int getValorUni() {
		return valorUni;
	}
	public void setValorUni(int valorUni) {
		this.valorUni = valorUni;
	}
	
	public void calculaValorTotal (){
		total = BigInteger.valueOf(0);
		total = total.add(BigInteger.valueOf(quantidade*valorUni));		
	}
	public BigInteger getTotal() {
		return total;
	}
	public void setTotal(BigInteger total) {
		this.total = total;
	}
}
