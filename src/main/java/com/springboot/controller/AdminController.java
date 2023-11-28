package com.springboot.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.model.Brand;
import com.springboot.model.Category;
import com.springboot.model.Message;
import com.springboot.model.Order;
import com.springboot.model.User;
import com.springboot.service.AdminService;
import com.springboot.service.ProductService;

@Controller
@RequestMapping("/system/")
public class AdminController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	AdminService adminService;
	
    @Autowired
    private ServletContext servletContext;
	
	
	@RequestMapping(value="view",method = RequestMethod.GET)
	public String home(ModelMap model) {
		
		model.addAttribute("listUser", adminService.getUserList());
		
		model.addAttribute("mess",new Message());

		return "manage/manageAccount";
	}
	
	@RequestMapping(value="getFile",method = RequestMethod.POST)
	public void getFile(ModelMap model,
		HttpServletResponse response) {
		
		 byte[] a = adminService.getUserList().get(0).getImageByte();
		
		    try {
		      // get your file as InputStream
		      InputStream is = new ByteArrayInputStream(a);
		      // copy it to response's OutputStream
		      org.apache.commons.io.IOUtils.copy(is, response.getOutputStream());
		      response.flushBuffer();
		    } catch (IOException ex) {
		      throw new RuntimeException("IOError writing file to output stream");
		    }
	}
	
	@RequestMapping(value="getFile2",method = RequestMethod.POST)
	public ResponseEntity<ByteArrayResource> getFile() {
		
		 byte[] a = adminService.getUserList().get(0).getImageByte();
		 

		 ByteArrayResource resource = new ByteArrayResource(a);
	     

		 MediaType mediaType = null;
		return ResponseEntity.ok()
	                // Content-Disposition
	                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=s.jpg")
	                // Content-Type
	                .contentType(mediaType)
	                // Contet-Length
	                .contentLength(a.length) //
	                .body(resource);
	}
	
	@RequestMapping(value="saveUser",method = RequestMethod.POST)
	public String saveUser(ModelMap model
			,@RequestParam("userName") String userName
			,@RequestParam("password") String password
			,@RequestParam("fullName") String fullName
			,@RequestParam("address") String address
			,@RequestParam("phone") String phone
			,@RequestParam("email") String email
			,@RequestParam("image") MultipartFile image
			,@RequestParam("enabled") int enabled
			,@RequestParam("role") String role
			) throws IOException {
		
		User u = new User(userName, password, fullName, address, phone, email, image.getBytes(), enabled);
		
		model.addAttribute("mess", adminService.createUser(u,role));

		return "redirect:/system/view";
	}
	
	@RequestMapping(value="updateUser",method = RequestMethod.POST)
	public String updateUser(ModelMap model
			,@RequestParam("userName") String userName
			,@RequestParam("password") String password
			,@RequestParam("fullName") String fullName
			,@RequestParam("address") String address
			,@RequestParam("phone") String phone
			,@RequestParam("email") String email
			,@RequestParam("image") MultipartFile image
			,@RequestParam("enabled") int enabled
			,@RequestParam("role") String role
			) throws IOException {
		User u = null;
		
		if(image.getSize() != 0) {
			u = new User(userName, password, fullName, address, phone, email, image.getBytes(), enabled);
		}else {
			u = new User(userName, password, fullName, address, phone, email, null, enabled);
		}
		
		model.addAttribute("mess", adminService.updateUser(u,role));

		return "redirect:/system/view";
	}
	
	
	// manage brand
	@RequestMapping(value="manageBrand",method = RequestMethod.GET)
	public String manageBrand(ModelMap model) {
		
		model.addAttribute("listBrand",adminService.getAllBrandList());
		
		model.addAttribute("mess",new Message());

		return "manage/manageBrand";
	}
	
	@RequestMapping(value="saveBrand",method = RequestMethod.POST)
	public String saveBrand(ModelMap model,@ModelAttribute("brand") Brand b) {
		
		model.addAttribute("mess",adminService.createBrand(b));

		return "redirect:/system/manageBrand";
	}
	
	@RequestMapping(value="updateBrand",method = RequestMethod.POST)
	public String updateBrand(ModelMap model,@ModelAttribute("brand") Brand b) {
		
		model.addAttribute("mess",adminService.updateBrand(b));
		
		return "redirect:/system/manageBrand";
	}
	
	// manage category
	@RequestMapping(value="manageCategory",method = RequestMethod.GET)
	public String manageCategory(ModelMap model) {
		
		model.addAttribute("listCategory",adminService.getAllCategoryList());
		
		model.addAttribute("mess",new Message());

		return "manage/manageCategory";
	}
	
	@RequestMapping(value="saveCategory",method = RequestMethod.POST)
	public String saveCategory(ModelMap model,@ModelAttribute("category") Category c) {
		
		model.addAttribute("mess",adminService.createCategort(c));

		return "redirect:/system/manageCategory";
	}

	@RequestMapping(value="updateCategory",method = RequestMethod.POST)
	public String updateCategory(ModelMap model,@ModelAttribute("category") Category c) {
		
		model.addAttribute("mess",adminService.updateCategort(c));

		return "redirect:/system/manageCategory";
	}
	
	
	// manage revenue
	@RequestMapping(value="manageRevenue",method = RequestMethod.GET)
	public String manageRevenue(ModelMap model
			,@RequestParam(value="from",defaultValue ="2020-01-01") @DateTimeFormat(pattern = "yyyy-mm-dd") Date from
			,@RequestParam(value="to",defaultValue = "2999-01-01") @DateTimeFormat(pattern = "yyyy-mm-dd") Date to) {
		
		int total = 0;
		
		List<Integer> priceList = null;
		
		Map<String, Object> param = adminService.getRevenue(from,to,total,priceList);
		
		model.addAttribute("revenueList",param.get("list"));
		
		model.addAttribute("total",param.get("total"));
		
		model.addAttribute("priceList",param.get("priceList"));
		
		model.addAttribute("from",from);
		
		model.addAttribute("to",to);
		
		return "manage/manageRevenue";
	}
	
	// manage revenue
		@RequestMapping(value="getRevenue",method = RequestMethod.POST)
		public String getRevenue(ModelMap model
				,@RequestParam(value="from",defaultValue ="2020-01-01") @DateTimeFormat(pattern = "yyyy-mm-dd") Date from
				,@RequestParam(value="to",defaultValue = "2999-01-01") @DateTimeFormat(pattern = "yyyy-mm-dd") Date to) {
			
			int total = 0;
			
			List<Integer> priceList = null;
			
			Map<String, Object> param = adminService.getRevenue(from,to,total,priceList);
			
			model.addAttribute("revenueList",param.get("list"));
			
			model.addAttribute("total",param.get("total"));
			
			model.addAttribute("priceList",param.get("priceList"));
			
			model.addAttribute("from",from);
			
			model.addAttribute("to",to);
			
			return "manage/manageRevenue";
		}
	
}
