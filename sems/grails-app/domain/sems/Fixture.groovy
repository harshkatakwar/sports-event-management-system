package sems

class Fixture {

	User playerOne
	User playerTwo
	String date
	Districtevent de
	Stateevent se
	Nationalevent ne
    static constraints = {
    	date nullable:true
    	de nullable:true
    	se nullable:true
    	ne nullable:true
    }
}
