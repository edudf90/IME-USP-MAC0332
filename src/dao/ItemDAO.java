package dao;

import java.util.List;

import loja.Item;

import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.caelum.vraptor.ioc.Component;

import session.CriadorDeSession;

@Component
public class ItemDAO {
	
private final Session session;
	
	public ItemDAO() {
		this.session = CriadorDeSession.getSession();
	}

	public void salva(Item item) {
		Transaction tx = this.session.beginTransaction();
		this.session.save(item);
		tx.commit();
	}
	
	@SuppressWarnings("unchecked")
	public List<Item> listaTudo(){
		return this.session.createCriteria(Item.class).list();
	}
}
