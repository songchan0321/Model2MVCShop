package com.model2.mvc.web.product;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['path']}")
	String path;
	
	public ProductController() {
		System.out.println(this.getClass());
		
	}

	@RequestMapping(value="addProduct", method = RequestMethod.GET)
	public ModelAndView addProduct()  {
		System.out.println("addProduct : GET");
		System.out.println(path);
		return new ModelAndView("forward:/product/addProductView.jsp");
	}

	
	@RequestMapping(value = "addProduct", method = RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("product") Product product, MultipartHttpServletRequest request) throws Exception {
	    // "path" 변수와 "addProduct : POST" 메시지를 출력
	    System.out.println(path);
	    System.out.println("addProduct : POST");

	    // 파일 업로드를 위해 멀티파트에서 파일 맵을 가져옴
	    Map<String, MultipartFile> files = request.getFileMap();
	    
	    // uploadFile 파일 선택
	    CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("uploadFile");
	    
	    // 파일을 저장할 경로를 구성 (경로 + 파일 이름)
	    String uploadPath = path + cmf.getOriginalFilename();
	    
	    // 파일 객체 생성하고 업로드 경로로 이동시킴
	    File file = new File(uploadPath);
	    System.out.println(uploadPath);
	    cmf.transferTo(file);
	    
	    // Product 객체에 파일 이름 설정
	    product.setFileName(cmf.getOriginalFilename());
	    
	    // ProductService를 사용하여 상품을 추가
	    productService.addProduct(product);

	    // addProductResult.jsp로 이동 + 상품 정보 전달
	    return new ModelAndView("forward:/product/addProductResult.jsp", "product", product);
	}

	@RequestMapping("listProduct")
	public ModelAndView listProduct(@RequestParam("menu") String menu, 
									@ModelAttribute("search") Search search)
			throws Exception {

		System.out.println("listProduct/"+menu);

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = productService.getProductList(search);
		Page resultPage = new Page(search.getCurrentPage(), 
								   ((Integer) map.get("totalCount")).intValue(),
								   pageUnit,
								   search.getPageSize());
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("forward:/product/listProduct.jsp");
		modelAndView.addObject("menu", menu);
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);

		return modelAndView;
	}

	@RequestMapping(value="getProduct" , method = RequestMethod.GET)
	public ModelAndView getProduct( @RequestParam("menu") String menu,
									@RequestParam("prodNo") int prodNo, 
									HttpServletRequest request, 
									HttpServletResponse response) throws Exception {

		System.out.println("getProduct/"+menu);

		Product product = productService.getProduct(prodNo);
		setCookie(request, response);
		String viewName = menu.equals("manage")?"forward:/product/updateProductView.jsp":"forward:/product/getProduct.jsp";
		
		String[] fileList = product.getFileName().split("/");
		
		System.out.println("viewName = "+viewName);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(viewName);
		modelAndView.addObject("product", product);
		modelAndView.addObject("menu",menu);
		modelAndView.addObject("fileList",fileList);
		
		return modelAndView;
	}
	
	@RequestMapping(value="updateProduct" , method = RequestMethod.GET)
	public ModelAndView updateProduct( @RequestParam("prodNo") int prodNo ) throws Exception {

		System.out.println("updateProduct/"+prodNo);
		
		return new ModelAndView("forward:/product/updateProductView.jsp","product",productService.getProduct(prodNo));
	}
	
	@RequestMapping(value="updateProduct" , method = RequestMethod.POST)
	public ModelAndView updateProduct( @ModelAttribute("product") Product product ) throws Exception {
		
		System.out.println("updateProduct : POST");
		
		productService.updateProduct(product);
		product = productService.getProduct(product.getProdNo());
		
		return new ModelAndView("forward:/product/getProduct.jsp","product", product);
		
	}

	private void setCookie(HttpServletRequest request, HttpServletResponse response) {

		Cookie[] cookies = request.getCookies();
		String history = "";
		
		String newHistory = request.getParameter("prodNo");
		
		for (Cookie cookie : cookies) {
			System.out.println("cookie name:"+cookie.getName());
			if (cookie.getName().equals("history")) {
				System.out.println("history exists");
				if (cookie.getValue().contains(newHistory)) {
					System.out.println("same named cookie exists");
					history = cookie.getValue();
				} else {
					System.out.println("no same named cookie");
					history = newHistory+cookie.getValue();
				}
				cookie.setValue(history);
				cookie.setMaxAge(-1);
				response.addCookie(cookie);
				break;
			} else {
				System.out.println("no history cookie");
				response.addCookie(new Cookie("history", newHistory));
				System.out.println("make history");
			}
		}
		System.out.println("===========history"+history);
		
	}

}