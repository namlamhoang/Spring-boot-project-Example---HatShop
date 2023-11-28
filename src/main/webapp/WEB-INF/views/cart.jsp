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
                    <h3 class="shopping-cart-content">Shopping cart</h3>
                    <div class="col-8">
                        <table class="table">
                            <thead class="table-dark">
                                <tr>
                                	<th scope="col">Image</th>
                                    <th scope="col">Sản phẩm</th>
                                    <th scope="col">Giá</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">tổng</th>
                                    <th scope="col"></th>
                                  </tr>
                            </thead>
                            <tbody id="data">
                            <c:forEach items="${orderList}" var="detail">
                                <tr>
                                    <th scope="row"><img  alt="${detail.image}"src="data:image/jpg;base64,${detail.image}"  style="width:40px;height:40px;"></th>
                                    <th scope="row">${detail.productName}</th>
                                    <td style="display:none">${detail.productCode}</td>
                                    <td>${detail.price}</td>
                                    <td>
                                    	<c:forEach items="${productList}" var="product">
                                    	<c:if test="${product.productCode==detail.productCode}">
                                        <div class="quantity buttons_added">
                                            <input type="number" id="quantity_617b60ef0d953" class="input-text qty text" step="1" min="1" 
                                            max="${product.quantity}" 
                                            value="${detail.quantity}" title="SL" size="4" pattern="[0-9]*" inputmode="numeric" 
                                            >
                                        </div>
                                        </c:if>
                                        </c:forEach>
                                    </td>
                                    <td>175,000₫</td>
                                    <td><a href="javascript:void()" class="shopping-cart-content-link" id="del"><i class="fa fa-times-circle"></i></a></td>
                                  </tr>
                             </c:forEach>
                            </tbody>
                          </table>
                          <a href="../home/view" class="btn btn-outline-dark"><i class="fa fa-arrow-left"></i> Tiếp tục xem sản phẩm</a>
                          <button class="btn btn-dark" id="submit">Cập nhật giỏ hàng</button>
                    </div>
                    <div class="col-4">
                        <table class="table">
                            <thead class="table-dark">
                              <tr>
                                <th scope="col">Tổng Tiền</th>
                                <th></th>
                              </tr>
                            </thead>
                            <tbody  id="crash">
                              <tr>
                                <th scope="row">Tạm tính</th>
                                <td id="tt">175,000₫</td>
                                
                              </tr>
                              <tr>
                                <th scope="row">Tổng</th>
                                <td id="tgt">175,000₫</td>
                              </tr> 
                            </tbody>
                          </table>
                          <div class="d-grid gap-2">
                            <button class="btn btn-danger" id="order">Đặt hàng</button>
                            <h5>Phiếu ưu đãi</h5>
                          <input type="text" class="form-control" placeholder="Nhập mã giảm giá">
                          <a class="btn btn-outline-dark">Áp dụng</a>
                          </div>
                         
                          
                    </div>
                </div>
            </div>
        </div>
    </div>

	<jsp:include page="part/footer.jsp"></jsp:include>
  	
</body>

	  <script type="text/javascript">
	  	$(document).ready(function(){
	  		crash();
	  		function crash(){
	  			var tc = 0;
	  			$("#data > tr").each(function() {
	  				$(this).children("td").eq(3).text($(this).children("td").eq(1).text()*$(this).children("td").eq(2).find("input").val());
	  				tc = tc + Number($(this).children("td").eq(3).text());
				});
	  			$("#crash #tt").text(tc);
	  			$("#crash #tgt").text(tc);
	  		}
	  		$("#data").on('change', '#quantity_617b60ef0d953', function() {
	  			crash();
	  		});
			$("#data").on('click', '#del', function() {
	  			$(this).parent().parent().remove();
	  			crash();
	  		});
	  		$("#submit").click(function(){
	  			var odl = [],ob ={};
	  			$("#data > tr").each(function(index) {
	  				odl[index] = {};
	  				odl[index].productCode = $(this).children("td").eq(0).text();
	  				odl[index].quantity = $(this).children("td").eq(2).find("input").val();
				});
	  			ob.odl = odl;
	  			$("#odl").val(JSON.stringify(ob));
	  			$("#form").submit();
	  		});
	  		$("#order").click(function(){
	  			if($("#user").val()==1){
	  				if ($("#data > tr").length==0) {
		  				alert("please add cart at least 1 product");
		  				window.location.href = "../loginPage/view";
		  			} else {
		  				window.location.href = "../pay/view";
		  			}
	  			} else {
	  				alert("Please login or register user before order");
	  				window.location.href = "../loginPage/view";
	  			}
	  		});
	  		
	  	});
	  </script>

</html>