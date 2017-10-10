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
	<title>Create district association</title>
</head>
<body>
<div class="row">
		<div class="col-lg-12 col-md-6 col-sm-6" id="header"><center><h1>State Sports Association</h1></center></div>
		<div class="col-lg-12 col-md-6 col-sm-6">
			<br>
			<div class="row">								
				<div class="col-lg-12 col-md-6 col-sm-6"><center><input type="text" id="dn" name="districtname" placeholder="Name of district" style="text-align: center;"></center></div>
			</div>
			<br>
			<div class="row">	
				<div class="col-lg-12 col-md-6 col-sm-6"><center><input type="password" id="pwd" name="password" placeholder="Password" style="text-align: center;"></center></div>	
			</div>
			<br>
			<div class="row">	
				<div class="col-lg-12 col-md-6 col-sm-6"><center><input type="submit" name="submit" value="Register" id="dr"></center></div>
			</div>
		</div>
		<br>
		<div class="col-lg-12 col-md-6 col-sm-6"><br><center><b><div class="col-lg-12 col-md-6 col-sm-6" id="result0"></div></b></center></div>
</div>
<script type="text/javascript">
	$(document).on('click','#dr',function(){
		var dn0=$('#dn').val();
		var pwd=$('#pwd').val();

		$.ajax({
			url:"http://localhost:8080/sem/district_save",
			dataType:"json",
			async:true,
			method:"POST",
			data:{"district":dn0,"password":pwd},
			success:function(r){
				var a0=r.su
				$('#result0').html(a0+" for "+dn0);

			}
		})
	});
</script>
</body>
</html>