package dao;


import java.util.ArrayList;




import dto.Animal;


public class AnimalRepository {
	
	private ArrayList<Animal> listOfAnimals = new ArrayList<Animal>();
	private static AnimalRepository instance = new AnimalRepository();

	public static AnimalRepository getInstance(){
		return instance;
	} 

	public AnimalRepository() {//dummy data
		
		Animal a1 = new Animal();
		a1.setA_name("Salmon"); 
		a1.setA_area("River"); 
		a1.setA_age("5"); 
		Animal a2 = new Animal();
		a2.setA_name("Shark"); 
		a2.setA_area("Ocean"); 
		a2.setA_age("3"); 
		Animal a3 = new Animal();
		a3.setA_name("Crab"); 
		a3.setA_area("Ocean"); 
		a3.setA_age("2");
		

		listOfAnimals.add(a1);
		listOfAnimals.add(a2);
		listOfAnimals.add(a3);
	}

	public ArrayList<Animal> getAllAnimals() {
		return listOfAnimals;
	}
	
	public Animal getAnimalbyName(String Name) {
		Animal aByName = null;

		for (int i = 0; i < listOfAnimals.size(); i++) {
			Animal a = listOfAnimals.get(i);
			if (a != null && a.getA_name() != null && a.getA_name().equals(Name)) {
				aByName = a;
				break;
			}
		}
		return aByName;
	}
	
	public void addAnimal(Animal a) {
		listOfAnimals.add(a);
	}
}
