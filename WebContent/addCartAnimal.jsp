<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Animal"%>
<%@ page import="dao.AnimalRepository"%>

<%
	String a_name = request.getParameter("a_name");
	if (a_name == null || a_name.trim().equals("")) {
		response.sendRedirect("Animalproduct.jsp?a_name=" + a_name);
		return;
	}

	AnimalRepository dao = AnimalRepository.getInstance();

	Animal animal = dao.getAnimalbyName(a_name);
	if (a_name== null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}

	ArrayList<Animal> animalsList = dao.getAllAnimals();
	Animal animals = new Animal();
	for (int i = 0; i < animalsList.size(); i++) {
		animals = animalsList.get(i);
		if (animals.getA_name().equals(a_name)) { 			
	break;
		}
	}
	
	ArrayList<Animal> list = (ArrayList<Animal>) session.getAttribute("animallist");
	if (list == null) { 
		list = new ArrayList<Animal>();
		session.setAttribute("animallist", list);
	}

	int cnt = 0;
	Animal animalsQnt = new Animal();
	for (int i = 0; i < list.size(); i++) {
		animalsQnt = list.get(i);
		if (animalsQnt.getA_name().equals(a_name)) {
	cnt++;
	int orderQuantity = animalsQnt.getQuantity() + 1;
	animalsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		animals.setQuantity(1);
		list.add(animals);
	} 

	response.sendRedirect("Animalproduct.jsp?a_name=" + a_name);
%>