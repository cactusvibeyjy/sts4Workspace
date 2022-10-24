package dao;


import java.util.ArrayList;



import dto.Person;


public class PersonRepository {
	
	private ArrayList<Person> listOfProducts = new ArrayList<Person>();
	private static PersonRepository instance = new PersonRepository();

	public static PersonRepository getInstance(){
		return instance;
	} 

	public PersonRepository() {//dummy data
		
		Person p1 = new Person();
		
		
		p1.setId("yjy"); 
		p1.setName("Yujin Yie"); 
		p1.setEmail("xhrtlr@gmail.com"); 
		Person p2 = new Person();
		p2.setId("yjh"); 
		p2.setName("Jeeho Yie"); 
		p2.setEmail("yjy0521@gmail.com"); 
		Person p3 = new Person();
		p3.setId("yjh2"); 
		p3.setName("Jeeho Yie"); 
		p3.setEmail("22yjy0521@gmail.com"); 
		
		

		listOfProducts.add(p1);
		listOfProducts.add(p2);
		listOfProducts.add(p3);
	}

	public ArrayList<Person> getAllProducts() {
		return listOfProducts;
	}
	
	public Person getProductById(String pId) {
		Person pById = null;

		for (int i = 0; i < listOfProducts.size(); i++) {
			Person p = listOfProducts.get(i);
			if (p != null && p.getId() != null && p.getId().equals(pId)) {
				pById = p;
				break;
			}
		}
		return pById;
	}
	
	public void addPerson(Person p) {
		listOfProducts.add(p);
	}
}
