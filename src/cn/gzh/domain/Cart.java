package cn.gzh.domain;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart {
	// 购物车的集合
	private Map<Integer, CartItem> cart = new HashMap<Integer, CartItem>();

	private Double total = 0d; // 购物车总计

	/**
	 * 添加购物项到购物车
	 * 
	 * @param cartItem
	 */
	public void addCart(CartItem cartItem) {

		Integer pid = cartItem.getProduct().getPid(); // 得到商品数量

		if (cart.containsKey(pid)) {

			CartItem olditem = cart.get(pid); // 得到已存在的购物车项
			olditem.setCount(olditem.getCount() + cartItem.getCount());

			if (olditem.getCount() <= 0) { // 直接移除
				removeCart(pid);
			}

		} else {
			if (cartItem.getCount() > 0) {
				cart.put(pid, cartItem); // 没有重复商品
			}

		}

		total += cartItem.getSubtotal(); // 加入总计
	}

	/**
	 * 购物车中移除购物项
	 * 
	 * @param pid
	 */
	public void removeCart(Integer pid) {
		if (cart.containsKey(pid)) {
			CartItem removed = cart.remove(pid); // 移除并返回移除的商品对象(获取数量用)
			total -= removed.getSubtotal(); // 减去移除的表单项的小计
		}
	}

	/**
	 * 清空购物车
	 */
	public void clear() {
		cart.clear();
		total = 0d;
	}

	public Double getTotal() {
		return total;
	}

	public Collection<CartItem> getCartItems() {
		return cart.values();
	}

	/**
	 * 更改物品数量
	 * 
	 * @param pid
	 * @param quantity
	 */
	public CartItem updateCart(Integer pid, Integer quantity) {

		if (quantity <= 0) { // 直接移除
			removeCart(pid);
		}
		
		if (cart.containsKey(pid)) {

			CartItem olditem = cart.get(pid); // 得到已存在的购物车项
			int oldCount = olditem.getCount();   //得到旧的数量
			olditem.setCount(quantity);

			
			total += olditem.getProduct().getShop_price()*(quantity-oldCount); // 加入总计
			
			return olditem;
		}
		
		return null;
	}

}
