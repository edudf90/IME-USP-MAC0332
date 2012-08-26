package dao;

import java.util.List;

import loja.Pedido;

import org.hibernate.Session;
import org.hibernate.Transaction;

import session.CriadorDeSession;
import br.com.caelum.vraptor.ioc.Component;


@Component
public class PedidoDAO {

	private final Session session;
	
	public PedidoDAO() {
		this.session = CriadorDeSession.getSession();
	}

	public void salva(Pedido pedido) {
		Transaction tx = this.session.beginTransaction();
		this.session.save(pedido);
		tx.commit();
	}
	
	@SuppressWarnings("unchecked")
	public List<Pedido> listaTudo(){
		return this.session.createCriteria(Pedido.class).list();
	}

}
