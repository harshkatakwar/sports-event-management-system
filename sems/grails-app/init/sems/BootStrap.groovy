package sems

class BootStrap {

    def init = { servletContext ->
    	
        //role for international board
        User u0=new User();
        u0.username="intadmin"
    	u0.password="intadmin"
        u0.save(flush:true);
        Role r0=new Role();
    	r0.authority="ROLE_I_ADMIN"
    	r0.save(flush:true);
        UserRole ur0=new UserRole();
        ur0.user=u0
        ur0.role=r0
        ur0.save(flush:true);

    	//role for national board i.e. for a country
    	Role r1=new Role();
    	r1.authority="ROLE_N_ADMIN"
    	r1.save(flush:true);
    	
        //role for state board
    	Role r2=new Role();
    	r2.authority="ROLE_S_ADMIN"
    	r2.save(flush:true);
    	
        //role for district board
    	Role r3=new Role();
    	r3.authority="ROLE_D_ADMIN"
    	r3.save(flush:true);
    	
        //role for player
    	Role r4=new Role();
    	r4.authority="ROLE_PLAYER"
    	r4.save(flush:true);

        //India
        Country c0a=new Country();
        c0a.country="India"
        c0a.save(flush:true);

        User u1a=new User();
        u1a.username="India"
        u1a.password="123"
        u1a.country=c0a
        
        u1a.save(flush:true);
        def r0a=Role.findByAuthority("ROLE_N_ADMIN");
        UserRole ur1a=new UserRole();
        ur1a.user=u1a;
        ur1a.role=r0a;
        ur1a.save(flush:true);

        //Pakistan
        Country c1a=new Country();
        c1a.country="Pakistan"
        c1a.save(flush:true);

        User u2a=new User();
        u2a.username="Pakistan"
        u2a.password="123"
        u2a.country=c1a
        
        u2a.save(flush:true);
        def r1a=Role.findByAuthority("ROLE_N_ADMIN");
        UserRole ur2a=new UserRole();
        ur2a.user=u2a;
        ur2a.role=r1a;
        ur2a.save(flush:true);



    }
    def destroy = {
    }
}
