package cn.gzh.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import cn.gzh.dao.CityDao;
import cn.gzh.domain.City;
import cn.gzh.service.CityService;
@Transactional
public class CityServiceImpl implements CityService {
	
	private CityDao cityDao;
	
	public CityDao getCityDao() {
		return cityDao;
	}

	public void setCityDao(CityDao cityDao) {
		this.cityDao = cityDao;
	}

	@Override
	public Map<String,Integer> findAllProvince() {
		List<City> provinces =  cityDao.findByLevel(0);
		
		return objectToMap(provinces);
	}

	@Override
	public List<City> findCityByProvince(Integer id) {
		
		return cityDao.findByParentID(id);
	}

	@Override
	public List<City> findCountyByCity(Integer id) {
		
		return cityDao.findByParentID(id);
	}
	



	
	/**
	 * 把City对象的id和name抽取出来生成一个Map
	 * @param list需要转换的集合
	 * @return 转换后的集合
	 */
	private Map<String,Integer> objectToMap(List<City> list){
		
		//建立一个Map集合,用于储存对应的字段信息
		Map<String,Integer> map = new HashMap<String,Integer>();
		
		for(City city:list){
			map.put(city.getName(), city.getId());  //把值全部传入Map集合
		}
		
		list = null;
		
		return map;
	}
}
