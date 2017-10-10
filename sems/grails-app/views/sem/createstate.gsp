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
	    table{
	    	border:1px solid black;
	    }
	    tr{
	    	border:1px solid black;
	    }
	</style>
	<title>Create state association</title>
</head>
<body>
<div class="row">
		<div class="col-lg-12 col-md-6 col-sm-6" id="header"><center><h1>State Sports Association</h1></center></div>
		<div class="col-lg-12 col-md-6 col-sm-6">
			<br>
			<div class="row">				
				<div class="col-lg-12 col-md-6 col-sm-6"><center><input type="text" id="sn" name="statename" placeholder="Name of state" style="text-align: center;"></center></div>
			</div>
			<br>
			<div class="row">	
				<div class="col-lg-12 col-md-6 col-sm-6"><center><input type="password" id="pwd" name="password" placeholder="Password" style="text-align: center;"></center></div>	
			</div>
			<br>
			<div class="row">	
				<div class="col-lg-12 col-md-6 col-sm-6"><center><input type="submit" name="submit" value="Register" id="sr"></center></div>
			</div>
		</div>
		
		<div class="col-lg-12 col-md-6 col-sm-6"><br><center><b><div class="col-lg-12 col-md-6 col-sm-6" id="result0"></div></b></center></div>
		<div class="col-lg-12 col-md-6 col-sm-6"><center><b><div class="col-lg-12 col-md-6 col-sm-6" id="result1"></div></b></center></div>
</div>
</body>
<script type="text/javascript">
	$(document).on('click','#sr',function(){
		var sn0=$('#sn').val();
		var pwd=$('#pwd').val();

		$.ajax({
			url:"http://localhost:8080/sem/state_save",
			dataType:"json",
			async:true,
			method:"POST",
			data:{"statename":sn0,"password":pwd},
			success:function(r){
				console.log(r.su20);
				var a0=r.su20
				var a1="<br><div class='col-lg-12 col-md-6 col-sm-6'><a href='http://localhost:8080/sem/country'><i>Go Back</i></a></div>"
				$('#result0').html(a0+" for "+sn0);
				$('#result1').html(a1);
			}
		})
	});
</script>

</html>