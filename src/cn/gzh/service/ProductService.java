package cn.gzh.service;

import java.util.List;

import cn.gzh.domain.Page;
import cn.gzh.domain.Product;

public interface ProductService {
	/**
	 * 查询首页前十条热门商品
	 * @return
	 */
	List<Product> findIndexHot();
	/**
	 * 查询首页新商品
	 * @return
	 */
	List<Product> findIndexNew();
	/**
	 * 分类分页查询商品
	 * @param page 内含页数
	 * @param cid 一级分类
	 * @param csid 二级分类
	 * @return 查询到的页面信息
	 */
	Page findByCategory(Integer page, Integer cid, Integer csid);
	/**
	 * 根据商品id查询商品
	 * @param pid
	 * @return
	 */
	Product findByPid(Integer pid);
	/**
	 * 保存商品
	 * @param product
	 */
	void save(Product product);

}
