package cn.gzh.domain;

import java.io.Serializable;
import java.util.List;

public class Page implements Serializable{
	private Integer page; //当前页
	private Integer maxPage; //总页数
	private Integer total; //查询总数量
	private Integer limit; //每页显示数量
	private List<Product> products; //当页商品
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(Integer maxPage) {
		this.maxPage = maxPage;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	@Override
	public String toString() {
		return "Page [page=" + page + ", maxPage=" + maxPage + ", total="
				+ total + ", limit=" + limit + ", products=" + products + "]";
	}

	
}
