package cn.gzh.action;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cn.gzh.domain.Address;
import cn.gzh.domain.Cart;
import cn.gzh.domain.CartItem;
import cn.gzh.domain.Order;
import cn.gzh.domain.OrderItem;
import cn.gzh.domain.User;
import cn.gzh.service.AddressService;
import cn.gzh.service.OrderService;
import cn.gzh.service.UserService;
import cn.gzh.util.PaymentUtil;

import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport{
	
	private OrderService orderService;
	private AddressService addressService;
	private UserService userService;
	private Integer oid;
	
	
	
	
	private String pd_FrpId; //银行类型
	// 付款成功后的需要的参数:
		private String r3_Amt;
		private String r6_Order;
		private String  r8_MP;  //原样返回数据
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	/**
	 * 保存订单
	 * @return
	 */
	public String save(){
		
		//从session中拿到用户和购物车
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		Cart shopcart = (Cart) session.getAttribute("shopcart");
		User user = (User) session.getAttribute("user");
		
		if(shopcart==null||shopcart.getCartItems().size()==0){
			
			return "order_save_notCart";
		}
		if(user==null){
			
			return LOGIN;
		}
		
		Order order = new Order();
		
		order.setOrdertime(new Date());   //设置订单时间
		order.setState(1);   //未支付
		order.setUser(user);  //设置所属用户
		
		for(CartItem item: shopcart.getCartItems() ){  //取出购物车的购物项
			OrderItem orderitem = new OrderItem();
			orderitem.setProduct(item.getProduct());  //设置商品
			orderitem.setCount(item.getCount());
			orderitem.setOrder(order);
			
			order.addTotal(orderitem.getSubtotal());  //设置总价
			
			order.getOrderItem().add(orderitem);    //订单项添加到订单
		}
		
		
		 oid = orderService.save(order);  //保存订单
		
		//order.setOid(oid); //设置订单id
		
	//	user.getOrders().add(order);  //把订单添加到用户
		 
			user = userService.login(user.getLoginName(), user.getPassword());  //重新登录
		 
		//清空购物车
		shopcart.clear();
		
		session.setAttribute("new_order", order);  //把最新的订单信息打印到页面
		session.setAttribute("user", user);  //更新用户信息
		
		return "order_save_success";
	}
	
	private Integer addressid;  //收货地址id
	
	public String pay(){
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		User user = (User) session.getAttribute("user");
		
		//不能直接从域对象获得订单
		 Order sessionOrder = (Order) session.getAttribute("new_order");
		 
		Order order = orderService.findByOid(sessionOrder.getOid(), user);
		
		Address address = addressService.findAddressByAid(addressid, user);
		
		order.setAddress(address);  //根据收货地址id把订单设置成该地址
		
		orderService.update(order);
		
		//Pay
		String p0_Cmd = "Buy";
		//易宝支付需要填写营业信息，暂时未开通成功，所以也就不能在线支付了
		//申请下来后替换
		String p1_MerId = "易宝支付的id";
		String p2_Order = "XMStore"+order.getOid();
		//如果可以的话，本来这里是订单的总价的，为了钱包，测试就改成0.01吧
		String p3_Amt = "0.01";
		String p4_Cur = "CNY";
		String p5_Pid = "test";
		String p6_Pcat = "category";
		String p7_Pdesc = "helloworld";
		String p8_Url = "http://127.0.0.1:8080/Gstore/order/order_payCallBack.html";
		String p9_SAF = "";
		 String pa_MP = user.getLoginName()+"-"+user.getPassword()+"-"+order.getOid();    //把账号密码订单id放到原样返回去区
		String pr_NeedResponse = "1";
		//申请下来后替换
		String keyValue = "易宝支付的密钥";
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,pd_FrpId , pr_NeedResponse, keyValue);
		StringBuffer sb = new StringBuffer("https://www.yeepay.com/app-merchant-proxy/node?");
		sb.append("p0_Cmd=").append(p0_Cmd).append("&");
		sb.append("p1_MerId=").append(p1_MerId).append("&");
		sb.append("p2_Order=").append(p2_Order).append("&");
		sb.append("p3_Amt=").append(p3_Amt).append("&");
		sb.append("p4_Cur=").append(p4_Cur).append("&");
		sb.append("p5_Pid=").append(p5_Pid).append("&");
		sb.append("p6_Pcat=").append(p6_Pcat).append("&");
		sb.append("p7_Pdesc=").append(p7_Pdesc).append("&");
		sb.append("p8_Url=").append(p8_Url).append("&");
		sb.append("p9_SAF=").append(p9_SAF).append("&");
		sb.append("pa_MP=").append(pa_MP).append("&");
		sb.append("pd_FrpId=").append(pd_FrpId).append("&");
		sb.append("pr_NeedResponse=").append(pr_NeedResponse).append("&");
		sb.append("hmac=").append(hmac);
		
		HttpServletResponse response = ServletActionContext.getResponse();
		
		try {
			
			response.sendRedirect(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
			return ERROR;
		}
		
		return null;
	}
	
	
	public String payCallBack(){
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		
		String[] resultMsg = r8_MP.split("-"); //得到账号密码和订单号
		
		User user = userService.login(resultMsg[0], resultMsg[1]);  //获取用户信息
		
		Integer resultOid = Integer.parseInt(r6_Order.substring(7)); //支付页面返回的oid
		
		if(Integer.parseInt(resultMsg[2])==resultOid){  //如果两个值相等
			Order currOrder = orderService.findByOid(resultOid, user);
			currOrder.setState(2);// 修改订单状态.
			
			orderService.update(currOrder);
			user.getOrders().add(currOrder);
			session.setAttribute("user", user);
			
			this.addActionMessage("订单付款成功!            订单号:"+r6_Order+"          付款金额:"+r3_Amt);
			
			return "msg";
		}
		
		return null;
		
	}
	
	public String cancelOrder(){
		if(oid==null){
			return null;
		}
		HttpSession session = ServletActionContext.getRequest().getSession(); //拿到session中的用户
		
		User  user = (User) session.getAttribute("user");
		
		if(user==null){
			return null;  //未登录
		}
		
		Order findOrder = orderService.findByOid(oid, user);
		findOrder.setState(0); //设置为订单取消
		
		orderService.update(findOrder);
		
		user = userService.login(user.getLoginName(), user.getPassword());  //重新登录
		session.setAttribute("user", user);
		
		return "order_cancel_success";
	}
	

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public String getPd_FrpId() {
		return pd_FrpId;
	}

	public void setPd_FrpId(String pd_FrpId) {
		this.pd_FrpId = pd_FrpId;
	}

	public Integer getAddressid() {
		return addressid;
	}

	public void setAddressid(Integer addressid) {
		this.addressid = addressid;
	}

	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}

	public String getR3_Amt() {
		return r3_Amt;
	}

	public void setR3_Amt(String r3_Amt) {
		this.r3_Amt = r3_Amt;
	}

	public String getR6_Order() {
		return r6_Order;
	}

	public void setR6_Order(String r6_Order) {
		this.r6_Order = r6_Order;
	}



	public String getR8_MP() {
		return r8_MP;
	}

	public void setR8_MP(String r8_MP) {
		this.r8_MP = r8_MP;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}


	
	
}
