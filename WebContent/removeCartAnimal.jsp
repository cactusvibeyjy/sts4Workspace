<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Animal"%>
<%@ page import="dao.AnimalRepository"%>
<%
	String a_name = request.getParameter("a_name");
	if (a_name == null || a_name.trim().equals("")) {
		response.sendRedirect("Animalproducts.jsp");
		return;
	}

	AnimalRepository dao = AnimalRepository.getInstance();
	
	Animal a = dao.getAnimalbyName(a_name);
	if (a == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}

	ArrayList<Animal> cartList = (ArrayList<Animal>) session.getAttribute("animallist");
	Animal goodsQnt = new Animal();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getA_name().equals(a_name)) {
	cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cartAnimal.jsp");
%>
