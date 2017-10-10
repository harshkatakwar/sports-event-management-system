<!DOCTYPE html>
<html>
<head>
	<asset:javascript src="application.js"/>
	<asset:stylesheet src="application.css"/>
	<style type="text/css">
	    /*div{
	        border:1px solid black;
	    }*/
	    body{
	    	background-color: #82faff;
	    }
	    #header{
	    	height: 75px;
	    	background-color: #e0e0e0;
	    }
	</style>
	<title>Player Registration</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12 col-md-6 col-sm-6" id="header"><center><h1>Player registration</h1></center></div>
		<div class="col-lg-12 col-md-6 col-sm-6">
			<br>
			<div class="col-lg-12 col-md-6 col-sm-6"><center><input type="text" name="playername" id='pn' placeholder="Player's Name" style="text-align: center;"></center></div>
			<br>
			<div class="col-lg-12 col-md-6 col-sm-6"><center><input type="text" name="sportname" id='sn' placeholder="Which game do you play?" style="text-align: center;"></center></div>
			<br>
			<div class="col-lg-12 col-md-6 col-sm-6"><center><input type="password" name="password" id='pwd' placeholder="Password" style="text-align: center;"></center></div>	
			<br>
			<div class="col-lg-12 col-md-6 col-sm-6"><center><input type="submit" name="register" id="rb" value="Register"></center></div>
			<div class="col-lg-12 col-md-6 col-sm-6"><br><center><div id="result"></div></center></div>	
		</div>		
	</div>
	<script>
		$(document).on('click','#rb',function(){
			var pn0=$('#pn').val();
			var pwd0=$('#pwd').val();
			var sn0=$('#sn').val();
			
			$.ajax({
				url:"http://localhost:8080/sem/post_playerreg",
				method:"POST",
				dataType:"json",
				async:true,
				data:{"playername":pn0,"password":pwd0,"sportname":sn0},
				success:function(r){
					var a0=r.su05;
					$('#result').html(a0+" <b>"+pn0+"</b> plays <b>"+sn0+"</b>.");
					console.log(r.su05);
				}
			})
		});
	</script>		
</body>
</html>