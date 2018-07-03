package cn.gzh.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.gzh.dao.CityDao;
import cn.gzh.domain.City;

public class CityDaoImpl extends HibernateDaoSupport implements CityDao  {

	public List<City> findByLevel(int i) {
		String hql = " from City  where level=?";
		List<City> citys =  this.getHibernateTemplate().find(hql,i);
		return citys;
	}

	public List<City> findByParentID(Integer id) {
		String hql = " from City  where parent_id = ?";
		List<City> citys = this.getHibernateTemplate().find(hql,id);
		return citys;
	}

	public String findNameById(Integer province) {
		City city = 	this.getHibernateTemplate().get(City.class, province);
		if(city!=null){
			return city.getName();
		}
		return null;
	}

}
