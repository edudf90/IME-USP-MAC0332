package testes;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import loja.Item;
import loja.Pedido;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

public class TestaValorTotal {

	private static Pedido pedido;
	private static List<Item> testelista;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		pedido = new Pedido();
		testelista = new ArrayList<Item>();
	}

	@Test
	public void testCalculaValorTotal() {		
		pedido.setLista(testelista);
		pedido.calculaValorTotal();	
		Assert.assertEquals(BigInteger.valueOf(0), pedido.getTotal());	//Lista vazia
		
		Item a = new Item();
		a.setPedido(pedido);
		a.setQuantidade(1);
		a.setValorUni(42);
		testelista.add(a);
		pedido.setLista(testelista);
		pedido.calculaValorTotal();
		Assert.assertEquals(BigInteger.valueOf(42), pedido.getTotal());  //Lista com apenas 1 item com quantidade 1
		
		a.setQuantidade(2);
		testelista.clear();
		testelista.add(a);
		pedido.setLista(testelista);
		pedido.calculaValorTotal();
		Assert.assertEquals(BigInteger.valueOf(84), pedido.getTotal());  //Lista com apenas 1 item com quantidade maior que 1
		
		Item b = new Item();
		b.setPedido(pedido);
		b.setQuantidade(1);
		b.setValorUni(50);
		a.setQuantidade(1);
		testelista.clear();
		testelista.add(a);
		testelista.add(b);
		pedido.setLista(testelista);
		pedido.calculaValorTotal();
		Assert.assertEquals(BigInteger.valueOf(92), pedido.getTotal());  //Lista com apenas 2 itens com quantidade 1
		
		b.setQuantidade(4);
		a.setQuantidade(3);
		testelista.clear();
		testelista.add(a);
		testelista.add(b);
		pedido.setLista(testelista);
		pedido.calculaValorTotal();
		Assert.assertEquals(BigInteger.valueOf(326), pedido.getTotal());  //Lista com apenas 2 itens com quantidade maior que 1
		
	}

}
