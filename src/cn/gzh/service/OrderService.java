package cn.gzh.service;

import cn.gzh.domain.Order;
import cn.gzh.domain.User;

public interface OrderService {
	/**
	 * 保存订单
	 * @param order
	 * @return 
	 */
	Integer save(Order order);
	/**
	 * 根据订单id查询订单
	 * @param oid
	 * @return
	 */
	Order findByOid(Integer oid,User user);
	/**
	 * 修改订单信息,状态
	 * @param order
	 */
	void update(Order order);
	/**
	 * 查询用户总消费额
	 * @param user
	 * @return
	 */
	Double countBuyMoney(User user);
	/**
	 * 计算完成订单数的数量
	 * 
	 * @param user
	 * @return
	 */
	int countSuccessOrders(User user);
	/**
	 * 订单总数
	 * @param user
	 * @return
	 */
	int countAllOrders(User user);

}
