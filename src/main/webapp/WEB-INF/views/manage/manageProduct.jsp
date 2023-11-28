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
	<div>
   		<div class="row">	

  <jsp:include page="menu.jsp"></jsp:include>
  	
	  	 <div class="col-10 overflow-auto" style="height: 100vh;">
	        <h2 class="manage-header text-center">Manage Product</h2>
	        <div class="row">
	          
	          <div class="col-12">
	            <nav class="navbar navbar-light bg-light">
	              <div class="container-fluid">
	                <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal">
	                  Add Product
	                </button>
	                <!-- form add  -->
	                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	                  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	                    <div class="modal-content">
	                      <div class="modal-header">
	                        <h5 class="modal-title" id="exampleModalLabel">Add product</h5>
	                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                      </div>
	                      <div class="modal-body">
	                        <div class="manage-form">
	                          <form:form action="../employee/saveProduct" method="POST"  enctype="multipart/form-data">
		                      
		                      	<input name="productCode" type="hidden" value="-1">
	                      
		                        <div class="mb-3">
		                          <label class="form-label">Name</label>
		                          <input type="text" name="productName" class="form-control" required="required">
		                        </div>
		                        
		                        <div class="mb-3">
		                          <label class="form-label">Price</label>
		                          <input type="number" name="price" class="form-control" required="required">
		                        </div>
		                        
		                        <div class="mb-3">
		                          <label class="form-label">Quantity</label>
		                          <input type="number" name="quantity" class="form-control" required="required">
		                        </div>
		                        
		                        <div class="mb-3">
		                          <label class="form-label">Description</label>
		                          <textarea name="description" class="form-control">
		                          </textarea>
		                        </div>
		                        
		                        <div class="mb-3">
		                          <label class="form-label">Brand</label>
		                          <select name="brandCode" class="form-select" aria-label="Default select example" required="required">
		                          		<option value="" > - </option>
		                          	<c:forEach items="${listBrand}" var="brand" varStatus="status">
		                            	<option value="${brand.brandCode}"> ${brand.brandName}</option>
		                           	</c:forEach>
		                          </select>
		                        </div>
		                        
		                        <div class="mb-3">
		                          <label class="form-label">Catelory</label>
		                          <select name="categoryCode" class="form-select" aria-label="Default select example" required="required">
		                          		<option value="" > - </option>
		                          	<c:forEach items="${listCategory}" var="category" varStatus="status">
		                            	<option value="${category.categoryCode}"> ${category.categoryName}</option>
		                           	</c:forEach>
		                          </select>
		                        </div>
	                        
		                        <div class="mb-3 input-group">
		                          <input name="image" type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04"
		                            aria-label="Upload">
		                        </div>
		                        
		                        <div class="modal-footer">
		                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		                          <button type="submit" class="btn btn-dark">Save changes</button>
		                        </div>
		                      </form:form>
	                        </div>
	                      </div>
	                     
	                    </div>
	                  </div>
	                </div>
	                <a class="navbar-brand"></a>
	                <form class="d-flex">
	                  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	                  <button class="btn btn-outline-dark" type="submit">Search</button>
	                </form>
	              </div>
	            </nav>
	            <table class="table ">
	              <thead class="table-dark">
	                <tr>
	                  <th scope="col">NO</th>
	                  <th scope="col">IMAGE</th>
	                  <th scope="col">NAME</th>
	                  <th scope="col">PRICE</th>
	                  <th scope="col">QUANTITY</th>
	                  <th scope="col">BRAND</th>
	                  <th scope="col">CATEGORY</th>
	                  <th scope="col">IS DELETE</th>
	                  <th scope="col">Edit</th>
	                </tr>
	              </thead>
	              <tbody id="data" class="">
	              	<c:forEach items="${listProduct}" var="product" varStatus="status">
		                <tr>
		                  <th scope="row">${status.count}</th>
		                  <td style="display:none">${product.productCode}</td>
		                  <td>
		                  <c:if test="${product.image != null}">
		                  	<img  alt="${product.image}"src="data:image/jpg;base64,${product.image}"  style="width:50px;height:50px;">
		                  </c:if>
		                  <c:if test="${product.image == null}">
		                  	<img  src="../source/img/ad_1.jpg" style="width:50px;height:50px;">
		                  </c:if>
		                   </td>
		                  <td>${product.productName}</td>
		                  <td>${product.price}</td>
		                  <td>${product.quantity}</td>
		                  <td style="display:none">${product.description}</td>
		                  <td style="display:none">${product.brandCode}</td>
		                  <td>
				              <c:forEach items="${listBrand}" var="brand" varStatus="status">
				              	  <c:if test="${brand.brandCode == product.brandCode}">
				                  		${brand.brandName}
				                  </c:if>
				              </c:forEach>
		                  </td>
		                  <td style="display:none">${product.categoryCode}</td>
		                  <td>
			                  <c:forEach items="${listCategory}" var="category" varStatus="status">
				              	  <c:if test="${category.categoryCode == product.categoryCode}">
				                  		${category.categoryName}
				                  </c:if>
				              </c:forEach>
		                  </td>
		                  <td>${product.isDelete}</td>
		                  <td>
		                    <a href="#" class="btn btn-outline-danger"  data-bs-toggle="modal" data-bs-target="#editModal" id="edit">edit</a>
		                  </td>
		                </tr>
					</c:forEach>
	              </tbody>
	            </table>
	            <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	              <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	                <div class="modal-content">
	                  <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">Edit product</h5>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                  </div>
	                  <div class="modal-body">
	                    <div class="manage-form">
	                      <form:form action="../employee/updateProduct" method="POST"  enctype="multipart/form-data">
	                      
	                      	<input name="productCode" type="hidden" value="">
	                      
	                        <div class="mb-3">
	                          <label class="form-label">Name</label>
	                          <input type="text" name="productName" class="form-control" required="required">
	                        </div>
	                        
	                        <div class="mb-3">
	                          <label class="form-label">Price</label>
	                          <input type="number" name="price" class="form-control" required="required">
	                        </div>
	                        
	                        <div class="mb-3">
	                          <label class="form-label">Quantity</label>
	                          <input type="number" name="quantity" class="form-control" required="required">
	                        </div>
	                        
	                        <div class="mb-3">
	                          <label class="form-label">Description</label>
	                          <textarea name="description" class="form-control">
	                          </textarea>
	                        </div>
	                        
	                        <div class="mb-3">
	                          <label class="form-label">Brand</label>
	                          <select name="brandCode" class="form-select" aria-label="Default select example" required="required">
	                          		<option value="" > - </option>
	                          	<c:forEach items="${listBrand}" var="brand" varStatus="status">
	                            	<option value="${brand.brandCode}"> ${brand.brandName}</option>
	                           	</c:forEach>
	                          </select>
	                        </div>
	                        
	                        <div class="mb-3">
	                          <label class="form-label">Catelory</label>
	                          <select name="categoryCode" class="form-select" aria-label="Default select example" required="required">
	                          		<option value=""> - </option>
	                          	<c:forEach items="${listCategory}" var="category" varStatus="status">
	                            	<option value="${category.categoryCode}"> ${category.categoryName}</option>
	                           	</c:forEach>
	                          </select>
	                        </div>
	                        
	                        <div class="mb-3">
	                          <label class="form-check-label" for="flexRadioDefault1">
	                            IsDelete
	                          </label>
	                          <div class="form-check">
	                            <input value="1" class="form-check-input" type="radio" name="isDelete" id="deleteTrue">
	                            <label class="form-check-label" for="deleteTrue">
	                              true
	                            </label>
	                          </div>
	                          <div class="form-check">
	                            <input value="0" class="form-check-input" type="radio" name="isDelete" id="deleteFalse">
	                            <label class="form-check-label" for="deleteFalse">
	                              false
	                            </label>
	                          </div>
	                        </div>
	                        <div class="mb-3 input-group">
	                          <input name="image" type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04"
	                            aria-label="Upload">
	                        </div>
	                        <div class="modal-footer">
	                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	                          <button type="submit" class="btn btn-dark">Save changes</button>
	                        </div>
	                      </form:form>
	                    </div>
	                  </div>
	                 
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	        
	      </div>
    </div>
  </div>
  
  <script src="../source/js/bootstrap.min.js"></script>
  
  <script type="text/javascript">
  	
  	$(document).ready(function(){
  		if(${mess.error}){
  	  		alert("${mess.message}");
  	  	}
  		
  		$("#data").on("click","#edit",function(){
  			var r = $(this).parent().parent();
  			var id = $(r).children("td").eq(10).text();
  			$("#editModal input[name='productCode']").val($(r).children("td").eq(0).text());
  			$("#editModal input[name='productName']").val($(r).children("td").eq(2).text());
  			$("#editModal input[name='price']").val($(r).children("td").eq(3).text());
  			$("#editModal input[name='quantity']").val($(r).children("td").eq(4).text());
  			$("#editModal textarea[name='description']").val($(r).children("td").eq(5).text());
  			$("#editModal select[name='brandCode']").val($(r).children("td").eq(6).text());
  			$("#editModal select[name='categoryCode']").val($(r).children("td").eq(8).text());
  			if(id==1) $("#deleteTrue").attr('checked', 'checked');
  			if(id!=1) $("#deleteFalse").attr('checked', 'checked');
  		})
  		
  	});
  </script>
  
</body>

</html>