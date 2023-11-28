<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
  <nav class="navbar navbar-expand-lg navbar-light bg-light delete-pd">
    <div class="header-nav-top">
      <div class="container">
        <div class="collapse navbar-collapse" id="navbarSupportedContentttt">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#"><i class="fa fa-envelope"></i>
                hatshop@gamil.com</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Free Shipping for all of $99</a>
            </li>

          </ul>
          <div class="d-flex">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#"><i class="fab fa-facebook-f"></i></a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#"><i class="fab fa-twitter"></i></a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#"><i class="fab fa-linkedin-in"></i></a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#"><i class="fab fa-pinterest-p"></i></a>
              </li>
              
              <c:if test="${user != null}">
				<li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button"
                  data-bs-toggle="dropdown" aria-expanded="false">
                  <input type="hidden" id="user" value="1">
                  <i class="fa fa-user-alt"></i> ${user.fullName}
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><a class="btn" href="../info/view" >Change Password</a></li>
                  <li>
                    <hr class="dropdown-divider">
                  </li>
                  <form:form id="logoutForm" action="../logout" method="post" >
                  	<li><a class="dropdown-item" href="javascript:void(0)" onclick ="document.getElementById('logoutForm').submit();">Logout</a></li>
                   </form:form>
                </ul>
              </li>
             </c:if>
            </ul>
			<c:if test="${user == null}">
			<input type="hidden" id="user" value="0">
            <a class="btn " href="../loginPage/view"><i class="fa fa-user-alt"></i> Login</a>
			</c:if>
			
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
              aria-labelledby="offcanvasRightLabel">
              <div class="offcanvas-header">
                <h3 class="header-nav-login-text" id="offcanvasRightLabel">Login</h3>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                  aria-label="Close"></button>
              </div>
              <div class="offcanvas-body">
                <!-- login start  -->
               <%--  <form:form> --%>
                  <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">User name</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <div id="emailHelp" class="form-text">We'll never share your username with anyone else.</div>
                  </div>
                  <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1">
                  </div>
                  <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                  </div>
                  <button type="submit" class="btn btn-dark">Submit</button>
               <%--  </form:form> --%>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </nav>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
      <div class="header-logo">
        <a class="navbar-brand header-nav-link" href="#">Hat Shop</a>
      </div>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse header-nav-full" id="navbarSupportedContent">
        <ul class="nav justify-content-center navbar-nav">
          <li class="nav-item header-nav-item">
            <a class="nav-link active header-nav-link header-nav-item-home" aria-current="page" href="../home/view">HOME</a>
          </li>
          <li class="nav-item header-nav-item">
            <a class="nav-link active header-nav-link" aria-current="page" href="../search/view?b=1">SHOP</a>
          </li>
          <li class="nav-item header-nav-item">
            <a class="nav-link active header-nav-link" aria-current="page" href="../blog/view">PAGES</a>
          </li>
          <li class="nav-item header-nav-item">
            <a class="nav-link active header-nav-link" aria-current="page" href="../blog/view">BLOG</a>
          </li>
          <li class="nav-item header-nav-item">
            <a class="nav-link active header-nav-link" aria-current="page" href="../contact/view">CONTACT</a>
          </li>

        </ul>
        <ul class="nav justify-content-end navbar-nav">
          <li class="nav-item ">
            <a class="nav-link active header-nav-link" aria-current="page" href="#"><i class="fa fa-heart"></i></a>
          </li>
          <li class="nav-item card-hover">
            <button type="button" class="btn position-relative header-nav-link">
              <i class="fa fa-shopping-cart"></i>
              <span id="numCart" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
               <c:if test="${orderList==null}">0</c:if>
               <c:if test="${orderList!=null}">${orderList.size()}</c:if>
                <span class="visually-hidden">unread messages</span>
              </span>
            </button>
            <div class="card-list-product">
 				<form:form id="form" action="../cart/saveCart" method="POST" enctype="multipart/form-data">
			    	<input type="hidden" name="p" id="p">
			    	<input type="hidden" name="q" id="q">
			    	<input type="hidden" name="odl" id="odl">
			    </form:form>
                <h5 class="text-center h5 card-list-product-header">Danh sách giỏ hàng</h5>
                <div class="list-group" id="orderList">
                <c:forEach items="${orderList}" var="detail">
                 	<a href="../product/view?p=${detail.productCode}" class="list-group-item list-group-item-action">
                 	<img  alt="${detail.image}"src="data:image/jpg;base64,${detail.image}"  style="width:40px;height:40px;">
                 	${detail.productName} (${detail.quantity})
                 	<span class="card-list-product-price">${detail.price}</span>
                 	</a>
                 </c:forEach>
                  
                </div>
                <div class="p-1 d-grid gap-2 d-md-flex justify-content-md-end">
                  <a href="../cart/view" class="btn btn-danger text-right">Buy now</a>
                </div>
              </div>
          </li>
          
          <li class="nav-item">
            <h5><a class="nav-link active" aria-current="page" href="../cart/view">View Cart</a></h5>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
<!-- ModalConfirm -->
<div class="modal fade" id="confirm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Cart</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Would you like to add the product to a cart?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        <button type="button" id="yes" class="btn btn-primary">Yes</button>
      </div>
    </div>
  </div>
</div>
  <script src="../source/js/jquery-3.5.1.min.js"></script>
  <script type="text/javascript">
  	
  	$(document).ready(function(){
  		
  		$("#data").on("click","button[name='order']",function(){
  			order($(this).parent().find("input[type='hidden']").val(),$(this).parent().find("input[name='q']").val());
  		});
  		
  		$("#confirm").on("click","#yes",function(){
  			confirm();
  		});
  		
  	});
  	
  </script>
