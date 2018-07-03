package cn.gzh.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import cn.gzh.domain.Category;
import cn.gzh.domain.City;
import cn.gzh.domain.Order;
import cn.gzh.domain.Product;
import cn.gzh.domain.User;
import cn.gzh.service.CategoryService;
import cn.gzh.service.CityService;
import cn.gzh.service.OrderService;
import cn.gzh.service.ProductService;
import cn.gzh.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;

public class PageAction extends ActionSupport implements ModelDriven<User> {
	
	private User model_user = new User();
	private UserService userService;
	private CategoryService categoryService;
	private ProductService productService;
	private CityService cityService;
	private OrderService orderService;
	
	public String go404(){
		return "go_404_success";
	}
	
	//跳转首页的Action
	public String goindex(){
		
		Map<String,Object> application = ActionContext.getContext().getApplication();
		if(!application.containsKey("categories")){
			List<Category> categories =  categoryService.findAll();
			application.put("categories",categories);
		}
		
		//查询热门商品
		List<Product> hot_product =  productService.findIndexHot();
		ActionContext.getContext().getSession().put("hot_product", hot_product); 
		//查询最新商品
		List<Product> new_product = productService.findIndexNew();
		ActionContext.getContext().getSession().put("new_product", new_product); 
	
		return "go_index_success";
	}
	
	//跳转登录的Action
		public String gologin(){
			return "go_login_success";
		}
		
	//跳转注册的Action
	public String goregist(){
		return "go_regist_success";
	}
	//跳转购物车
	public String goshopcart(){
			return "go_shopcart_success";   //提交订单后再确认是否需要
	}
	
	private Integer oid;  //订单编号
	
	public String goorder(){
		
		HttpSession session =  ServletActionContext.getRequest().getSession();
		
		ValueStack vs = ActionContext.getContext().getValueStack();
		
		Order order = (Order) session.getAttribute("new_order");
		
		
		
		if(order!=null&&oid==null){   //从购物车跳转过来的
			vs.set("order", order);
		}else if(oid!=null){  //从订单跳转过来的
			
			order = orderService.findByOid(oid,(User)session.getAttribute("user"));
			if(order==null){  //根据订单编号查询不到订单
				addActionError("你的订单信息有误!");
				return ERROR;
			}
			vs.set("order", order);
		}else{
			addActionError("你的订单信息有误!");
			return ERROR;
		}
		
		return "go_order_success";
	}

	//跳转我的账号
	public String go_account_index(){
		
		ValueStack vs = ActionContext.getContext().getValueStack();
		
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		
		Double allBuyTotal = orderService.countBuyMoney(user);   //总消费额
		
		int successOrders = orderService.countSuccessOrders(user);  //完成订单数 
		int myOrders = orderService.countAllOrders(user);  //订单数 
		
		vs.set("allBuyTotal",allBuyTotal);
		vs.set("successOrders",successOrders);
		vs.set("myOrders",myOrders);
		
		return "go_account_index_success";
	}

	//跳转收货地址
	public String go_account_deliverAddress(){
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		
		User user = (User) session.get("user"); //得到登录用户对象
		if(user==null){
			return LOGIN;
		}

		
		Map<String,Integer> provinces = cityService.findAllProvince();
		
		ActionContext.getContext().getValueStack().set("provinces",provinces);  //加载页面就把省的信息加入select选框
		
		
		
		return "go_account_deliverAddress_success";
	}
	/**
	 * 前往订单详情页面
	 * @return
	 */
	public String go_account_orderDetails(){
		if(oid==null){
			return null;
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		Order orderDetails =  orderService.findByOid(oid, (User)session.getAttribute("user"));   //拿到订单详情
		ActionContext.getContext().getValueStack().set("orderDetails", orderDetails); //放入值栈
		
		return "go_account_orderDetails_success";
	}
	//跳转我的收藏
	public String go_account_myFavorites(){
		return "go_account_myFavorites_success";
	}
	//跳转我的订单
	public String go_account_myOrders(){
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		return "go_account_myOrders_success";
	}

	//跳转修改个人资料
	public String go_account_profile(){
		return "go_account_profile_success";
	}
	
	//退出登录
	public String gologout(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		if(session.containsKey("user")){
			session.remove("user");
		}
		addActionMessage("退出成功!");
		return "go_logout_success";
	}
	
	private Integer provinceId;
	/**
	 * 根据省份id查询城市id
	 * @return
	 */
	public String findCity(){
		List<City> citys = 	cityService.findCityByProvince(provinceId);
		
		JSONArray jsonArray = JSONArray.fromObject(citys);  //转换成json格式
	
		try {
			//生成的JSON回写页面
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().print(jsonArray.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return NONE;
	}
	
	private Integer cityId;
	/**
	 * 根据城市id查询县区id
	 * @return
	*/	
	public String findCounty(){
		
		List<City>  countys = cityService.findCountyByCity(cityId);
		
		JSONArray jsonArray = JSONArray.fromObject(countys);  //生成json格式
		
		HttpServletResponse response = ServletActionContext.getResponse();
		
		response.setContentType("text/html;charset=UTF-8"); 
		try {
			response.getWriter().print(jsonArray.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return NONE;
	}
	
	
	//判断登录名是否已经存在
	public String register_checkUserName(){
		
		Boolean flag = userService.findLoginName(model_user.getLoginName());
		PrintWriter writer = null;
		try {
			writer = ServletActionContext.getResponse().getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		writer.write(flag.toString());
		return NONE;
	}

	

	



	public Integer getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}

	public Integer getCityId() {
		return cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	public void setModel_user(User model_user) {
		this.model_user = model_user;
	}
	
	public User getModel_user() {
		return model_user;
	}

	public User getModel() {
		return model_user;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public void setCityService(CityService cityService) {
		this.cityService = cityService;
	}

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}
}
