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
      <div class="row">
        <div class="col-sm-3">
          <!-- catelory start -->
          <table class="table">
            <thead class="table-dark">
              <tr>
                <th scope="col" class="catelory-header-text">ALL departments</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="brand" items="${brandList}">
              <tr>
                <th scope="row"> <a href="../search/view?b=${brand.brandCode}" class="list-group-item list-group-item-action">${brand.brandName}</a></th>
              </tr>
            </c:forEach>

            </tbody>
          </table>
        </div>
        <div class="col-sm-9">
          <nav class="navbar navbar-expand-lg navbar-light bg-light delete-pd create-mg-bt">
            <div class="container">
              <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-left:0;margin-right: 0;">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                      data-bs-toggle="dropdown" aria-expanded="false">
                      Tất cả danh mục
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <c:forEach var="category" items="${categoryList}">
                      <li><a class="dropdown-item" href="../search/view?c=${category.categoryCode}" >${category.categoryName}</a></li>
                    </c:forEach>
                    </ul>
                  </li>
                </ul>
                <form:form class="d-flex" action="../search/view" method="get">
                  <input class="form-control me-2" type="search" placeholder="search" aria-label="Search" name="k">
                  <button class="btn btn-outline-dark" type="submit">search</button>
                </form:form>
              </div>
            </div>
          </nav>
          <!-- carousel start  -->
          <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel" style="max-height: 530px;">
            <div class="carousel-inner">
              <div class="carousel-item active" data-bs-interval="10000" style="max-height: 530px;">
                <img src="https://logan.nnnow.com/content/dam/nnnow-project/23-nov-2020/CAPS-PLPBanner-MOB.jpg"
                  class="d-block w-100" alt="Photo">
              </div>
              <div class="carousel-item" data-bs-interval="2000" style="max-height: 530px;">
                <img src="https://www.pngitem.com/pimgs/m/231-2317665_cap-banner-design-hd-png-download.png"
                  class="d-block w-100" alt="Photo">
              </div>
              <div class="carousel-item" style="max-height: 530px;">
                <img
                  src="https://www.nicepng.com/png/detail/167-1679348_custom-cap-manufacturer-hat-supplier-cap-supplier-caps.png"
                  class="d-block w-100" alt="Photo">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval"
              data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval"
              data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
        </div>
      </div>
      <!-- catelory start  -->
      <div class="row webapp">
        <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
          <div class="card" style="width: 18rem;">
            <img
               src="https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2020/10/mu-mlb-monogram-blue-jacquard-bucket-hat-32cphv011-50n-mau-xanh-bo-5f83afcff23a3-12102020082223.jpg"
              class="card-img-top" alt="...">
            <div class="card-body text-center">
              <h5 class="card-title">Mũ Lưỡi trai</h5>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
          <div class="card" style="width: 18rem;">
            <img
              src="https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2020/10/mu-mlb-monogram-blue-jacquard-bucket-hat-32cphv011-50n-mau-xanh-bo-5f83afcff23a3-12102020082223.jpg"
              class="card-img-top" alt="...">
            <div class="card-body text-center">
              <h5 class="card-title">Mũ bành</h5>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
          <div class="card" style="width: 18rem;">
            <img
              src="https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2020/11/mu-mlb-jelly-beanie-new-york-yankees-32cpb5011-50l-mau-den-5fa51302ecf6e-06112020161026.jpg"
              class="card-img-top" alt="...">
            <div class="card-body text-center">
              <h5 class="card-title">Mũ len</h5>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
          <div class="card" style="width: 18rem;">
            <img src="https://armyhaus.com/wp-content/uploads/2018/09/m20c-ruby1.jpg" class="card-img-top" alt="...">
            <div class="card-body text-center">
              <h5 class="card-title">Mũ bảo hiểm</h5>
            </div>
          </div>
        </div>

      </div>
      <!-- product start  -->
      <h3 class="text-center webapp product-content">Special Product</h3>
      <hr class="">
    </div>
    
    <div class="row webapp" id="data">
      <!-- view sản phẩm ở đây dùng vòng lặp -->
      <c:forEach var="item" items="${productList}" begin="${(page-1)*12}" end="${(page-1)*12 + 11}">
      <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
        <div class="card position-relative product-card">
        <a href="../product/view?p=${item.productCode}">
        
          <c:if test="${item.image != null}">
		       <img  alt="${item.image}"src="data:image/jpg;base64,${item.image}" class="card-img-top" alt="photo">
		  </c:if>
		  <c:if test="${item.image == null}">
		       <img  src="../source/img/ad_1.jpg" class="card-img-top" alt="photo">
		   </c:if>
            
        </a>
          <div class="card-body">
            <h5 class="card-text h5 card-name">
              ${item.productName} 
            </h5>
            <p class="card-text text-center">

              <strong class="">${item.price}</strong>
            </p>
            <div class="text-center">
	            <input type="hidden" value="${item.productCode}">
	            <input type="hidden" value="1" name="q">
	            <button class="btn btn-dark" name="order">Order</button>
	            <a class="btn btn-dark" href="../cart/addAndViewCart?p=${item.productCode}">Buy now</a>
            </div>
          </div>
          <span class="position-absolute   badge rounded-pill bg-danger">
            SALE
            <span class="visually-hidden">unread messages</span>
          </span>
        </div>
      </div>
    </c:forEach>
      <!-- phan trang -->
      <div class="btn-toolbar justify-content-center webapp" role="toolbar" aria-label="Toolbar with button groups">
        <nav aria-label="...">
		  <ul class="pagination">
		  
		  <c:if test="${page > 1}">
		  	<li class="page-item">
		  		<a class="page-link text-dark" href="../home/view?p=${page-1}">Previous</a>
			</li>
		  </c:if>
		  
		  <c:if test="${page <= 1}">
		  	<li class="page-item disabled">
		  		<a class="page-link" href="javascript:void()" tabindex="-1" aria-disabled="true">Previous</a>
			</li>
		  </c:if>
		 
		  <li class="page-item " aria-current="page">
				<a class="page-link text-white bg-dark" href="javascript:void()">${page}
		    		<span class="sr-only">(current)</span>
				</a>
		  </li>
			
		  <c:if test="${page < totalPage}">
		  	<li class="page-item">
		  		<a class="page-link text-dark" href="../home/view?p=${page+1}">Next</a>
			</li>
		  </c:if>
		  <c:if test="${page >= totalPage}">
		  	<li class="page-item disabled">
		  		<a class="page-link" href="javascript:void()" tabindex="-1" aria-disabled="true">Next</a>
			</li>
		  </c:if>
		  
		  </ul>
		</nav>
      </div>

    </div>
  </div>
 
  <jsp:include page="part/footer.jsp"></jsp:include>s
	
</body>


</html>