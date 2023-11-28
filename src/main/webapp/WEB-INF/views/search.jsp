<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- font awesome  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
        integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- reset css  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
        integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- font roboto -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="../source/css/bootstrap.min.css">

    <link rel="stylesheet" href="../source/css/style.css">
</head>

<body>
    
    <jsp:include page="part/header.jsp"></jsp:include>
    
    <div class="container">
        <div class="webapp">
            <div class="product">
               <h5 class="product-content">Mũ lưỡi trai nam</h5> 
               <hr>
               <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container">
                  <a class="navbar-brand" href="#">Tìm kiếm:</a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                      
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="ab" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          Brand
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        	<c:forEach items="${brandList}" var="brand">
		                      <li>
		                      	<input type="hidden" value="${brand.brandCode}" >
		                        <button class="dropdown-item" name="b" >${brand.brandName}</button>
		                      </li>
		                    </c:forEach>
                        </ul>
                      </li>
                      
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="ac" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          Category
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        	<c:forEach items="${categoryList}" var="category">
		                      <li>
		                      	<input type="hidden" value="${category.categoryCode}" >
		                        <button class="dropdown-item" name="c" >${category.categoryName}</button>
		                      </li>
		                    </c:forEach>
                        </ul>
                      </li>
                    </ul>
                    
                    <form:form class="d-flex" action="../search/view" method="GET">
                    	<input type="hidden" name="b" id ="b">
                    	<input type="hidden" name="c" id ="c">
                        <input class="form-control me-2" name="k" type="search" placeholder="Nhập tên sản phẩm" aria-label="Search">
                        <button class="btn btn-outline-dark" type="submit">Search</button>
                    </form:form>
                  </div>
                </div>
              </nav>
              
              <div class="row webapp" id="data">
              <c:if test="${productList.size()==0}">
              	Search not found
              </c:if>
		      <!-- view sản phẩm ở đây dùng vòng lặp -->
		      <c:forEach var="item" items="${productList}">
		      <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
		        <div class="card position-relative product-card">
		          <img
		            src="data:image/jpg;base64,${item.image}"
		            class="card-img-top" alt="photo">
		          <div class="card-body">
		            <h5 class="card-text h5 card-name">
		              ${item.productName} 
		            </h5>
		            <p class="card-text text-center">
		
		              <strong class="">${item.price}</strong>
		            </p>
		            <div class="text-center">
			            <input type="hidden" value="${item.productCode}">
			            <button class="btn btn-dark" name="order">Order</button>
			            <button class="btn btn-dark" name="pay">Buy now</button>
		            </div>
		          </div>
		          <span class="position-absolute   badge rounded-pill bg-danger">
		            SALE
		            <span class="visually-hidden">unread messages</span>
		          </span>
		        </div>
		      </div>
		    </c:forEach>
		      
		    </div>
   
        </div>
    </div>

	<jsp:include page="part/footer.jsp"></jsp:include>
	  <script type="text/javascript">
	  	
	  	$(document).ready(function(){
	  		
	  		$(".dropdown-menu").on("click","button[name='b']",function(){
	  			$("#b").val($(this).parent().find("input[type='hidden']").val());
	  			$("#ab").text($(this).text());
	  		});
	  		
	  		$(".dropdown-menu").on("click","button[name='c']",function(){
	  			$("#c").val($(this).parent().find("input[type='hidden']").val());
	  			$("#ac").text($(this).text());
	  		});
	  		
	  		$("#confirm").on("click","#yes",function(){
	  			confirm();
	  		});
	  		
	  		$("#data").on("click","button[name='order']",function(){
	  			order($(this).parent().find("input[type='hidden']").val(),1);
	  		});
	  		
	  		$("#confirm").on("click","#yes",function(){
	  			confirm();
	  		});
	  	});
	  	
	  </script>
</body>

</html>