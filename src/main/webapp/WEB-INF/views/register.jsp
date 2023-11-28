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
              <div class="card-img-left d-none d-md-flex">
               
              </div>
              <div class="card-body p-4 p-sm-5">
                <h3 class="login-heading mb-4">Register</h3>
                <form:form action="../loginPage/register" method="POST" modelAttribute="User" enctype="multipart/form-data">
    
                  <div class="form-floating mb-3">
                    <input name="userName" type="text" class="form-control" id="floatingInputUsername" placeholder="myusername" required autofocus>
                    <label for="floatingInputUsername">Username</label>
                  </div>
    
                  <div class="form-floating mb-3">
                    <input name="email" type="email" class="form-control" id="floatingInputEmail" placeholder="name@example.com" required>
                    <label for="floatingInputEmail">Email address</label>
                  </div>
                  <div class="form-floating mb-3">
                    <input name="fullName" type="text" class="form-control" id="floatingInputName" placeholder="Full name" required>
                    <label for="floatingInputEmail">Full name</label>
                  </div>
    
                  <hr>
    
                  <div class="form-floating mb-3">
                    <input name="password" type="password" class="form-control" id="floatingPassword" placeholder="Password" required minlength="6">
                    <label for="floatingPassword">Password</label>
                  </div>
    
                  <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="floatingPasswordConfirm" placeholder="Confirm Password" required minlength="6">
                    <label for="floatingPasswordConfirm">Confirm Password</label>
                  </div>
    
                  <div class="d-grid mb-2">
                    <button class="btn btn-lg btn-dark btn-login fw-bold text-uppercase" type="submit">Register</button>
                  </div>
    
                  <a class="d-block text-center mt-2 small" href="<c:url value = "/loginPage/view"/>">Have an account? Sign In</a>
    
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
                  <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-3 mr-n2">
                    <a href="../index" class="btn btn-outline-dark me-md-2" type="button">Back home</a>
                  </div>
                </form:form>

              </div>
            </div>
          </div>
        </div>
      </div>
    

    <script>
    	if(${mess.error}){
    		alert("${mess.message}");
    	}
    </script>
 

    <script src="../source/js/bootstrap.min.js"></script>
</body>

</html>