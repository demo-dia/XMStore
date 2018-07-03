package cn.gzh.service.impl;

import java.util.List;

import cn.gzh.dao.CategoryDao;
import cn.gzh.domain.Category;
import cn.gzh.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
	private CategoryDao categoryDao;

	
	@Override
	public List<Category> findAll() {
		return	categoryDao.findAll();
	}
	
	
	
	public CategoryDao getCategoryDao() {
		return categoryDao;
	}

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	
}
