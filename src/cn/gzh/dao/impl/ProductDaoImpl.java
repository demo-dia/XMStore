package cn.gzh.dao.impl;

import java.sql.SQLException;
import java.util.List;


import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.gzh.dao.ProductDao;
import cn.gzh.domain.Product;
import cn.gzh.util.MyHibernateCallback;

public class ProductDaoImpl extends HibernateDaoSupport implements ProductDao {

	@Override
	public List<Product> findHot(Integer limit) {
		String hql = "from Product where is_hot>0";
		return	this.getHibernateTemplate().execute(new MyHibernateCallback<Product>(hql, null, 0, limit));
	}

	@Override
	public List<Product> findNew(Integer limit) {
		String hql = "from Product p order by  p.pdate desc";
		
		return this.getHibernateTemplate().execute(new MyHibernateCallback<Product>(hql,null,0,limit));
	}

	@Override
	public Integer countByCategory(Integer cid) {
		String hql = "select count(*) from Product p join p.categorySecond cs where  cs.category.cid=?";
		List<Long> count =this.getHibernateTemplate().find(hql,cid);
		return  count.get(0).intValue();
	}

	@Override
	public Integer countByCategorySecond(Integer csid) {
		String hql = "select count(*) from Product p join p.categorySecond cs where  cs.csid=?";
		List<Long> count =this.getHibernateTemplate().find(hql,csid);
		return  count.get(0).intValue();
	}

	@Override
	public List<Product> findByCategory(Integer cid, int i, Integer limit) {
		String hql = "select p from Product p join p.categorySecond cs where  cs.category.cid=?";
		
		List<Product> list= this.getHibernateTemplate().execute(new MyHibernateCallback<Product>(hql, new Object[]{cid}, i, limit));
		return list;
	}

	@Override
	public List<Product> findByCategorySecond(Integer csid, int i, Integer limit) {
		String hql = "select p from Product p join p.categorySecond cs where cs.csid=?";
		
		List<Product> list=this.getHibernateTemplate().execute(new MyHibernateCallback<Product>(hql, new Object[]{csid}, i, limit));
		return list;
	}

	@Override
	public Product findByPid(Integer pid) {
		return  this.getHibernateTemplate().get(Product.class, pid);
		
	}

	@Override
	public void saveOrUpdate(Product product) {
		this.getHibernateTemplate().saveOrUpdate(product);
	}

}
