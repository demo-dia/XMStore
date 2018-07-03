package cn.gzh.action;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import cn.gzh.domain.Address;
import cn.gzh.domain.Product;
import cn.gzh.domain.User;
import cn.gzh.service.AddressService;
import cn.gzh.service.CityService;
import cn.gzh.service.ProductService;
import cn.gzh.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User> {

	private User model_user = new User();
	private UserService userService;
	private AddressService addressService;
	private CityService cityService;
	private ProductService productService;
	
	@Override
	//配置模型自动装配
	public User getModel() {
		return model_user;
	}
	
	public String regist(){
		try {
			userService.register(model_user);
			addActionMessage("注册成功,请去你的邮箱激活账户!");
		} catch (Exception e) {
			e.printStackTrace();
			addActionError("注册失败!");
		}
		return "regist_success";
	}
	
	/**
	 * 用户激活
	 */
	public String active(){
		//从param中得到激活码的值
		ActionContext context = ActionContext.getContext();
		Map<String,Object> request = (Map<String, Object>) context.get("request");
		String code = (String) request.get("code");
		//查询这个用户是否存在
		Boolean flag = userService.active(code);
		
		if(flag){
			addActionMessage("激活成功,请登录!");
			return "active_success";
		}else{
			addActionError("激活失败,您可能已经激活过了!");
			return "active_unsuccessful";
		}
	}
	
	/**
	 * 用户登录
	 */
	public String login(){
		
		User user = 	userService.login(model_user.getLoginName(),model_user.getPassword());
		
		if(user!=null){
			
			if(user.getState()==0){ //未激活
				addActionError("账户未激活,请去注册邮箱激活账户!");
				return "login_unsuccessful";
			}else{
				ActionContext.getContext().getSession().put("user", user);
				return "login_success";
			}
			
		}else{   //账号或者密码错误
			addActionError("账号或者密码错误");
			return "login_unsuccessful";
		}
	}
	
	/**
	 * 保存或者更改订单
	 * @return
	 */
	private Address address = new Address();
	
	public String saveOrUpdateAddress(){
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		
		User user = (User)session.get("user"); //取到用户对象
		if(user==null){
			return LOGIN;
		}
		
		if(address.getUser()==null){ //添加订单
			address.setUser(user); //设置归属
			if(!user.getAddresses().contains(address)){ //如果user不包含这个地址
				user.getAddresses().add(address);
			}
			
		}
			
			
			addressService.saveOrUpdate(address);
			
			//更新用户信息,模拟重新登录
			user = userService.login(user.getLoginName(),user.getPassword());
			session.put("user", user);
		
		
		return "account_saveOrUpdateAddress_success";
	}
	
	private Integer aid;  //收货地址id
	/**
	 * 设置默认收货地址
	 * @return
	 */
	public String setDefaultAddress(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		
		User user = (User)session.get("user"); //取到用户对象
		if(user==null){
			return LOGIN;
		}
		
		addressService.changeDefault(aid, user);//修改默认地址
		
		//更新用户信息,模拟重新登录
		user = userService.login(user.getLoginName(),user.getPassword());
		session.put("user", user);
		
		return "account_setDefaultAddress_success";
	}
	
	/**
	 * 删除收货地址
	 * @return
	 */
	public String deleteAddress(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		
		User user = (User)session.get("user"); //取到用户对象
		if(user==null){
			return LOGIN;
		}
		
		addressService.drop(aid, user);
		//更新用户信息,模拟重新登录
		user = userService.login(user.getLoginName(),user.getPassword());
		session.put("user", user);
		
		return "account_deleteAddress_success";
	}
	/**
	 * 更改收货地址
	 * @return
	 */
	public String modifyAddress(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		
		User user = (User)session.get("user"); //取到用户对象
		if(user==null){
			return LOGIN;
		}
		
	     Address addr = 	addressService.findAddressByAid(aid, user); //把数据回显
	     addr.setUser(null);//否则json需要转换
	     JSONObject object = JSONObject.fromObject(addr);
	     
	     HttpServletResponse response = ServletActionContext.getResponse();
	     response.setContentType("text/html;charset=UTF-8");
	     try {
			response.getWriter().print(object.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	     
		//ActionContext.getContext().getValueStack().setValue("address", address);
		
		return NONE;
	}

	

	
	
	private Integer pid;  //商品id
	/**
	 * 收藏商品
	 * @return
	 */
	public String collectProduct(){
		
		HttpSession session = ServletActionContext.getRequest().getSession(); //拿到session
		
		User user = (User) session.getAttribute("user");
		
		if(user!=null){
			Product product = productService.findByPid(pid);
			
			user.getFavorites().add(product);
			product.getFavorites().add(user);
			
			userService.update(user);
			//productService.save(product);
			
			session.setAttribute("user", user);
			
			addActionMessage("收藏商品成功!");
			
			return "collectProduct_success";
		}
		
		return LOGIN;
		
	}
	/**
	 * 取消收藏
	 * @return
	 */
	public String cancelCollect(){
		HttpSession session = ServletActionContext.getRequest().getSession(); //拿到session
		
		User user = (User) session.getAttribute("user");
		
		System.out.println(pid);
		//Product product = productService.findByPid(pid);
		
		/*for(Product product:user.getFavorites()){
			if(pid.equals(product.getPid())){
				user.getFavorites().remove(product);
			}
		}*/
		
		Iterator<Product> iterator = user.getFavorites().iterator();
		
		while(iterator.hasNext()){
			if(pid.equals(iterator.next().getPid())){
				iterator.remove();
			}
		}

			userService.update(user);
		
		
		session.setAttribute("user", user);
		
		return "cancelCollect_success";
	}
	

	public User getModel_user() {
		return model_user;
	}

	public void setModel_user(User model_user) {
		this.model_user = model_user;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}


	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}

	public void setCityService(CityService cityService) {
		this.cityService = cityService;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}


	
	
}
