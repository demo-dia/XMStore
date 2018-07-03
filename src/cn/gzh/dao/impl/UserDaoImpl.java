package cn.gzh.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.gzh.dao.UserDao;
import cn.gzh.domain.User;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
	
	public void user_save(User user){
		this.getHibernateTemplate().saveOrUpdate(user);
	}

	public Boolean findLoginName(String loginName) {
		List<User> list = this.getHibernateTemplate().find("from User where loginName=?",loginName);
		if(list.size()==0){
			System.out.println(true);
			return true;  //没查到,说明可以使用
		}else{
			System.out.println(false);
			return false;
		}
		
	}

	@Override
	public User findUserByCode(String code) {
		List<User> result = this.getHibernateTemplate().find("from User where code=?",code);
		
		if(result.size()==0){   //没查到
			return null;
		}else{
			return result.get(0);
		}
		
	}

	@Override
	public User findUserByLoginNameAndPassword(String loginName, String password) {
	List<User> result = 	this.getHibernateTemplate().find("from User where loginName=? and password=?",loginName,password);
		if(result.size()==0){   //没查到
			return null;
		}else{
			return result.get(0);
		}
	}

	@Override
	public User findUserByPassword(Integer uid, String password) {
		String hql = "from User where uid=? and password=?";
		List<User> list = this.getHibernateTemplate().find(hql,uid,password);
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public User findUserByEmail(String loginName, String email) {
		String hql = "from User where email=? and loginName=?";
		List<User> list = this.getHibernateTemplate().find(hql,email,loginName);
		
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public User findUserById(Integer uid) {
		User user = this.getHibernateTemplate().get(User.class, uid);
		return user;
	}

	
}	
