package sems

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.JSON

class SemController {
    def springSecurityService
    def playerArr=[]
    def xfinalPlayers=[]

    @Secured("permitAll")
    def index(){ 
        render view:"index"
    }

    @Secured("permitAll")
    def createteam(){ 
        render view:"createteam"
    }


    @Secured("permitAll")
    def create_national_board(){

        Country c0=new Country();
        c0.country=params.countryname
        c0.save(flush:true);

        User u1=new User();
        u1.username=params.countryname
        u1.password=params.password
        u1.country=c0
        
        u1.save(flush:true);
        def r0=Role.findByAuthority("ROLE_N_ADMIN");
        UserRole ur1=new UserRole();
        ur1.user=u1;
        ur1.role=r0;
        ur1.save(flush:true);
        def su06=["su07":"National Sports Association created"]
        render su06 as JSON
    }

    @Secured("permitAll")
    def createevent(){

        def c1=Country.findAll();
        render view:"createevent", model:[data1:c1]
    }

    @Secured("permitAll")
    def post_create_event(){

        def v = params.cids
        String[] cids = Arrays.asList(v.split(","))

        Mainevent me=new Mainevent();
        me.eventdescription=params.eventdescription;
        me.date=params.date;
        me.save(flush:true);

        for(int i = 0; i<cids.length; i++) {
            Nationalevent ne=new Nationalevent();
            int cid = Integer.parseInt(cids[i])
            def c1=Country.get(cid);
            
            ne.eventdescription=params.eventdescription;
            ne.date=params.date;
            ne.c = c1;
            ne.m = me;
            ne.save(flush:true);
        }

        def j1=["j":"Event created"];
        render j1 as JSON
    }

    @Secured("permitAll")
    def delete_create_event(){
    
        def neid=Nationalevent.get(params.id);
        neid.delete(flush:true);
        def m=["msg":"Nationalevent deleted"]
        render m as JSON
    }

    @Secured("ROLE_N_ADMIN")
    def country(){

        def cu0=springSecurityService.currentUser
        def cu1=cu0.username
        def c2=Country.findByCountry(cu1);
        def n0=Nationalevent.findAllByC(c2);
        render view:"country", model:[data:n0]
    }

    @Secured('ROLE_N_ADMIN')
    def inform_states(){
        def x5=springSecurityService.currentUser
        def c4=x5.country
        def s3=State.findAllByC(c4);
        def su02=["su03":s3]
        render su02 as JSON
    }

    @Secured("ROLE_N_ADMIN")
    def post_inform_states(){

        def v1 = params.sids
        String[] sids = Arrays.asList(v1.split(","))
        def ed =Nationalevent.get(params.eventid)
        def ed2=ed.eventdescription
        for(int i = 0; i<sids.length; i++) {
            Stateevent se=new Stateevent();
            int sid = Integer.parseInt(sids[i])
            def s1=State.get(sid);
        
            se.eventdescription=ed2;
            se.state = s1;
            se.n=ed
            se.date = params.date;
            se.save(flush:true);
        }

        def j10=["j0":"done"];
        render j10 as JSON

    }

    @Secured("ROLE_N_ADMIN")
    def createstate(){
        render view:"createstate"
    }

    @Secured("ROLE_N_ADMIN")
    def state_save(){
        def x3=springSecurityService.currentUser
        
        State s00=new State();
        s00.state=params.statename;
        s00.c=x3.country;
        s00.save(flush:true)

        User u02=new User();
        u02.username=params.statename
        u02.password=params.password
        u02.country = x3.country
        u02.state = s00
        u02.save(flush:true);

        def r01=Role.findByAuthority("ROLE_S_ADMIN");
        UserRole ur00=new UserRole();
        ur00.user=u02;
        ur00.role=r01;
        ur00.save(flush:true);

        def su19=["su20":"State association created"]
        render su19 as JSON

    }

    @Secured("ROLE_S_ADMIN")
     def state()
    {   
        def cu3=springSecurityService.currentUser
        def cu30=cu3.username
        def s1=State.findByState(cu30);
        def s0 =Stateevent.findAllByState(s1)
        
        render view:"state", model:[data:s0]
    }

