package cn.gzh.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.gzh.domain.Category;

@Transactional
public interface CategoryService {
	
	/**
	 * 查询所有一级分类
	 * @return
	 */
	List<Category> findAll();

}
