package cn.gzh.dao;

import java.util.List;

import cn.gzh.domain.Category;

public interface CategoryDao {
	/**
	 * 查询所有分类
	 * @return
	 */
	List<Category> findAll();

}
