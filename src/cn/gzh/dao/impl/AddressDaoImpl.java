package cn.gzh.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.gzh.dao.AddressDao;
import cn.gzh.domain.Address;
import cn.gzh.domain.User;

public class AddressDaoImpl extends HibernateDaoSupport implements AddressDao {

	public void saveOrUpdate(Address address) {
		this.getHibernateTemplate().saveOrUpdate(address);
	}

	public List<Address> findAllAddress(User user) {
		String hql = "from Address a where a.user=?";
		return 	this.getHibernateTemplate().find(hql,user);
	}

	@Override
	public  List<Address> findDefault(User user) {
		String hql = "from Address a where a.isDefault =1 and a.user=?";
		return this.getHibernateTemplate().find(hql,user);
	}

	@Override
	public Address findByAid(User user, Integer aid) {
		String hql = "from Address a where a.aid=? and a.user=?";
		List<Address> address = this.getHibernateTemplate().find(hql,aid,user);
		if(address.size()>0){
			return address.get(0);
		}
		return null;
	}

	@Override
	public void deleteAddress(Integer aid, User user) {
		Address address = this.getHibernateTemplate().get(Address.class, aid); //得到要删除的收货地址对象
		if(address.getUser().getUid()==user.getUid()){
			this.getHibernateTemplate().delete(address);
		}
	}

}
