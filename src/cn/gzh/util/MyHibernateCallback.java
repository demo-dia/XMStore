package cn.gzh.util;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import java.sql.SQLException;
import java.util.List;

/**
 * HIbernate工具,适合HQL+分页查询+HibernateDaoTemplate使用
 * @param <T>
 *
 */
public class MyHibernateCallback<T> implements HibernateCallback<List<T>>{
	//HQL语句
	private String hql;
	//参数内容
	private Object[] objs;
	//起始查询索引
	private Integer firstResult;
	//单次查询数量
	private Integer maxResult;

	public MyHibernateCallback(String hql, Object[] objs, Integer firstResult,
			Integer maxResult) {
		super();
		this.hql = hql;
		this.objs = objs;
		this.firstResult = firstResult;
		this.maxResult = maxResult;
	}

	@Override
	public List<T> doInHibernate(Session session) throws HibernateException,
			SQLException {
		Query query = 	session.createQuery(hql);
	
		if(objs!=null){
			for(int i=0;i<objs.length;i++){
				query.setParameter(i, objs[i]);
			}
		}
		
		query.setFirstResult(firstResult);
		query.setMaxResults(maxResult);
		
		
		return query.list();
	}
	
}