    @Secured('ROLE_S_ADMIN')
    def inform_districts(){
        def x52=springSecurityService.currentUser
        def c42=x52.state
        def s32=District.findAllByS(c42);
        
        def su09=["su08":s32]
        render su09 as JSON
    }

    @Secured("ROLE_S_ADMIN")
    def post_inform_districts(){
        def v2 = params.dids
        String[] dids = Arrays.asList(v2.split(","))
        def ed3=Stateevent.get(params.eventid)
        def ed4=ed3.eventdescription
        for(int i = 0; i<dids.length; i++) {
            Districtevent de=new Districtevent();
            int did = Integer.parseInt(dids[i])
            def d1=District.get(did);
            de.eventdescription=ed4;
            de.d = d1;
            de.s=ed3
            de.date = params.date;
            de.save(flush:true);
        }

        def j101=["j001":"Notified to selected districts"];
        render j101 as JSON

    }

    @Secured("ROLE_D_ADMIN")
    def district()
    {
        def cu6=springSecurityService.currentUser
        def cu60=cu6.username
        def d1=District.findByDistrict(cu60);
        def d0 =Districtevent.findAllByD(d1)
        render view:"district", model:[data:d0]
    }

    @Secured("ROLE_D_ADMIN")
    def inform_players(){
        def cu7=springSecurityService.currentUser
    }

    @Secured("ROLE_S_ADMIN")
    def district_save(){
        def c5=springSecurityService.currentUser
        
        District d0=new District();
        d0.district=params.district
        d0.s=c5.state
        d0.save(flush:true)

        User u02=new User();
        u02.username=params.district
        u02.password=params.password
        u02.district = d0;
        u02.state = c5.state
        u02.country = c5.country
        u02.save(flush:true)

        def r02=Role.findByAuthority("ROLE_D_ADMIN");
        UserRole u002=new UserRole();
        u002.user=u02
        u002.role=r02
        u002.save(flush:true);

        def su01=["su":"District association created"]
        render su01 as JSON

    }

    @Secured("ROLE_D_ADMIN")
    def playerreg(){
        render view:"playerreg"
    }

    @Secured("ROLE_D_ADMIN")
    def post_playerreg()
    {
        def x4=springSecurityService.currentUser
        String x41=x4.username
        def x42=District.findByDistrict(x41)
        
        User p=new User();
        p.username=params.playername
        p.password=params.password
        p.state=x4.state
        p.district=x42
        p.country=x4.country
        p.save(flush:true);

        UserSports us=new UserSports();
        us.uobj=p;
        us.sport=params.sportname;
        us.save(flush:true);

        UserRole ur03=new UserRole();
        ur03.user=p;
        ur03.role=Role.findByAuthority("ROLE_PLAYER")
        ur03.save(flush:true);

        def su04=["su05":"Player registered : "]
        render su04 as JSON
    }
       
    //displays the list of all players
    @Secured("ROLE_D_ADMIN")
    def allplayers(){
        def cu8=springSecurityService.currentUser
        def cu80=cu8.username
        def d2=District.findByDistrict(cu80)
        def u3=User.findAllByDistrict(d2)
        def finalPlayers=[]
        for(def u : u3)//for(var i;i<u3.length;i++){def u=u3[i]}
        {
            def userrole=UserRole.findByUser(u);
            def role=userrole.role;
            if(role.authority=='ROLE_PLAYER') 
                finalPlayers.push(u)           
        }
        def us00=[];
        us00=UserSports.findAllBySport(params.eventdescription);
        def ed5=params.eventdescription
        println ed5
        def b=finalPlayers
        def us01=[]
        def us02=[]
        for(def a:b){
            us01=User.find(a);
            for(def c:us00){
                if(c.uobj==us01){
                    us02.push(us01)
                }
                else{
 
                }
            }
        }
        def finalPlayersSize=us02.size();
        for(def a4=0;a4<finalPlayersSize;a4++){
            xfinalPlayers[a4]=us02[a4];
            println xfinalPlayers[a4]
        }

        def xfinalPlayersSize=xfinalPlayers.size();
        
        for(def a5=0;a5<xfinalPlayersSize;a5++){
            println xfinalPlayers[a5]
        }
        render view:"allplayers", model:[data:us02,data3:ed5]
    }

