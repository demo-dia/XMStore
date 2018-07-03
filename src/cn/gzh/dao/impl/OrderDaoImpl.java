package cn.gzh.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.gzh.dao.OrderDao;
import cn.gzh.domain.Order;
import cn.gzh.domain.User;

public class OrderDaoImpl extends HibernateDaoSupport implements OrderDao {

	@Override
	public Integer save(Order order) {
		return 	(Integer) this.getHibernateTemplate().save(order);
	}
	
	@Override
	public Order findByOid(Integer oid,User user) {
		String hql = "from Order o where o.oid=? and o.user = ?";
		return (Order) this.getHibernateTemplate().find(hql,oid,user).get(0);
	}

	@Override
	public void update(Order order) {
		this.getHibernateTemplate().update(order);
	}

	@Override
	public Double sumMoleyTotal(User user) {
		String hql = "select sum(total) from Order where user=? and state>1";
		List result =  this.getHibernateTemplate().find(hql,user);
		if(result.size()>0){
			return (Double) result.get(0);
		}
		return 0d;
	}

	@Override
	public int countOrders(User user,int state) {
		String hql = "select count(*) from Order where user=? and state>?";
		List result =  this.getHibernateTemplate().find(hql,user,state);
		if(result.size()>0){
			return Integer.parseInt( result.get(0).toString());
		}
		return 0;
	}
	

}
