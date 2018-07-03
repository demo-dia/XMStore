package cn.gzh.domain;
/**
 * 购物车项
 *
 */
public class CartItem {
	private Product product;  //商品
	private int count;     //购买数量
	private Double subtotal;  //小计
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Double getSubtotal() {
		return count * product.getShop_price();   //购买数量*商品单价
	}
	
	
	
	
}
