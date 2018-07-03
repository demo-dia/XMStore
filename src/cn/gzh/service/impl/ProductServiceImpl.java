package cn.gzh.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.gzh.dao.ProductDao;
import cn.gzh.domain.Page;
import cn.gzh.domain.Product;
import cn.gzh.service.ProductService;
@Transactional
public class ProductServiceImpl implements ProductService {
	private ProductDao productDao;

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public List<Product> findIndexHot() {
		Integer limit = 12;
		return productDao.findHot(limit);
	}

	@Override
	public List<Product> findIndexNew() {
		Integer limit = 12;
		return productDao.findNew(limit);
	}

	@Override
	public Page findByCategory(Integer page, Integer cid, Integer csid) {
		Page pageBean  = new Page();
		//设置页面信息
		Integer limit = 12;
		Integer total = null;
		Integer maxPage = null;
		List<Product>	 products = null;
		//有三种情况
		if(cid!=null&&csid==null){  //只查询一级分类
			
			total =	productDao.countByCategory(cid);
			products = productDao.findByCategory(cid,(page-1)*limit,limit);
			
			
		}else if(csid!=null&&cid==null){ //只查询二级分类
			
			total = productDao.countByCategorySecond(csid);
			products= 	productDao.findByCategorySecond(csid,(page-1)*limit,limit);
			
		}else{  //都为空,都为不空 
			return null;
		}
		
		if(total%limit==0){ //向上取整总页数
			maxPage = total/limit;
		}else{
			maxPage = (total/limit)+1;
		}
		
		pageBean.setPage(page);
		pageBean.setLimit(limit);
		pageBean.setMaxPage(maxPage);
		pageBean.setTotal(total);
		pageBean.setProducts(products);  //设置所有页面信息
		
		return pageBean;
	}

	@Override
	public Product findByPid(Integer pid) {
		Product product = productDao.findByPid(pid);
		if(product!=null){
			return	product;
		}else{
			return null;
		}
		
	}

	@Override
	public void save(Product product) {
		productDao.saveOrUpdate(product);
	}
	
	
}
