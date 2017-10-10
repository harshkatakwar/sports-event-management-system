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
	    #a{
	    	border:1px solid black;
	    }
	</style>
	<title>National Sports Association</title>
</head>
<body>
<div class="row">
		<div class="col-lg-12 col-md-6 col-sm-6" id="header"><center><h1>National Sports Association</h1></center></div>
		<div class="col-lg-8 col-md-6 col-sm-6">
			<h2>Upcoming Events</h2>
			
			<g:each in="${data}" var="data1">	
				<div class="row" id="a">
				<p>
						<div class="col-lg-6 col-md-6 col-sm-6"><input type="hidden" name="id" id="eid" value="${data1.id}"><input type="hidden" name="eventdescription" id="ed" value="${data1.eventdescription}" >${data1.eventdescription}</div>
						<div class="col-lg-3 col-md-6 col-sm-6">${data1.date}</div>
						<div class="col-lg-3 col-md-6 col-sm-6"><input type="submit" id="pb" value="Participate" data-id="${data1.id}" ></div>
				</p>
				</div>
			</g:each>
			<div id="result"></div>
			<div id='result1'></div>		
		
		</div>
		<div class="col-lg-4 col-md-6 col-sm-6">
			Quick Links 
			<div class="col-lg-12 col-md-6 col-sm-6"><a href="createstate">Create State Association</a></div>
			<div class="col-lg-12 col-md-6 col-sm-6"><a href="#">Create fixture</a></div>
			<div class="col-lg-12 col-md-6 col-sm-6"><a href="http://localhost:8080/logoff">Logoff</a></div>
		</div>

	</div>

<script>
	var eid0="";
	
	$(document).on('click','#pb',function(){
		eid0=$(this).data('id');
		
		$.ajax({
			url:"http://localhost:8080/sem/inform_states",
			method:"POST",
			dataType:"json",
			async:true,
			data:{"eventid":eid0},
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
		
	});
	$(document).on('click','#inform_btn',function(){
		var dt0=$('#ne_dt').val();
		
		var sids=[];

		$('.state-check').each(function(){
				var isChecked = $(this).is(":checked");
				if(isChecked) {
					var sid = $(this).data('id')
					sids.push(sid)
				}
		});

		console.log(sids)
		sids = sids + ""
		console.log(eid0)
		
		console.log(dt0)

		$.ajax({
			url:"http://localhost:8080/sem/post_inform_states",
			dataType:"json",
			method:"POST",
			async:true,
			data:{"eventid":eid0,"date":dt0,"sids": sids},
			success:function(r){

				$('#result').html(r.j0);
			}
		})		
	});
	
</script>
</body>
</html>