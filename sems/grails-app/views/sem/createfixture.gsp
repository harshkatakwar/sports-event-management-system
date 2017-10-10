<!DOCTYPE html>
<html>
<head>
	<asset:stylesheet src="application.css"/>
	<asset:javascript src="application.js"/>
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
	    #a{
	    	border:1px solid black;
	    }
	</style>
	<title>Create Fixture</title>
</head>
<body>
<div class="row">
		<div class="col-lg-12 col-md-6 col-sm-6" id="header"><center><h1>Create Fixture</h1></center></div>
		<div class="col-lg-8 col-md-6 col-sm-6">
			<h2>Schedule</h2>
			<table border="1">
			<tr>
				<form>
				<g:each in="${data}" var="data1" status="i">	
					<div class="row" id="a">
					<p>
						<div class="col-lg-1 col-md-6 col-sm-6">${i+1}<input type="hidden" name="id" value="${data1.id}"></div>
						<div class="col-lg-3 col-md-6 col-sm-6"><center><input type="hidden" name="playerone" id="po" value="${data1.playerOne}">${data1.playerOne}</center></div>
						<div class="col-lg-1 col-md-6 col-sm-6">vs</div>
						<div class="col-lg-3 col-md-6 col-sm-6"><center><input type="hidden" name="playertwo" id="pt" value="${data1.playerTwo}">${data1.playerTwo}</center></div>
						<div class="col-lg-4 col-md-6 col-sm-6"><input type="date" class="date" name="eventdate" id="${data1.id}" data-did="${data1.id}"></div>
					</p>
					</div>
				</g:each>
				<form>
			</tr>	
			</table>
			<div class="col-lg-12 col-md-6 col-sm-6"><center><input type="submit" id="sv" name="submit" value="Save" ></center></div>
			<div id="result"></div>
			<div id='result1'></div>		
		</div>
		<div class="col-lg-4 col-md-6 col-sm-6">
			Quick Links 
			<div class="col-lg-12 col-md-6 col-sm-6"><a href="district">Home:District</a></div>
			<div class="col-lg-12 col-md-6 col-sm-6"><a href="playerreg">Player Registration</a></div>
			<div class="col-lg-12 col-md-6 col-sm-6"><a href="#">Create fixture</a></div>
			<div class="col-lg-12 col-md-6 col-sm-6"><a href="http://localhost:8080/logoff">Logoff</a></div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).on('click','#sv',function(){
			var eds=[];
			var ids=[];
			var k=0;
		
			$('.date').each(function(){
					var ed = $(this).val();
					eds.push(ed);
					var id=$(this).data('did');
					ids.push(id);
			});
			console.log(eds);
			console.log(ids);
			$.ajax({
				url:"http://localhost:8080/sem/daction2",
				dataType:"json",
				method:"POST",
				async:true,
				data:{"ids":ids,"eds":ed},
				success:function(r){
					console.log("done");
					/*var c=r.su11;
					for(i=0;i<c.length;i++){
			  			for(j=i+1;j<c.length;j++){
                    		console.log(c[i] + "vs" + c[j]);
                    		var a="<div><input type='radio' name='group"+k+"' data-id='"+c[i]+"'> "+c[i]+" vs <input type='radio' data-id='"+c[j]+"' name='group"+k+"'>"+c[j]+" </div><br>";
                    		console.log(k);
                    		k++;
                    		$('#result').append(a);
  						}
					}*/
					
				}
			})	
		});
	</script>
</body>
</html>