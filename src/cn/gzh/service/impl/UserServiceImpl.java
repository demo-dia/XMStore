package cn.gzh.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.transaction.annotation.Transactional;

import cn.gzh.util.SendJMail;

import cn.gzh.dao.UserDao;
import cn.gzh.domain.User;
import cn.gzh.service.UserService;
import cn.gzh.util.UUIDUtil;
@Transactional
public class UserServiceImpl implements UserService {

	private UserDao userDao;
	
	@Override
	public void register(User model_user) {
		String uuid = UUIDUtil.getUUID();
		//初始化用户
		model_user.setState(0);
		model_user.setCode(uuid);
		userDao.user_save(model_user);
		
		//发送激活邮件
		String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String url = "http://127.0.0.1:8080/Gstore/user/user_active?code="+uuid;
		
				SendJMail.sendMail(model_user.getEmail(),"<b>尊敬的"+
						model_user.getUserName()+":</b><div><b>&nbsp; &nbsp; &nbsp;</b></div><div><b>&nbsp;<font __editorwarp__='1' style='display: inline;'>​ &nbsp; &nbsp;</font>您正在注册XMStore会员。</b></div><div><b>&nbsp; &nbsp; &nbsp;请&nbsp;" +
						"<a href='"+url+"'>" +
						"点我激活会员</a><br></b><div><div><b>&nbsp; &nbsp; &nbsp;如果并非是您的操作,请忽略本信息,给您带来的不便</b><b>,深表歉意!</b></div><div><b><br></b></div><div><b><br></b></div><div><b><br></b></div><div><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; XMStore</b></div><div><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" +
						nowTime+"</b></div><div><b><br></b></div><div><b>&nbsp; &nbsp;&nbsp;</b></div><div><div><br></div></div></div></div>");	
			
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public Boolean findLoginName(String loginName) {
		return userDao.findLoginName(loginName);
	}

	@Override
	public Boolean active(String code) {
		
		User user = userDao.findUserByCode(code);
		
		if(user!=null){
			user.setCode(null);
			user.setState(1);
			userDao.user_save(user);
			return true;   //激活成功
		}else{
			return false;  //激活失败
		}
	}

	@Override
	public User login(String loginName, String password) {
		return userDao.findUserByLoginNameAndPassword(loginName,password);
	}

	@Override
	public void update(User user) {
		userDao.user_save(user);
	}

	@Override
	public User findPassword(Integer uid, String password) {
		return	userDao.findUserByPassword(uid,password);
	}

	
	/*找回密码，前端未实现，因为懒*/
	@Override
	public Boolean retrievePassword(String loginName, String email) {
		User user = userDao.findUserByEmail(loginName,email);
		
		if(user!=null){
			String uuid = UUIDUtil.getUUID().substring(0, 8);  //得到新的随机密码
			user.setPassword(uuid);
			userDao.user_save(user); //保存新密码
			
			//发送邮件
			String nowTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
			
			SendJMail.sendMail(user.getEmail(),"<b>尊敬的"+
					user.getUserName()+":</b><div><b>&nbsp; &nbsp; &nbsp;</b></div><div><b>&nbsp;<font __editorwarp__='1' style='display: inline;'>​ &nbsp; &nbsp;</font>您正在找回您的密码。</b></div><div><b>&nbsp; &nbsp; &nbsp;请&nbsp;" +
					"<a href='#'>您的新密码是:"+uuid+"</a>请登录后尽快更改密码,谢谢!<br></b><div><div><b>&nbsp; &nbsp; &nbsp;如果并非是您的操作,请警惕您的账号是否存在风险!</b><b>谢谢</b></div><div><b><br></b></div><div><b><br></b></div><div><b><br></b></div><div><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; XMStore</b></div><div><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" +
					nowTime+"</b></div><div><b><br></b></div><div><b>&nbsp; &nbsp;&nbsp;</b></div><div><div><br></div></div></div></div>");	
		
			
			
			return true;
		}
		
		return false;
	}

	@Override
	public User findUserById(Integer uid) {
			
		return userDao.findUserById(uid);
	}
}
