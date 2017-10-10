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
	    tr{
	    	border:1px solid black;
	    }
	</style>
	<title>District Sports Association</title>
</head>
<body>
<div class="row">
		<div class="col-lg-12 col-md-6 col-sm-6" id="header"><center><h1>District Sports Association</h1></center></div>
		<div class="col-lg-8 col-md-6 col-sm-6">
			<h2>Upcoming Events</h2>
			<g:each in="${data}" var="data1">
				<form method="post" action="allplayers">	
					<div class="row" id="a">
						<p>				
							<div class="col-lg-6 col-md-6 col-sm-6"><input type="hidden" name="id" id="eid" value="${data1.id}"><input type="hidden" name="eventdescription" id="ed" value="${data1.eventdescription}">${data1.eventdescription}</div>
							<div class="col-lg-3 col-md-6 col-sm-6">${data1.date}</div>
							<div class="col-lg-3 col-md-6 col-sm-6"><button type="submit" id="pb" value="allplayers" data-id="${data1.id}" >Create Fixture</button></div>				
						</p>
					</div>
				</form>
			</g:each>
			<div id="result"></div>
			<div id='result1'></div>		
		</div>
		<div class="col-lg-4 col-md-6 col-sm-6">
			<h2>Quick Links</h2> 
			<div class="col-lg-12 col-md-6 col-sm-6"><a href="playerreg">Player Registration</a></div>
			<div class="col-lg-12 col-md-6 col-sm-6"><a href="match">Upload match results</a></div>
			<div class="col-lg-12 col-md-6 col-sm-6"><a href="http://localhost:8080/logoff">Logoff</a></div>

		</div>
	</div>
	<script type="text/javascript">
		/*var eid0="";
		var ed0=$('#ed').val();*/
		/*$(document).on('click','#pb',function(){
			eid0=$(this).data('id')

			$.ajax({
				url:"http://localhost:8080/sem/inform_players",
				method:"POST",
				dataType:"json",
				async:true,
				data:{"eventid":eid0,"eventdescription":ed0},
				success:function(r){
					console.log("success inside")
					var a = r.su03
					
					
					for(i=0;i<a.length;i++){
						console.log(a[i]);
						var cb="<div><input type='checkbox' id='"+a[i]+"' data-id='"+a[i].id+"' class='state-check'>"+a[i].state+"</div><br>"
						
						$('#result').append(cb);
					}	
					var dt="<div><input type='date' id='ne_dt'></div><br>"
					var sub="<div><input type='submit' id='inform_btn' data-id='"+eid0+"'></div><br>"
					$('#result').append(dt+" "+sub);
				}
			})
			
		});*/
		/*$(document).on('click','#inform_btn',function(){
			var dt0=$('#de_dt').val();
			eid0=$(this).data('id');
			var dids=[];

			$('.district-check').each(function(){
					var isChecked = $(this).is(":checked");
					if(isChecked) {
						var did = $(this).data('id')
						dids.push(did)
					}
			});

			console.log(sids)
			dids = dids + ""

			$.ajax({
				url:"http://localhost:8080/sem/post_inform_players",
				dataType:"json",
				method:"POST",
				async:true,
				data:{"eventid":eid0,"eventdescription":ed0,"date":dt0,"sids": dids},
				success:function(r){
					$('#result1').append(r.j0);
				}
			})		
		});*/
	</script>
</body>
</html>