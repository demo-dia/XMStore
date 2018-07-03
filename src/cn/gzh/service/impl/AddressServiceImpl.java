package cn.gzh.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.gzh.dao.AddressDao;
import cn.gzh.domain.Address;
import cn.gzh.domain.User;
import cn.gzh.service.AddressService;
@Transactional
public class AddressServiceImpl implements AddressService {
	private AddressDao addressDao;

	public AddressDao getAddressDao() {
		return addressDao;
	}

	public void setAddressDao(AddressDao addressDao) {
		this.addressDao = addressDao;
	}

	@Override
	public void saveOrUpdate(Address address) {
		
		addressDao.saveOrUpdate(address);
		
		if(address.getIsDefault()==true){   //把这个地址设置成默认值
			changeDefault(address.getAid(),address.getUser());
		}
	}

	@Override
	public Address findAddressByAid(Integer aid, User user) {
		return	addressDao.findByAid(user, aid);
	}

	@Override
	public void changeDefault(Integer aid, User user) {
		
		List<Address> defaults = addressDao.findDefault(user);
		
		Address newDefault = addressDao.findByAid(user, aid);  //新的默认地址
		
		
		if(defaults.size()>0){  
		
			for(Address address:defaults){
				if(address.getAid()!=aid){  //如果不同,说明是以前的默认地址
					address.setIsDefault(false);//都设置成不是默认
					saveOrUpdate(address);   //更新地址信息
				}
			}

		}
		
		if(newDefault.getIsDefault()==false){  //还未更改为默认地址
			newDefault.setIsDefault(true);
			saveOrUpdate(newDefault);
		}
		
		
		
	}

	@Override
	public void drop(Integer aid, User user) {
		addressDao.deleteAddress(aid,user);
	}
	
	
}
