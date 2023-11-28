<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

      <div class="col-2">
        <div class="manage-catelory">
          <div class="card manage-catelory-card">
          
            <div class="card-header manage-content">
              <i class="fa fa-bars"></i> CATALOG MANAGEMENT
            </div>
            
            <div class="manage-text">
              Product
            </div>
            <div class=" manage-catelory-link ">
              <a href="../employee/view" class="list-group-item list-group-item-action"><i class="fa fa-envelope-open-text"></i>Manage Product</a>
            </div>

            <div class="manage-text">
              Order
            </div>
            <div class=" manage-catelory-link ">
              <a href="../employee/manageOrder?pay=1" class="list-group-item list-group-item-action"><i class="fa fa-book-reader"></i>Paid</a>
              <a href="../employee/manageOrder?pay=0" class="list-group-item list-group-item-action"><i class="fa fa-book-reader"></i>Unpaid</a>
            </div>
                        
            <c:if test="${role == 'ROLE_ADMIN'}">
                      
            <div class="manage-text">
              Category
            </div>
            <div class=" manage-catelory-link ">
              <a href="../system/manageCategory" class="list-group-item list-group-item-action"><i class="fa fa-envelope-open-text"></i>Manage Category</a>
            </div>
            
            <div class="manage-text">
              Branch
            </div>
            <div class=" manage-catelory-link ">
              <a href="../system/manageBrand" class="list-group-item list-group-item-action"><i class="fa fa-envelope-open-text"></i>Manage Branch</a>
            </div>

            <div class="manage-text">
              Account
            </div>
            <div class=" manage-catelory-link ">
              <a href="../system/view" class="list-group-item list-group-item-action"><i class="fa fa-address-book"></i>Manage Account</a>
            </div>
            
            <div class="manage-text">
              Statistic
            </div>
            <div class=" manage-catelory-link ">
              <a href="../system/manageRevenue" class="list-group-item list-group-item-action"><i class="fa fa-address-book"></i>Manage revenue</a>
            </div>
            
            </c:if>
            
            <div class="manage-text">
              Setting
            </div>
            <div class=" manage-catelory-link ">
            <a href="../home/view" class="list-group-item list-group-item-action"><i style="font-size: 15px;" class="far fa-caret-square-left"></i> Back Home</a>
            </div>
             <form:form id="logoutForm" action="../logout" method="post" >
	            <div class=" manage-catelory-link ">
	                  <a class="list-group-item list-group-item-action" href="javascript:void(0)" onclick ="document.getElementById('logoutForm').submit();">Logout</a>
	            </div>
            </form:form>
            
          </div>
        </div>
      </div>
      
      <script src="../source/js/jquery-3.5.1.min.js"></script>
		
      <script type="text/javascript">  		
 		function getDetail(){
 			var data = new FormData($("#formDetail")[0]);
 			$.ajax({
 				type : "POST",
 				headers: {"X-CSRF-TOKEN": $("input[name=_csrf]").val()},
 				url : "../employee/manageOrderDetail",
 				data : data,
				enctype: 'multipart/form-data',
		        processData: false,
		        contentType: false,	
 				success : function(array) {
 					array.forEach(data => {
 						$("#orderDetailList").empty();
 	 					array.forEach(data => {
 	 						$("#orderDetailList").append('<a href=../product/view?p='+data.productCode+' class="list-group-item list-group-item-action">'+data.productName+'('+data.quantity+')<span class="card-list-product-price">'+data.price+'</span></a>');
 	 					});
 					});
 				}
 			}); 
 		}
 		</script>
 		