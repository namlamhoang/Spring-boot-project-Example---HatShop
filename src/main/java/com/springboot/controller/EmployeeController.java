package com.springboot.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.model.Message;
import com.springboot.model.Order;
import com.springboot.model.OrderDetail;
import com.springboot.model.Product;
import com.springboot.service.EmployeeService;
import com.springboot.service.ProductService;

@Controller
@RequestMapping("/employee/")
public class EmployeeController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping(value="view",method = RequestMethod.GET)
	public String home(ModelMap model) {
		
		model.addAttribute("listCategory", productService.getCategoryList());
		
		model.addAttribute("listBrand", productService.getBrandList());
		
		model.addAttribute("listProduct", employeeService.getAllProductList());
		
		model.addAttribute("mess",new Message());

		return "manage/manageProduct";
	}
	
	@RequestMapping(value="saveProduct",method = RequestMethod.POST)
	public String saveProduct(ModelMap model
			,@RequestParam("productCode") int productCode
			,@RequestParam("productName") String productName
			,@RequestParam("price") double price
			,@RequestParam("quantity") int quantity
			,@RequestParam("description") String description
			,@RequestParam(value="isDelete",defaultValue = "0") int isDelete
			,@RequestParam("categoryCode") int categoryCode
			,@RequestParam("brandCode") int brandCode
			,@RequestParam("image") MultipartFile image
			) throws IOException {
		
		Product p = null;
		
		if(image.getSize() == 0) {
			
			p = new Product(-1, productName, price, quantity, null, 0, categoryCode,brandCode ,description);
		} else {
			
			p = new Product(-1, productName, price, quantity, image.getBytes(), 0, categoryCode,brandCode ,description);
		}
		
		model.addAttribute("mess",employeeService.createProduct(p));

		return "redirect:/employee/view";
	}
	
	@RequestMapping(value="updateProduct",method = RequestMethod.POST)
	public String updateProduct(ModelMap model
			,@RequestParam("productCode") int productCode
			,@RequestParam("productName") String productName
			,@RequestParam("price") double price
			,@RequestParam("quantity") int quantity
			,@RequestParam("description") String description
			,@RequestParam("isDelete") int isDelete
			,@RequestParam("categoryCode") int categoryCode
			,@RequestParam("brandCode") int brandCode
			,@RequestParam("image") MultipartFile image
			) throws IOException {
		
		Product p = null;
		
		if(image.getSize() == 0) {
			
			p = new Product(productCode, productName, price, quantity, null, isDelete, categoryCode,brandCode ,description);
		} else {
			
			p = new Product(productCode, productName, price, quantity, image.getBytes(), isDelete, categoryCode,brandCode ,description);
		}
		
		model.addAttribute("mess",employeeService.updateProduct(p));

		return "redirect:/employee/view";
	}

	@RequestMapping(value="manageOrder",method = RequestMethod.GET)
	public String manageOrder(@RequestParam(value="pay",defaultValue ="1") int pay,ModelMap model) {
		
		List<Order> list = null;
		
		// paid
		if(pay == 1) {
			list = employeeService.getOrerList(1);
		} else {
			
		// unpaid
			list = employeeService.getOrerList(0);
		}
		
		model.addAttribute("orderList",list);
		
		model.addAttribute("status",pay);

		return "manage/manageOrder";
	}
	
	@RequestMapping(value="confirmOrder",method = RequestMethod.POST)
	public String ConfirmOrder(@RequestParam("cf") int confirm,@RequestParam("odc") int odc,ModelMap model) {
		
		employeeService.confirmOrder(odc,confirm);

		return "redirect:/employee/manageOrder";
	}

	@RequestMapping(value="manageOrderDetail",method = RequestMethod.POST)
	public ResponseEntity<List<OrderDetail>> manageOrderDetail(@RequestParam("odc") int odc,ModelMap model) {
		return new ResponseEntity<List<OrderDetail>> (employeeService.getOrerDetailList(odc),HttpStatus.OK);
	}
}
