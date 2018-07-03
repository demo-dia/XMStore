package cn.gzh.service;

import java.util.List;
import java.util.Map;

import cn.gzh.domain.City;

public interface CityService {
	/**
	 * 查询所有省份:备注:省份等级为0
	 * @return 
	 */
	public Map<String,Integer> findAllProvince(); 
	
	/**
	 * 根据省份代码查询该省份下面的所有城市信息
	 * @param provinceId 省份代码
	 * @return 
	 */
	public List<City> findCityByProvince(Integer provinceId);
	/**
	 * 根据城市代码查询该城市下所有的县/区信息
	 * @param id 城市代码
	 * @return 
	 */
	public List<City> findCountyByCity(Integer id);
	

}
