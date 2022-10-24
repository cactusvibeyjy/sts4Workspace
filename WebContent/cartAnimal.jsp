<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Animal"%>
<%@ page import="dao.AnimalRepository"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
	
	String cartId = "cartId"; 
	/* String a_name = session.getId(); */
%>
<title>동물 장바구니</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">동물 장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCartAnimal.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a href="./shippingInfoAnimal.jsp?cartId=<%= cartId %>" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>					
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%				
					int sum = 0;
					ArrayList<Animal> animallist = (ArrayList<Animal>) session.getAttribute("animallist");
					if (animallist == null)
						animallist = new ArrayList<Animal>();

					for (int i = 0; i < animallist.size(); i++) {
						int testPrice = 10000;
						int quantity = 10;
						Animal animal = animallist.get(i);
						int total = testPrice * animal.getQuantity();
						sum = sum + total;
				%>
				<tr>
					<%-- <td><%=product.getA_named()%> - <%=product.getPname()%></td> --%>
					<td><%=animal.getA_name()%></td>
					<td><%=animal.getQuantity()%></td>
					<td><%=total%></td>
					<td><a href="./removeCartAnimal.jsp?a_name=<%=animal.getA_name()%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum%></th>
					<th></th>
				</tr>
			</table>
			<a href="./Animalproducts.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
