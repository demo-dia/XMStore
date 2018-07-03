package cn.gzh.dao;

import cn.gzh.domain.User;

public interface UserDao {
	/**
	 * 保存注册用户
	 * @param user
	 */
	public void user_save(User user);
	/**
	 * 查询登录名是否存在
	 * @param loginName
	 * @return
	 */
	public Boolean findLoginName(String loginName);
	/**
	 * 根据激活码查询用户
	 * @param code
	 * @return
	 */
	public User findUserByCode(String code);
	/**
	 * 根据账号密码查询用户
	 * @param loginName
	 * @param password
	 * @return 查询到的用户
	 */
	public User findUserByLoginNameAndPassword(String loginName, String password);
	/**
	 * 根据id和密码查询用户 
	 * @param uid
	 * @param password
	 * @return
	 */
	public User findUserByPassword(Integer uid, String password);
	/**
	 * 根据用户名和邮箱查找账户
	 * @param loginName
	 * @param email
	 * @return
	 */
	public User findUserByEmail(String loginName, String email);
	/**
	 * 根据用户id查询用户
	 * @param uid
	 * @return
	 */
	public User findUserById(Integer uid);

}
