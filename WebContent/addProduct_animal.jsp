<%@ page contentType="text/html; charset=utf-8"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>동물 등록</title>
</head>
<body>
	<%-- <fmt:setLocale value='<%= request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message" > --%>
	<jsp:include page="menu.jsp" />	
	<div class="jumbotron">
		<div class="container">
			<!-- <h1 class="display-3"><fmt:message key="title" /></h1> -->
			<h1 class="display-3">동물 등록</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-right"> 
			<!-- <a href="?language=ko" >Korean</a>|<a href="?language=en" >English</a> -->
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>	
		<form name="newAnimal" action="./processAddProduct_animal.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<!-- <label class="col-sm-2"><fmt:message key="productId" /></label> -->
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input type="text" id="a_name"  name="a_name"  class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<!-- <label class="col-sm-2"><fmt:message key="pname" /></label> -->
				<label class="col-sm-2">나이</label>
				<div class="col-sm-3">
					<input type="text" id="a_age"  name="a_age" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<!-- <label class="col-sm-2"><fmt:message key="unitPrice"/></label> -->
				<label class="col-sm-2">사는 곳</label>
				<div class="col-sm-3">
					<input type="text" id="a_area"  name="a_area" class="form-control" >
				</div>
			</div>
			<!-- <div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description" /></label>
				<label class="col-sm-2">상세 설명</label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="manufacturer"/></label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category" /></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" >
				</div>
			</div> -->
			<!-- <div class="form-group row">
				<label class="col-sm-2">동물상태</label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="Good " ><fmt:message key="condition_New"/> 
					<input type="radio" name="condition" value="So-so" ><fmt:message key="condition_Old" />
					<input type="radio" name="condition" value="Bad" ><fmt:message key="condition_Refurbished" />
				</div>
			</div> -->
			<div class="form-group row">
				<label class="col-sm-2">파일 선택</label>
				<div class="col-sm-5">
					<input type="file" name="P_fileName" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="동물등록">
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>
