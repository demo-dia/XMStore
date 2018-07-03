package cn.gzh.service.impl;

import org.springframework.transaction.annotation.Transactional;

import cn.gzh.dao.OrderDao;
import cn.gzh.domain.Order;
import cn.gzh.domain.User;
import cn.gzh.service.OrderService;
@Transactional
public class OrderServiceImpl implements OrderService {
	
	private OrderDao orderDao;

	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public Integer save(Order order) {
		return 	orderDao.save(order);
	}

	@Override
	public Order findByOid(Integer oid,User user) {
		if(user==null){
			return null;
		}
		return orderDao.findByOid(oid,user);
	}

	@Override
	public void update(Order order) {
		orderDao.update(order);
	}

	@Override
	public Double countBuyMoney(User user) {
		
		return orderDao.sumMoleyTotal(user);
	}

	@Override
	public int countSuccessOrders(User user) {
		return orderDao.countOrders(user, 4);
	}

	@Override
	public int countAllOrders(User user) {
		return orderDao.countOrders(user, -3);
	}
	
	
}
