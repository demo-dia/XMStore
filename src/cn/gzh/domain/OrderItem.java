package cn.gzh.domain;

import java.io.Serializable;

public class OrderItem implements Serializable{
	private Integer itemId;
	private Integer count;
	private Double subtotal;
	private Order order;
	private Product product;
	
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	

	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	
	
	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	public Double getSubtotal() {
		
		if(count==null||product==null){ //订单项有误
			return 0d;
		}
		
		return count*product.getShop_price();
	}
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	@Override
	public String toString() {
		return "OrderItem [itemId=" + itemId + ", count=" + count
				+ ", subtotal=" + subtotal + "]";
	}
	
	
}
