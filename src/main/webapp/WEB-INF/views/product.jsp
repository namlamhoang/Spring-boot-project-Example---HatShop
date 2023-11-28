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
            <div class="product-detail">
            <form:form action="" modelAttribute="product">
            
                <div class="row">
                    <div class="col-8">
                        <div id="carouselExampleControls" class="carousel slide " data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="data:image/jpg;base64,${product.image}" alt="photo"
                                        class="d-block w-100 product-carousel-img" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/85f9da85fea94e47b32cac8100dfdbf1_9366/Mu_Bong_Chay_3_Soc_AEROREADY_DJen_GM6278_02_standard_hover.jpg"
                                        class="d-block w-100 product-carousel-img" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/6f7045a7e5d44d57be69ac8100dfec41_9366/Mu_Bong_Chay_3_Soc_AEROREADY_DJen_GM6278_04_standard.jpg"
                                        class="d-block w-100 product-carousel-img" alt="...">
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button"
                                data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button"
                                data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                    <div class="col-4" id="data">
                        <div class="product-details-card text-center">
                        	
                            <h3>${product.productName}</h3>
                            <p>${product.price}</p>
                            <hr class="dropdown-divider">
                            <p>
                                <strong>Brand</strong>
                            </p>
                            <p>
                            	<c:forEach items="${brandList}" var="brand">
                                <c:if test="${brand.brandCode == product.brandCode}">
                                <a href="../search/view?=${brand.brandCode}" class="btn btn-outline-dark">${brand.brandName}</a>
                                </c:if>
                                </c:forEach>
                                
                            </p>
                            <p>
                                <strong>Category</strong>
                            </p>
                            <p>
                                <c:forEach items="${categoryList}" var="category">
                                <c:if test="${category.categoryCode == product.categoryCode}">
                                <a href="../search/view?=${category.categoryCode}" class="btn btn-outline-dark">${category.categoryName}</a>
                                </c:if>
                                </c:forEach>
                            </p>
                                <strong>Số lượng:</strong>
                            

                                <div class="d-grid gap-2 col-6 mx-auto">
                                    <div class="quantity buttons_added">
                                        <input type="number" id="quantity_617b60ef0d953" name="q" class="input-text qty text" step="1" min="1" 
                                        max="${product.quantity}" 
                                        value="1" title="SL" size="4" pattern="[0-9]*" inputmode="numeric" 
                                        >
                                    </div>
                                    <input type="hidden" value="${product.productCode}">
						            <button type="button" class="btn btn-dark" name="order">Order</button>
						            <a class="btn btn-dark" href="../cart/addAndViewCart?p=${product.productCode}">Buy now</a>
                                </div>
                           
						
                        </div>
                    </div>
                    
                     
                     
                    <h3 class="text-center webapp product-content ">Chi tiết sản phẩm</h3>
                    <h5 class="p-4">
                        ${product.description}
                    </h5>
                    <h3 class="text-center webapp product-content">Các sản phẩm tương tự</h3>
                    <hr class="">	
                    <!-- san pham  -->
                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <div class="card position-relative product-card">
                          <img
                            src="https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/5d435d60d6d84f269e9bacfa014fcf3b_9366/Mu_Bong_Chay_Logo_DJen_GR9691_01_standard.jpg"
                            class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-text h5 card-name">
                              Lorem, ipsum dolor sit amet consectetur adipisicing elit. Minus at, 
                            </h5>
                            <p class="card-text text-center">
                
                              <strong class="">400.000</strong>
                            </p>
                            <div class="text-center">
                              <a href="#" class="btn btn-dark">
                                Order</a>
                              <a href="#" class="btn btn-dark">Buy now</a>
                            </div>
                          </div>
                          <span class="position-absolute   badge rounded-pill bg-danger">
                            SALE
                            <span class="visually-hidden">unread messages</span>
                          </span>
                        </div>
                      </div>
                      <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <div class="card position-relative product-card">
                          <img
                            src="https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/5d435d60d6d84f269e9bacfa014fcf3b_9366/Mu_Bong_Chay_Logo_DJen_GR9691_01_standard.jpg"
                            class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-text h5 card-name">
                              Lorem, ipsum dolor sit amet consectetur adipisicing elit. Minus at, 
                            </h5>
                            <p class="card-text text-center">
                
                              <strong class="">400.000</strong>
                            </p>
                            <div class="text-center">
                              <a href="#" class="btn btn-dark">
                                Order</a>
                              <a href="#" class="btn btn-dark">Buy now</a>
                            </div>
                          </div>
                          <span class="position-absolute   badge rounded-pill bg-danger">
                            SALE
                            <span class="visually-hidden">unread messages</span>
                          </span>
                        </div>
                      </div>
      
                      <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <div class="card position-relative product-card">
                          <img
                            src="https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/5d435d60d6d84f269e9bacfa014fcf3b_9366/Mu_Bong_Chay_Logo_DJen_GR9691_01_standard.jpg"
                            class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-text h5 card-name">
                              Lorem, ipsum dolor sit amet consectetur adipisicing elit. Minus at, 
                            </h5>
                            <p class="card-text text-center">
                
                              <strong class="">400.000</strong>
                            </p>
                            <div class="text-center">
                              <a href="#" class="btn btn-dark">
                                Order</a>
                              <a href="#" class="btn btn-dark">Buy now</a>
                            </div>
                          </div>
                          <span class="position-absolute   badge rounded-pill bg-danger">
                            SALE
                            <span class="visually-hidden">unread messages</span>
                          </span>
                        </div>
                      </div>
      
                      <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
                        <div class="card position-relative product-card">
                          <img
                            src="https://assets.adidas.com/images/h_840,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/5d435d60d6d84f269e9bacfa014fcf3b_9366/Mu_Bong_Chay_Logo_DJen_GR9691_01_standard.jpg"
                            class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-text h5 card-name">
                              Lorem, ipsum dolor sit amet consectetur adipisicing elit. Minus at, 
                            </h5>
                            <p class="card-text text-center">
                
                              <strong class="">400.000</strong>
                            </p>
                            <div class="text-center">
                              <a href="#" class="btn btn-dark">
                                Order</a>
                              <a href="#" class="btn btn-dark">Buy now</a>
                            </div>
                          </div>
                          <span class="position-absolute   badge rounded-pill bg-danger">
                            SALE
                            <span class="visually-hidden">unread messages</span>
                          </span>
                        </div>
                      </div>
                      
                      

                    <!-- phan trang -->
                    <div class="btn-toolbar justify-content-center webapp" role="toolbar"
                        aria-label="Toolbar with button groups">
                        <div class="btn-group" role="group" aria-label="Second group">
                            <button type="button" class="btn btn-secondary">1</button>
                            <button type="button" class="btn btn-secondary">2</button>
                            <button type="button" class="btn btn-secondary">3</button>
                        </div>
                    </div>
                </div>
                
                </form:form>
            </div>
        </div>
    </div>

	<jsp:include page="part/footer.jsp"></jsp:include>
  
</body>

</html>