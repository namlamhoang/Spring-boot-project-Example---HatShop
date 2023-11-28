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

<body class="body-register">
    <div class="container register">
      <div class="row">
        <div class="col-lg-10 col-xl-9 mx-auto">
          <div class="card flex-row my-5 border-0 shadow rounded-3 overflow-hidden">
            <div class="card-img-left-login d-none d-md-flex">
                     
            </div>
            <div class="card-body p-4 p-sm-5">
              <h3 class="login-heading mb-4">Edit password</h3>
              <form:form method="POST" action="../info/updateUser">
               <!-- check login error -->
               <c:if test="${trangthai == null}">
                 	<div class="alert alert-danger">
                  		<h4 class="alert-heading">vui lòng điền đầy đủ thông tin</h4>
					  	
					</div>
                 </c:if>
                 <c:if test="${trangthai == 2}">
                 	<div class="alert alert-danger">
                  		<h4 class="alert-heading">đổi mật khẩu thất bại (sai mật khẩu)</h4>
					  	
					</div>
                 </c:if>
                <c:if test="${trangthai == 1}">
                	<div class="alert alert-success">
                  		<h4 class="alert-heading">đổi mật khẩu thành công</h4>
					  	
					</div>
                </c:if>
                <c:if test="${trangthai == 3}">
                	<div class="alert alert-danger">
                  		<h4 class="alert-heading">Mật khẩu mới không trùng khớp</h4>
					  	
					</div>
                </c:if>
             
              
                  <div class="form-floating mb-3" style="display: none;">
                    <input name="username" type="text" class="form-control" id="floatingInput" required value="${user.userName}">
                    <label for="floatingInput">Username</label>
                  </div>
                  <div class="form-floating mb-3">
                    <input name="oldpassword" type="password" class="form-control" id="floatingPassword" required minlength="6">
                    <label for="floatingPassword">Old Password</label>
                  </div>
                  <div class="form-floating mb-3">
                    <input name="newpassword" type="password" class="form-control" id="floatingPassword" required minlength="6">
                    <label for="floatingPassword">new Password</label>
                  </div>
                  <div class="form-floating mb-3">
                    <input name="newwpassword" type="password" class="form-control" id="floatingPassword" required minlength="6">
                    <label for="floatingPassword">Confirm Password</label>
                  </div>
  
  
                  <div class="d-grid">
                    <button class="btn btn-lg btn-dark btn-login text-uppercase fw-bold mb-2" type="submit">Đồng ý</button>
                  </div>
                  <hr class="my-4">
                  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <a href="../home/view" class="btn btn-outline-secondary">home</a>
                  </div>
                  
                </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>
  
  <script src="../source/js/bootstrap.min.js"></script>
  
</body>

</html>