<!DOCTYPE html>
<html>
<head>
	<asset:javascript src="application.js"/>
	<asset:stylesheet src="application.css"/>
	<style type="text/css">
	    /*div{
	        border:1px solid black;
	    }*/
	    #header{
	    	background-color: #d1d1d1;
	    }
	    body{
	    	background-color: #82faff;
	    }
	</style>
	<title>Create Country Association</title>
</head>
<body>
	
	<div class="row">
	<div class="col-lg-12 col-md-6 col-sm-6" id="header"><center><h1>International Sports Association</h1></center></div>
	<div class="col-lg-12 col-md-6 col-sm-6">
		<div class="row">
								
				<div class="col-lg-6 col-md-6 col-sm-6"><center>Name of country:</center></div>
				<div class="col-lg-6 col-md-6 col-sm-6"><input type="text" name="countryname" id="cn" placeholder=""></div>
			</div>
			<div class="row">	
				<div class="col-lg-6 col-md-6 col-sm-6"><center>Password:</center></div>
				<div class="col-lg-6 col-md-6 col-sm-6"><input type="password" id="pwd" name="password"></div>	
			</div>
			<div class="row">	
				<div class="col-lg-12 col-md-6 col-sm-6"><center><input type="submit" name="submit" value="Register" id="rb"></center></div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-6 col-sm-6" id="result"></div>
				<div class="col-lg-12 col-md-6 col-sm-6" id="result2"><a href='http://localhost:8080/sem/international'>Go Back!</a></div>
			</div>		
				
	</div>	
	</div>
	<script type="text/javascript">
		$(document).on('click','#rb',function(){
			var cn0=$('#cn').val();
			var pwd0=$('#pwd').val();

			$.ajax({
				url:"http://localhost:8080/sem/create_national_board",
				dataType:"json",
				method:"POST",
				async:true,
				data:{"countryname":cn0,"password":pwd0},
				success:function(r){
					var a0=r.su07
					$('#result').html(a0+" for "+cn0);
					
				}
			})
		});
	</script>	
</body>
</html>