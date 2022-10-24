<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dto.Person"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />
<jsp:useBean id="personDAO" class="dao.PersonRepository" scope="session" />

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품목록</h1>
		</div>
	</div>
	<%
		ArrayList<Person> listOfProducts = personDAO.getAllProducts();
	%>

	<div class="container">
		<div class="row" align="center">
			<%
				for (int i = 0; i < listOfProducts.size(); i++) {
					Person person = listOfProducts.get(i);
			%>
			<div class="col-md-4">
				<h3>아이디: <%=person.getId()%></h3>
				<p>이름: <%=person.getName()%>
				<p>이메일: <%=person.getEmail()%>
			</div>
			<%
				}
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
