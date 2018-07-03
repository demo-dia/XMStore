package cn.gzh.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.gzh.dao.CategoryDao;
import cn.gzh.domain.Category;

public class CategoryDaoImpl extends HibernateDaoSupport implements CategoryDao {

	public List<Category> findAll() {
		return	this.getHibernateTemplate().find("from Category");
	}

}
