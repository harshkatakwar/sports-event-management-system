package sems

class Stateevent {

   	String eventdescription
   	String date
   	State state	
   	Nationalevent n	

   	static constraints = {
   		state nullable:true
   		date nullable:true
   	}	
}
