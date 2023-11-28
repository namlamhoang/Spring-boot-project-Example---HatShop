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
                <h3 class="login-heading mb-4">Login</h3>
                <form:form method="POST" action="loging" modelAttribute="user">
                
                <!-- check login error -->
                 <c:if test="${param.error != null}">
                 	<div class="alert alert-danger">
                  		<h4 class="alert-heading">Login Fail!</h4>
					  	Invilid Name and Password.
					</div>
                 </c:if>
          		<!-- check logout -->
                <c:if test="${param.logout != null}">
                	<div class="alert alert-success">
                  		<h4 class="alert-heading">Login Out Success</h4>
					  	You have been logged out.
					</div>
                </c:if>
                
                    <div class="form-floating mb-3">
                      <input name="username" type="text" class="form-control" id="floatingInput" required>
                      <label for="floatingInput">Username</label>
                    </div>
                    <div class="form-floating mb-3">
                      <input name="password" type="password" class="form-control" id="floatingPassword" required minlength="6">
                      <label for="floatingPassword">Password</label>
                    </div>
    
                    <div class="form-check mb-3">
                      <input class="form-check-input" type="checkbox" value="" id="rememberPasswordCheck">
                      <label class="form-check-label" for="rememberPasswordCheck">
                        Remember password
                      </label>
                    </div>
    
                    <div class="d-grid">
                      <button class="btn btn-lg btn-dark btn-login text-uppercase fw-bold mb-2" type="submit">Sign in</button>
                      <div class="text-center">
                        <a class="small" href="<c:url value = "/loginPage/toRegister"/>">Create new Account</a>
                      </div>
                    </div>
                    <hr class="my-4">
  
                <div class="d-grid mb-2">
                  <button class="btn btn-lg btn-google btn-login fw-bold text-uppercase" type="submit">
                    <i class="fab fa-google me-2"></i> Sign up with Google
                  </button>
                </div>
  
                <div class="d-grid">
                  <button class="btn btn-lg btn-facebook btn-login fw-bold text-uppercase" type="submit">
                    <i class="fab fa-facebook-f me-2"></i> Sign up with Facebook
                  </button>
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