package cn.gzh.dao;

import java.util.List;

import cn.gzh.domain.Address;
import cn.gzh.domain.User;

public interface AddressDao {
	/**
	 * 更改或者保存订单
	 * @param address
	 */
	void saveOrUpdate(Address address);

	/**
	 * 查询用户的所有收货地址
	 * @param user
	 * @return
	 */
	List<Address> findAllAddress(User user);
	
	
	/**
	 * 查询默认的收货地址 
	 */
	List<Address> findDefault(User user);
	
	/**
	 * 根据收货地址id查询收货地址信息
	 * @param user
	 * @param aid
	 * @return
	 */
	Address findByAid(User user,Integer aid);
	/**
	 * 删除收货地址
	 * @param aid
	 * @param user
	 */
	void deleteAddress(Integer aid, User user);
}
