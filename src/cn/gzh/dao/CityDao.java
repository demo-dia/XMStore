package cn.gzh.dao;

import java.util.List;

import cn.gzh.domain.City;

public interface CityDao {
	/**
	 * 根据城市等级查询城市信息
	 * @param i 城市等级
	 * @return 该等级的所有城市信息
	 */
	List<City> findByLevel(int i);
	/**
	 * 根据id查询子集城市信息
	 * @param id
	 * @return
	 */
	List<City> findByParentID(Integer id);
	/**
	 * 根据城市id查询城市名称
	 * @param province
	 * @return
	 */
	String findNameById(Integer province);

}
