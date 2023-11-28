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
	        <h2 class="manage-header text-center">Manage Order</h2>
	        <div class="row">
	          
	          <div class="col-12">
	            <nav class="navbar navbar-light bg-light">
	              <div class="container-fluid">
	                
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
	                  <th scope="col">UserName</th>
	                  <th scope="col">Date</th>
	                  <th scope="col">Detail</th>
	                  <th scope="col">Confirm</th>
	                </tr>
	              </thead>
	               <tbody id="data" class="">
	               <c:forEach items="${orderList}" var="item" varStatus="status">
		                <tr>
		                  <th scope="row">${status.count}</th>
		                  <td style="display:none">${item.orderCode}</td>
			              <td>${item.userName}</td>
			              <td>${item.orderDate}</td>
			              <td>
		                    <button class="btn btn-outline-danger"  data-bs-toggle="modal" data-bs-target="#exampleModal" id="sd">ShowDetail</button>
		                  </td>
		                  <td>
		                    <button class="btn btn-outline-danger"  data-bs-toggle="modal" data-bs-target="#editModal" id="cf">Confirm</button>
		                  </td>
		                </tr>
					</c:forEach>
	              </tbody>
	            </table>
	            
	            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	              <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	                <div class="modal-content">
	                  <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">View Detail</h5>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                  </div>
	                  <div class="modal-body">
	                    <div class="manage-form">
	                    	<div class="list-group" id="orderDetailList"></div>
	                        <div class="modal-footer">
	                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	                        </div>
	                    </div>
	                  </div>
	                 
	                </div>
	              </div>
	            </div>
	            
	            
	            <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	              <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	                <div class="modal-content">
	                  <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">Edit product</h5>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                  </div>
	                  <div class="modal-body">
	                    <div class="manage-form">
	                      <form:form id="formDetail" action="../employee/confirmOrder" method="POST">
	                        Delivery yet?
	                        <div class="modal-footer">
	                          <input type="hidden" name="odc">
	                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	                          <c:if test="${status == 0}">
	                          <input type="hidden" name="cf" value="1">
	                          <button type="submit" class="btn btn-dark">Delivered</button>
	                          </c:if>
	                          <c:if test="${status == 1}">
	                          <input type="hidden" name="cf" value="0">
	                          <button type="submit" class="btn btn-dark">Not yet</button>
	                          </c:if>
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
		$("#data").on("click","#cf",function(){
			$("input[name='odc']").val($(this).parent().parent().children("td").eq(0).text());
		});
		$("#data").on("click","#sd",function(){
			$("input[name='odc']").val($(this).parent().parent().children("td").eq(0).text());
			getDetail();
		});
	});
  	</script>
</body>

</html>