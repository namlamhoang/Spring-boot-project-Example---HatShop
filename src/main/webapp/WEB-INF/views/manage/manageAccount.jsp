<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
	        <h2 class="manage-header text-center">Manage Account</h2>
	        <div class="row">
	          <div class="col-12">
	            <nav class="navbar navbar-light bg-light">
	              <div class="container-fluid">
	                <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal">
	                  Add Account
	                </button>
	                <!-- form add  -->
	                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	                  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	                    <div class="modal-content">
	                      <div class="modal-header">
	                        <h5 class="modal-title" id="exampleModalLabel">Add Account</h5>
	                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                      </div>
	                      <div class="modal-body">
	                        <div class="manage-form">
	                          <form:form id="save" action="../system/saveUser" method="POST" enctype="multipart/form-data">
	                          
	                          	<!-- Username -->
	                            <div class="mb-3">
	                              <label class="form-label">Username</label>
	                              <input name="userName" type="text" class="form-control" required="required">
	                            </div>
	                            
	                            <!-- Password -->
	                            <div class="mb-3">
	                                <label class="form-label">Password</label>
	                                <input name="password" type="password" class="form-control" required="required">
	                            </div>
	                            
	                            <!-- Full Name -->
	                            <div class="mb-3">
	                              <label class="form-label">Full Name</label>
	                              <input name="fullName" type="text" class="form-control" required="required">
	                            </div>
	                            
	                            <!-- Email -->
	                            <div class="mb-3">
	                              <label class="form-label">Email</label>
	                              <input name="email" type="email" class="form-control" required="required">
	                            </div>
	                            
	                            <!-- Email -->
	                            <div class="mb-3">
	                              <label class="form-label">PHONE</label>
	                              <input name="phone" type="number" class="form-control">
	                            </div>
	                            
	                            <!-- Role -->
	                            <div class="mb-3">
	                              <label class="form-check-label" for="flexRadioDefault1">
	                                	User Role
	                              </label>
	                              <div class="form-check">
	                                <input class="form-check-input" type="radio" name="role" value="ROLE_CUSTOMER" id="flexRadioDefault1" checked>
	                                <label class="form-check-label" for="flexRadioDefault1">
	                                	Employee
	                                </label>
	                              </div>
	                              <div class="form-check">
	                                <input class="form-check-input" type="radio" name="role" value="ROLE_CUSTOMER" id="flexRadioDefault2">
	                                <label class="form-check-label" for="flexRadioDefault2">
	                                  	Customer
	                                </label>
	                              </div>
	                            </div>
	                            
	                            <!-- Role -->
	                            <div class="mb-3">
	                              <label class="form-check-label" for="flexRadioDefault1">
	                                	Active
	                              </label>
	                              <div class="form-check">
	                                <input class="form-check-input" type="radio" name="enabled" value="1" id="flexRadioDefault3" checked>
	                                <label class="form-check-label" for="flexRadioDefault3">
	                                	Enable
	                                </label>
	                              </div>
	                              <div class="form-check">
	                                <input class="form-check-input" type="radio" name="enabled" value="0" id="flexRadioDefault4">
	                                <label class="form-check-label" for="flexRadioDefault4">
	                                  	Disable
	                                </label>
	                              </div>
	                            </div>
	                            
	                            <!-- Email -->
	                            <div class="mb-3">
	                              <label class="form-label">Address</label>
	                              <textarea name="address" class="form-control"></textarea>
	                            </div>
	                            
	                            <!-- Image -->
	                            <label for="">Image</label>
	                            <div class="mb-3 input-group">
	                              <input name="image" type="file" class="form-control" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01"
	                                aria-label="Upload" placeholder="Addimage">
	                            </div>
	                            <div class="modal-footer">
	                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	                              <button type="submit" class="btn btn-dark">Save</button>
	                            </div>
	                          </form:form>
	                        </div>
	                      </div>
	  
	                    </div>
	                  </div>
	                </div>
	                <a class="navbar-brand"></a>
	                <form:form class="d-flex" action="../system/getFile2" method="POST">
	                  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	                  <button class="btn btn-outline-dark" type="submit">Search</button>
	                </form:form>
	              </div>
	            </nav>
	            <table class="table ">
	              <thead class="table-dark">
	                <tr>
	                  <th scope="col">No</th>
	                  <th scope="col">IMAGE</th>
	                  <th scope="col">Username</th>
	                  <th scope="col">Full name</th>
	                  <th scope="col">Phone</th>
	                  <th scope="col">Email</th>
	                  <th scope="col">Address</th>
	                  <th scope="col">Role</th>
	                  <th scope="col">Active</th>
	                  <th scope="col">Edit</th>
	                </tr>
	              </thead>
	              <tbody id="data" class="">
	              <c:forEach items="${listUser}" var="user" varStatus="status">
		                <tr>
		                  <td scope="row">${status.count}</td>
		                  <td>
		                  <c:if test="${user.image != null}">
		                  	<img  alt="${user.image}"src="data:image/jpg;base64,${user.image}"  style="width:50px;height:50px;">
		                  </c:if>
		                  <c:if test="${user.image == null}">
		                  	<img  src="../source/img/unnamed.jpg" style="width:50px;height:50px;">
		                  </c:if>
		                  </td>
		                  <td>${user.userName}</td>
		                  <td style="display:none">${fn:substring(user.password,6,12)}</td>
		                  <td>${user.fullName}</td>
		                  <td>${user.phone}</td>
		                  <td>${user.email}</td>
		                  <td>${user.address}</td>
		                  <c:if test="${user.authorities.size() < 2}">
		                  		<td>false</td>
		                  </c:if>
		                  <c:if test="${user.authorities.size() > 1}">
		                  		<td>true</td>
		                  </c:if>
		                  
		                  <c:if test="${user.enabled == 1}">
		                  <td>true</td>
		                  </c:if>
		                  <c:if test="${user.enabled != 1}">
		                  <td>false</td>
		                  </c:if>
		                  <td><a href="#" class="btn btn-outline-danger"  data-bs-toggle="modal" data-bs-target="#editModal" id="edit">edit</a></td>
		                </tr>
					</c:forEach>
	              </tbody>
	            </table>
	            <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
	              <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	                <div class="modal-content">
	                  <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">Edit product</h5>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                  </div>
	                  <div class="modal-body">
	                    <div class="manage-form">
	                      <form:form action="../system/updateUser" method="POST" enctype="multipart/form-data">
	                          
	                          	<!-- Username -->
	                            <div class="mb-3">
	                              <label class="form-label">Username</label>
	                              <input name="userName" type="text" class="form-control" required="required">
	                            </div>
	                            
	                            <!-- Password -->
	                            <div class="mb-3">
	                                <label class="form-label">Password</label>
	                                <input name="password" type="password" class="form-control" required="required">
	                            </div>
	                            
	                            <!-- Full Name -->
	                            <div class="mb-3">
	                              <label class="form-label">Full Name</label>
	                              <input name="fullName" type="text" class="form-control" required="required">
	                            </div>
	                            
	                            <!-- Email -->
	                            <div class="mb-3">
	                              <label class="form-label">Email</label>
	                              <input name="email" type="email" class="form-control" required="required">
	                            </div>
	                            
	                            <!-- Email -->
	                            <div class="mb-3">
	                              <label class="form-label">PHONE</label>
	                              <input name="phone" type="number" class="form-control">
	                            </div>
	                            
	                            <!-- Role -->
	                            <div class="mb-3">
	                              <label class="form-check-label" for="flexRadioDefault1">
	                                	User Role
	                              </label>
	                              <div class="form-check">
	                                <input class="form-check-input" type="radio" name="role" value="ROLE_EMPLOYEE" id="employee">
	                                <label class="form-check-label" for="flexRadioDefault5">
	                                	Employee
	                                </label>
	                              </div>
	                              <div class="form-check">
	                                <input class="form-check-input" type="radio" name="role" value="ROLE_CUSTOMER" id="customer">
	                                <label class="form-check-label" for="flexRadioDefault6">
	                                  	Customer
	                                </label>
	                              </div>
	                            </div>
	                            
	                            <!-- Role -->
	                            <div class="mb-3">
	                              <label class="form-check-label" for="flexRadioDefault1">
	                                	Active
	                              </label>
	                              <div class="form-check">
	                                <input class="form-check-input" type="radio" name="enabled" value="1" id="enable">
	                                <label class="form-check-label" for="flexRadioDefault7">
	                                	Enable
	                                </label>
	                              </div>
	                              <div class="form-check">
	                                <input class="form-check-input" type="radio" name="enabled" value="0" id="disable">
	                                <label class="form-check-label" for="flexRadioDefault8">
	                                  	Disable
	                                </label>
	                              </div>
	                            </div>
	                            
	                            <!-- Email -->
	                            <div class="mb-3">
	                              <label class="form-label">Address</label>
	                              <textarea name="address" class="form-control"></textarea>
	                            </div>
	                            
	                            <!-- Image -->
	                            <label for="">Image</label>
	                            <div class="mb-3 input-group">
	                              <input name="image" type="file" class="form-control" id="inputGroupFile02" aria-describedby="inputGroupFileAddon02"
	                                aria-label="Upload" placeholder="Addimage">
	                            </div>
	                            <div class="modal-footer">
	                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	                              <button type="submit" class="btn btn-dark">Save</button>
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
  			var ur = $(r).children("td").eq(8).text();
  			var e = $(r).children("td").eq(9).text();
  			$("#editModal input[name='userName']").val($(r).children("td").eq(2).text());
  			$("#editModal input[name='password']").val($(r).children("td").eq(3).text());
  			$("#editModal input[name='fullName']").val($(r).children("td").eq(4).text());
  			$("#editModal input[name='phone']").val($(r).children("td").eq(5).text());
  			$("#editModal input[name='email']").val($(r).children("td").eq(6).text());
  			$("#editModal input[name='address']").val($(r).children("td").eq(7).text());
			if(ur=="true") $("#employee").attr('checked', 'checked');
			if(ur!="true") $("#customer").attr('checked', 'checked');
			if(e=="true") $("#enable").attr('checked', 'checked');
			if(e!="true") $("#disable").attr('checked', 'checked');
  		})
  		
  	});
  </script>
  
</body>

</html>