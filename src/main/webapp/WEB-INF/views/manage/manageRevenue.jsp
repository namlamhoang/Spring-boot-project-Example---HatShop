<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	        <h2 class="manage-header text-center">Manage Revenue</h2>
	        <div class="row">
	          
	          <div class="col-12">
				<nav class="navbar navbar-light bg-light" >
					<div class="container-fluid">
					  <div>TotalRevenue:${total}</div>
					  <a class="navbar-brand"></a>
					   <form:form action="../system/getRevenue" method="POST" class="d-flex"  >
						  <div><input type="date" name="from" class="form-control" value='<fmt:formatDate value="${from}" pattern="YYYY-MM-DD"/>' /></div>
						  <div><input type="date" name="to" class="form-control" value='<fmt:formatDate value="${to}" pattern="YYYY-MM-DD"/>' /></div>
						  <button type="submit" class="btn btn-dark">Search</button>
					  </form:form>
					</div>
				  </nav>
	            <table class="table ">
	              <thead class="table-dark">
	                <tr>
	                  <th scope="col">No</th>
	                  <th scope="col">UserName</th>
	                  <th scope="col">OrderCode</th>
	                  <th scope="col">OrderDate</th>
	                   <th scope="col">PriceTag</th>
	                </tr>
	              </thead>
	              <tbody id="data" class="">
	              <c:forEach var="item" items="${revenueList}" varStatus="status">
	              	<tr>
		             	<td scope="row">${status.count}</td>
		             	<td>${item.userName}</td>
		             	<td>${item.orderCode}</td>
		             	<td>${item.orderDate}</td>
		             	<td>${priceList.get(status.index)}</td>
	             	</tr>
	             	</c:forEach>
	              </tbody>
	            </table>
	            
	           
	          </div>
	        </div>
	      </div>
	      
		</div>
	</div>
  	<script src="../source/js/bootstrap.min.js"></script>
  
</body>

</html>