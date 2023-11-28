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
            <div class="shopping-cart">
                <div class="row">
                    <h3 class="shopping-cart-content">Confirm delivery information</h3>
                    <div class="col-8">
                        <div class="card buy-card">
                            <form:form action="../pay/confirm" method="GET"> 
                                <div class="mb-3">
                                  <label for="exampleInputEmail1" class="form-label">Full Name</label>
                                  <input type="text" class="form-control" value="${user.fullName}">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email</label>
                                    <input type="email" class="form-control" value="${user.email}">
                                  </div>
                                <div class="mb-3">
                                    <label for="exampleInputAddress" class="form-label">Address</label>
                                    <textarea class="form-control">${user.address}</textarea>
                                  </div>
                                  <div class="mb-3">
                                    <label for="exampleInputPhone" class="form-label">Phone</label>
                                    <input type="number" class="form-control" value="${user.phone}">
                                  </div>
                                  <div class="mb-3">
                                    <label for="exampleInputPhone" class="form-label">Payment Methods</label>
                                    <select disabled="disabled">
                                    	<option>Delivery</option>
                                    </select>
                                  </div>
                                <div class="d-grid gap-2 col-6 mx-auto">
                                  <button type="submit" class="btn btn-danger" id="submit">Confirm and order</button>
                                </div>
                              </form:form>
                        </div>
                          
                    </div>
                    <div class="col-4">
                        <table class="table">
                            <thead class="table-dark">
                              <tr>
                                <th scope="col">Tổng Tiền</th>
                                <th></th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <th scope="row">Tạm tính</th>
                                <td>${total}</td>
                                
                              </tr>
                              <tr>
                                <th scope="row">Tổng</th>
                                <td>${total}</td>
                              </tr> 
                            </tbody>
                          </table>
                         
                          
                    </div>
                </div>
            </div>
        </div>
    </div>

	<jsp:include page="part/footer.jsp"></jsp:include>
	
	 <script type="text/javascript">
  	
  	$(document).ready(function(){
  		if(!${mess.error}){
  	  		alert("${mess.message}");
  	  		$("#submit").prop('disabled', true);
  	  	}
  	});
  </script>
</body>

</html>