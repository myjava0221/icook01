package _01_register.service.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _01_register.dao.MemberDao;
import _01_register.model.MemberBean;
import _01_register.service.MemberService;
import _04_ShoppingCart.model.OrderBean;

//@Transactional
//這邊加上@Transactional代表此class內的所有method都用交易模式
@Service
public class MemberServiceImpl implements MemberService {

	MemberDao  dao ;
	SessionFactory factory;
	
	
	@Autowired
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public MemberServiceImpl() {
//		this.dao = new MemberDaoImpl_Hibernate();
//		this.factory = HibernateUtils.getSessionFactory();
	}

	@Transactional
	@Override
	public int saveMember(MemberBean mb) {
		int n = 0;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			n = dao.saveMember(mb);
//			tx.commit();
//		}catch(Exception ex) {
//			if(tx!=null) tx.rollback();
//			throw new RuntimeException(ex);
//		}
		return n;
	}

	@Transactional
	@Override
	public boolean idExists(String id) {
		boolean exist = false;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			exist = dao.idExists(id);
//			tx.commit();
//		}catch(Exception ex) {
//			if(tx!=null) tx.rollback();
//			throw new RuntimeException(ex);
//		}
		return exist;
	}

	@Transactional
	@Override
	public MemberBean queryMember(String id) {
		MemberBean mb = null;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			mb = dao.queryMember(id);
//			tx.commit();
//		}catch(Exception ex) {
//			if(tx!=null) tx.rollback();
//			throw new RuntimeException(ex);
//		}
		return mb;
	}

	@Transactional
	@Override
	public void updateUnpaidOrderAmount(OrderBean ob) {
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			dao.updateUnpaidOrderAmount(ob);
//			tx.commit();
//		}catch(Exception ex) {
//			if(tx!=null) tx.rollback();
//			throw new RuntimeException(ex);
//		}
	}
	
	@Transactional
	public MemberBean checkIdPassword(String userId, String password) {
		MemberBean mb = null;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			mb = dao.checkIdPassword(userId, password);
//			tx.commit();
//		}catch(Exception ex) {
//			if(tx!=null) tx.rollback();
//			throw new RuntimeException(ex);
//		}
		return mb;
	}
}
