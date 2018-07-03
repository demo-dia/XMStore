package cn.gzh.dao;

import java.util.List;

import cn.gzh.domain.Product;

public interface ProductDao {
	/**
	 * 查询热门的商品
	 * @param limit 查询的条数
	 * @return
	 */
	List<Product> findHot(Integer limit);
	/**
	 * 查询上新商品
	 * @param limit 查询条数
	 * @return 
	 */
	List<Product> findNew(Integer limit);
	/**
	 * 查询一级分类下的商品数量
	 * @param cid
	 * @return
	 */
	Integer countByCategory(Integer cid);
	/**
	 * 查询二级分类下的商品数量
	 * @param csid
	 * @return
	 */
	Integer countByCategorySecond(Integer csid);
	/**
	 * 根据一级分类和分页信息查询商品
	 * @param cid 一级分类id
	 * @param i 起始查询数量
	 * @param limit 分页
	 * @return
	 */
	List<Product> findByCategory(Integer cid, int i, Integer limit);
	/**
	 * 根据二级分类和分页信息查询商品
	 * @param csid 二级分类id
	 * @param i 起始查询数量
	 * @param limit 分页
	 * @return
	 */
	List<Product> findByCategorySecond(Integer csid, int i, Integer limit);
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
	void saveOrUpdate(Product product);

}
