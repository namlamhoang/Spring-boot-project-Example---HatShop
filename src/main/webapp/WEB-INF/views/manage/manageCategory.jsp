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
	        <h2 class="manage-header text-center">Manage Category</h2>
	        <div class="row">
	          
	          <div class="col-12">
	            <nav class="navbar navbar-light bg-light">
	              <div class="container-fluid">
	                <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal" >
	                  Add Category
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
	                          <form:form action="../system/saveCategory" method="POST" modelAttribute="category">
	                          	<input type="hidden" name="categoryCode" value="-1">
	                            <div class="mb-3">
	                              <label class="form-label">Name</label>
	                              <input name="categoryName" type="text" class="form-control" required="required">
	                            </div>
	                            
	                            <div class="mb-3">
	                              <label class="form-check-label">
	                                Available
	                              </label>
	                              <div class="form-check">
	                                <input class="form-check-input" value="0" type="radio" name="isDelete" id="flexRadioDefault1" checked="checked">
	                                <label class="form-check-label" for="availableTrue">
	                                  true
	                                </label>
	                              </div>
	                              <div class="form-check">
	                                <input class="form-check-input" value="1" type="radio" name="isDelete" id="flexRadioDefault2">
	                                <label class="form-check-label" for="availableFalse">
	                                  false
	                                </label>
	                              </div>
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
	                  <th scope="col">No</th>
	                  <th scope="col">Category Name</th>
	                  <th scope="col">Active</th>
	                  <th scope="col">Edit</th>
	                </tr>
	              </thead>
	              <tbody id="data" class="">
	               <c:forEach items="${listCategory}" var="category" varStatus="status">
		                <tr>
		                  <th scope="row">${status.count}</th>
		                  <td style="display:none">${category.categoryCode}</td>
			              <td>${category.categoryName}</td>
			              <c:if test="${category.isDelete == 0}">
			              	<td>true</td>
			              </c:if>
			              <c:if test="${category.isDelete != 0}">
			              	<td>false</td>
			              </c:if>
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
	                      <form:form action="../system/updateCategory" method="POST" modelAttribute="category">
	                          	<input type="hidden" name="categoryCode" value="">
	                            <div class="mb-3">
	                              <label class="form-label">Name</label>
	                              <input name="categoryName" type="text" class="form-control" required="required">
	                            </div>
	                            
	                            <div class="mb-3">
	                              <label class="form-check-label">
	                                Available
	                              </label>
	                              <div class="form-check">
	                                <input class="form-check-input" value="0" type="radio" name="isDelete" id="availableTrue" >
	                                <label class="form-check-label" for="availableTrue">
	                                  true
	                                </label>
	                              </div>
	                              <div class="form-check">
	                                <input class="form-check-input" value="1" type="radio" name="isDelete" id="availableFalse">
	                                <label class="form-check-label" for="availableFalse">
	                                  false
	                                </label>
	                              </div>
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
			var a = $(r).children("td").eq(2).text();
			$("#editModal input[name='categoryCode']").val($(r).children("td").eq(0).text());
			$("#editModal input[name='categoryName']").val($(r).children("td").eq(1).text());
			if(a=="true") $("#availableTrue").attr('checked', 'checked');
			if(a!="true") $("#availableFalse").attr('checked', 'checked');
		})
  		
  	});
  </script>
  
</body>

</html>