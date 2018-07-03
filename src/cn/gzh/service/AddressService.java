package cn.gzh.service;

import cn.gzh.domain.Address;
import cn.gzh.domain.User;

public interface AddressService {
	/**
	 * 保存或者更改收货地址
	 * @param address
	 */
	public void saveOrUpdate(Address address);
	/**
	 * 根据收货地址id查询收货地址
	 * @param aid
	 * @return
	 */
	public Address findAddressByAid(Integer aid,User user);
	
	/**
	 * 把该收货地址设置为这个用户的默认地址
	 * @param aid
	 */
	public void changeDefault(Integer aid,User user);
	
	/**
	 * 根据地址id和用户删除收货地址
	 * @param aid
	 * @param user
	 */
	public void drop(Integer aid,User user);
}