    @Secured("ROLE_D_ADMIN")
    def selectedPlayers(){ 
        def v3=params.pids;
        String[] pids=Arrays.asList(v3.split(","));
        println pids
        def cu70=springSecurityService.currentUser;
        println cu70
        def df0=cu70.district
        //println df0       
        def des = Districtevent.where{eventdescription==params.eventname && d==df0 }find();
        println des
        def po0=[]
        def pt0=[]
        println pids
        for(int i2=0;i2<pids.length;i2++){
            for(int j2=i2+1;j2<pids.length;j2++){
                Fixture f=new Fixture();
                println pids[i2]
                println pids[j2]
                println des.d
                po0=User.where{username==pids[i2] && district==des.d}.find();
                pt0=User.where{username==pids[j2] && district==des.d}.find();
                println po0
                println pt0
                f.playerOne=po0;
                f.playerTwo=pt0;
                f.de=des;
                f.save(flush:true)
            }
        }
        def ff01=[]
        ff01=Fixture.findAllByDe(des);
        def ff010=ff01.size();
        def a66=[]
        def b66=[]
        for(int i15=0;i15<ff010;i15++){
            a66[i15]= ff01[i15].playerTwo.username
            b66[i15]= ff01[i15].playerOne.username
         }
        
        def su10=["ff02":ff01,"uo1":b66,"ut1":a66]
        render su10 as JSON
    }

    //Shows the fixture created
    
    @Secured("permitAll")
    def daction1(){
        def cu09=springSecurityService.currentUser
        def cu091=cu09.district
        def def1=Districtevent.findAllByD(cu091)
        def en00=params.eventname
        def en01=Districtevent.findAllByEventdescription(en00)
        def f0=[]
        println cu091
        println en00+" "+en01
        for(def i3:def1){
            for (def i4:en01){
                if(i3==i4){
                    f0=Fixture.findAllByDe(i4);
                }
            } 
        }
        println "ab "+f0+"ba"
        render view:"createfixture", model:[data:f0] 
    }
    //saves the date of event which is to be set by distadmin
    @Secured("ROLE_D_ADMIN")
    def date_save(){
        def a1=params.eds//recevies event date of match in array
        def a2=params.ids//recevies fixture id of match
        println a1
        println a2 
        String[] a100=Arrays.asList(a1.split(","));
        String[] a200=Arrays.asList(a2.split(","));
        println a100
        println a200
        for(def i7=0;i7<a100.length;i7++){
            def f1=Fixture.get(a200[i7]);
            println a200[i7]
            println f1
            f1.date=a100[i7]
            println f1.date
            f1.save(flush:true)
        }
        def a10=["a1":"date saved"]
        render a10 as JSON
    }
    //displays event whose fixture is created
    @Secured("ROLE_D_ADMIN")
    def match(){
        def v4=[];
        def a=[];
        def cu62=springSecurityService.currentUser
        def cu602=cu62.username
        def d12=District.findByDistrict(cu602);
        def d02 =Districtevent.findAllByD(d12);
        println d02
        //for finding fixtures of districtevent 
        for(def i6:d02){
            a=Fixture.findAllByDe(i6);
            println a
            def a33=a.size()
            if(a33==0){}
            else{
                println i6
                v4=i6
            }    
        }
        //println v4
        render view:"match", model:[data:v4]
        
    }

