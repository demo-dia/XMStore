package cn.gzh.dao;

import cn.gzh.domain.Order;
import cn.gzh.domain.User;

public interface OrderDao {
	/**
	 * 保存订单
	 * @param order
	 * @return 
	 */
	Integer save(Order order);
	/**
	 * 查询订单
	 * @param oid
	 * @return
	 */
	Order findByOid(Integer oid,User user);
	/**
	 * 修改订单信息
	 * @param order
	 */
	void update(Order order);
	/**
	 * 查询用户消费总额
	 * @param user
	 * @return
	 */
	Double sumMoleyTotal(User user);
	/**
	 * 统计完成订单数量
	 * @param user
	 * @return
	 */
	int countOrders(User user,int state);

}
