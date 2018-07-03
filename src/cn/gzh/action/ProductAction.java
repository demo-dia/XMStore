package cn.gzh.action;



import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cn.gzh.domain.Cart;
import cn.gzh.domain.CartItem;
import cn.gzh.domain.Page;
import cn.gzh.domain.Product;
import cn.gzh.service.ProductService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

public class ProductAction extends ActionSupport{
	
	private ProductService productService;
	
	private Integer cid;
	private Integer csid;
	private Integer page;
	
	public String findByCategory(){
			
			if(page<1){   //页数有问题
				addActionError("你访问的页面不存在哦~");
				return "product_find_error";
			}
		
			Page pageBean =	productService.findByCategory(page,cid,csid);
			
			if(pageBean==null){ //传入的分类信息参数有误
				addActionError("你访问的页面不存在哦~");
				return "product_find_error";
			}
			//重新把搜寻到的页面信息压入栈顶
			ValueStack vs = ActionContext.getContext().getValueStack();
			vs.push(pageBean);
			//ActionContext.getContext().getSession().put("pageBean", pageBean);
			
			return SUCCESS;
	}
	
	private Integer pid;
	
	public String info(){
		
		Product product = productService.findByPid(pid);
		if(product!=null){
			ActionContext.getContext().getValueStack().push(product);
			return "product_info_success";
		}else{
			addActionError("您访问的商品不存在!");
			return "product_info_error";
		}
		
	}
	
	private Integer quantity;
	/**
	 * 加入购物车
	 * @return
	 */
	public String addCart(){
		
		Product product = productService.findByPid(pid); //得到具体加入购物车的商品
		
		if(product!=null){
			
				Cart shopcart = getCart(ServletActionContext.getRequest());
				
				CartItem cartItem = new CartItem();
				cartItem.setProduct(product);
				cartItem.setCount(quantity);   //生成购物项
				
				shopcart.addCart(cartItem);  //购物项添加到购物车
				
			
			return "shopcart_addCart_success";
		}
		
		return NONE;
	}
	/**
	 * 更改购物车里面某个物品的数量
	 * @return
	 */
	public String changeCart(){
		
		Product product = productService.findByPid(pid); //得到具体加入购物车的商品
		if(product!=null){
			
			Cart shopcart = getCart(ServletActionContext.getRequest());
			
			
			CartItem newitem  = shopcart.updateCart(pid,quantity);   //得到最新的表单项
			
			if(newitem!=null){
				
				try {
					//输出新的表单项总和和订单总和
					ServletActionContext.getResponse().getWriter().print(newitem.getSubtotal().toString()+"-"+shopcart.getTotal().toString());
					
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
		
			
		}
		return null;
	}
	
	/**
	 * 移除购物车
	 * @return
	 */
	public String removeProductFromCart(){
		
		Cart shopcart = getCart(ServletActionContext.getRequest());
		
		shopcart.removeCart(pid);
		
		return "shopcart_removeProductFromCart_success";
	}
	
	public String clearCart(){
		
		Cart shopcart = getCart(ServletActionContext.getRequest());
		
		shopcart.clear();
		
		return "shopcart_clearCart_success";
	}
	
	private Cart getCart(HttpServletRequest request){
		HttpSession session = request.getSession();
		Cart shopcart = (Cart) session.getAttribute("shopcart");  //从域对象得到购物车
		if(shopcart==null){
			shopcart = new Cart();
			session.setAttribute("shopcart", shopcart);
		}
		return shopcart;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getCsid() {
		return csid;
	}

	public void setCsid(Integer csid) {
		this.csid = csid;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}



	public Integer getQuantity() {
		return quantity;
	}



	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
}	