    @Secured("ROLE_D_ADMIN")
    def showFixture(){
        def de01=params.deid;
        def def0=Districtevent.get(de01);
        def ff04=Fixture.findAllByDe(def0)
        def u010=[]
        def u020=[]
        def ff040=ff04.size();
        //saves fixture table user's object in another array for both players(playerOne and player Two)
        for(int i18=0;i18<ff040;i18++){
            u010[i18]=ff04[i18].playerOne
            u020[i18]=ff04[i18].playerTwo  
        }

        def u0100=u010.size();
        def us1=[]
        def us2=[]
        for(int i19=0;i19<u0100;i19++){
            //fetches username for playerOne
            us1[i19]=u010[i19].username;
            //fetches username for playerTwo
            us2[i19]=u020[i19].username;
        }
        def su12=["su13":ff04,"up1":us1,"up2":us2]
        render su12 as JSON
    }

    @Secured("ROLE_D_ADMIN")
    def saveMatchResult(){
        def pns0=params.playernames
        def ids0=params.ids
        String[] pns00=Arrays.asList(pns0.split(","));
        String[] ids00=Arrays.asList(ids0.split(","));
        def fobj=[]
        def uobj=[]
        def po1=[]
        def pt1=[]
        for(int i23=0;i23<pns00.length;i23++){  
            fobj[i23]=Fixture.get(ids00[i23]);
            uobj[i23]=User.findByUsername(pns00[i23]);
            FixtureResult fr1=new FixtureResult();
            fr1.f=fobj[i23]
            fr1.u=uobj[i23]
            fr1.save(flush:true)
        }
        def fobj1=fobj.size()
        def fobj2=2*fobj1
        def op=[]
        
        //show all players of fixture
        
        for(int i24=0;i24<fobj1;i24++){
            op[i24]=fobj[i24].playerOne.username
        }

        for(int i25=0;i25<fobj1;i25++){
            op[i25+fobj1]=fobj[i25].playerTwo.username
        }


        def oplen=op.size()

        for(int i31=0;i31<oplen;i31++){
            println "op element "+op[i31]+" is at "+i31
        }


        /*def opf=[]
        
        for(int i27=0;i27<oplen;i27++){
            def i29=i27+1
            for(int i28=0;i28<i29;i28++){    
                if(op[i27]==opf[i28])
                    break
                else{ 
                    opf[i28]=op[i27]
                    println "opf element "+opf[i28]+" is at "+i28
                    break
                }
            }    
        }*/
        def opfs=xfinalPlayers.size()
        println opfs

        for(def i30=0;i30<opfs;i30++){
            println xfinalPlayers[i30]
        }
    
        def su15=["su16":xfinalPlayers]
        render su15 as JSON
    }

    @Secured("ROLE_D_ADMIN")
    def saveUserDistrictEvent(){
        def user=params.playernames
        println user
        def de02=Districtevent.get(params.districtevent);
        
        def a55=User.get(user);
        
        User_DistEvent ude=new User_DistEvent();
        ude.u1=a55
        ude.de2=de02
        ude.save(flush:true);

        def su18=["username":user,"de":de02]
        render su18 as JSON
    }

    @Secured("ROLE_D_ADMIN")
    def statefixture(){
        render view:"statefixture"
    }

    @Secured("permitAll")
    def daction8(){

    }

    @Secured("permitAll")
    def daction9(){

    }

    @Secured("permitAll")
    def daction10(){

    }
    @Secured("ROLE_I_ADMIN")
    def international(){
        render view:"international"
    } 

    @Secured("ROLE_S_ADMIN")
    def createdistrict(){
        render view:"createdistrict"
    }

    @Secured("IS_AUTHENTICATED_FULLY")
    def homepage(){
        def cu=springSecurityService.currentUser;
        def principal = springSecurityService.principal
        def authorities = principal.authorities
        def fr = authorities[0].authority
        if(fr.equals("ROLE_I_ADMIN")){  
            redirect action:"international"
        }
        else if(fr.equals("ROLE_N_ADMIN")){
            redirect action:"country"
        }   
        else if(fr.equals("ROLE_S_ADMIN")){
            redirect action:"state"
        }
        else if(fr=="ROLE_D_ADMIN"){
            redirect action:"district"
        }
        else{
            redirect action:"createteam"
        }
    }

}

