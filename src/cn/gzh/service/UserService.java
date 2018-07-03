package cn.gzh.service;

import cn.gzh.domain.User;

public interface UserService {
	/**
	 * 注册功能
	 * @param model_user
	 */
	void register(User model_user);
	
	/**
	 * 注册时候判断登录名是否存在
	 * @param loginName
	 * @return
	 */
	Boolean findLoginName(String loginName);
	/**
	 * 根据激活码查询用户,并且激活
	 * @param code
	 * @return 不成功或者查询不到返回失败
	 */
	Boolean active(String code);
	/**
	 * 用户登录
	 * @param loginName
	 * @param password
	 * @return null:账号或者密码错误
	 */
	User login(String loginName, String password);
	
	/**
	 * 更新用户信息
	 * @param user
	 */
	void update(User user);
	/**
	 * 根据用户编号和密码查询用户
	 * @param uid
	 * @param password
	 * @return
	 */
	User findPassword(Integer uid, String password);
	/**
	 * 根据邮箱找回密码
	 * @param loginName
	 * @param email
	 * @return 是否发送邮件成功
	 */
	Boolean retrievePassword(String loginName, String email);

	
	User findUserById(Integer uid);
}
