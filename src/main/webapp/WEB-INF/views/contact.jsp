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
        <div class="row mt-4">
            <div class="col-6">
                <h3 class="text-center mb-3">Thông tin liên hệ</h3>
                <p>
                 Trụ sở chính Tòa nhà FPT Polytechnic, Phố Trịnh Văn Bô, Nam Từ Liêm, Hà Nội
                </p>
                <h5>Cơ sở Hà Nội</h5>
                <p>
                 Tòa nhà FPT Polytechnic, Phố Trịnh Văn Bô, Nam Từ Liêm, Hà Nội
                 <br>
                 <span>(024) 7300 1955</span>
                </p>
                <h5>Cơ sở Đà Nẵng</h5>
                <p>
                 Số 137 Nguyễn Thị Thập, Phường Hòa Minh, Quận Liên Chiểu, TP. Đà Nẵng
                 <br>
                 <span>(024) 7300 1955</span>
                </p>
                <h5>Cơ sở Cần Thơ</h5>
                <p>
                    Số 288, Nguyễn Văn Linh, phường An Khánh, quận Ninh Kiều, Tp. Cần Thơ.
                 <br>
                 <span>(024) 7300 1955</span>
                </p>
                <h5>Cơ sở Hồ Chí Minh</h5>
                <p>
                    391A Nam Kỳ Khởi Nghĩa, Q. 3, TP. Hồ Chí Minh
                    <br>
                    778/B1 Nguyễn Kiệm, P.4, Q. Phú Nhuận, TP. Hồ Chí Minh
                    <br>
                    Toà nhà Innovation, lô 24, Công viên phần mềm Quang Trung, Quận 12, Hồ Chí Minh
                 <br>
                 <span>(024) 7300 1955</span>
                </p>
            </div>
            <div class="col-6">
                <h4 class="text-center">Bản đồ chỉ đẫn</h4>
             <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.4445190146457!2d106.6261562145555!3d10.853755692269093!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bee0b0ef9e5%3A0x5b4da59e47aa97a8!2zQ8O0bmcgVmnDqm4gUGjhuqduIE3hu4FtIFF1YW5nIFRydW5n!5e0!3m2!1svi!2s!4v1639983382455!5m2!1svi!2s" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            </div>
        </div>
      </div>
 
  <jsp:include page="part/footer.jsp"></jsp:include>s
	
</body>


</html>