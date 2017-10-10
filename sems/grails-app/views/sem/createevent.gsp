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
	<title>Create event</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12 col-md-6 col-sm-6" id="header">
			<center>
				<h1>International Sports Association</h1>
			</center>
		</div>
		<div class="col-lg-12 col-md-6 col-sm-6">
			<center>
				<i>
					<b>Create Event</b>
				</i>
			</center>
		</div>
		<div class="col-lg-12 col-md-6 col-sm-6">
			<div class='row'>
				<div class="col-lg-6 col-md-6 col-sm-6"><b><center>Name of event:</center></b></div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<input type="text" id="ed0" name="eventdescription" placeholder="Create Event">
				</div>
			</div>
		</div>
		<div class="col-lg-12 col-md-6 col-sm-6">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6"><b><center>Event Date:</center></b></div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<input type="date" id="dt0" name="date">
				</div>
			</div>	
		</div>
		<div class="col-lg-12 col-md-6 col-sm-6">
			<div class="row"> 
				<div class="col-lg-6 col-md-6 col-sm-6"><b><center>Select countries to invite in this event:</center></b></div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<g:each var="data" in="${data1}">
					<div class='row'><div class="col-lg-1 col-md-6 col-sm-6"><input type="checkbox" class="country-check" value="Add" data-id="${data.id}"></div>
					<div class="col-lg-9 col-md-6 col-sm-6">${data.country}</div></div>	
					
				</g:each>
				</div>
			</div>	
		</div>
		<div class="col-lg-12 col-md-6 col-sm-6">
			<div class="col-lg-12 col-md-6 col-sm-6"><center><input type="submit" name="submit" formaction="post_create_event" id="add" value="Create Event"></center></div>
		</div>
		<div class="col-lg-12 col-md-6 col-sm-6">
			<div class="col-lg-12 col-md-6 col-sm-6"><center><b><div id="result"></div></b></center></div>
		</div>
		
	</div>	
	<script type="text/javascript">
		var j=0
		$(document).on('click','#add',function(){
			console.log("clicked")
			j=j+1
			var ed=$('#ed0').val();
			var dt=$('#dt0').val();
			/*var i=$('.a').data('id');
			var co=$('#'+i).val();
*/
			var cids = [];

			$('.country-check').each(function(){
				var isChecked = $(this).is(":checked");
				if(isChecked) {
					var cid = $(this).data('id')
					cids.push(cid)
				}
			});

			console.log(cids)
			cids = cids + ""
			$.ajax({
				url:"http://localhost:8080/sem/post_create_event",
				dataType:"json",
				method:"POST",
				async:true,
				data:{"eventdescription":ed,"date":dt, "cids": cids},
				success:function(r){
					var a0=r.j
					$('#result').html(a0+" for "+ed);

				}
			})
		});

		$(document).on('click','.del',function(){
			var d0=$(this).data('bid');

			$.ajax({
				url:"http://localhost:8080/sem/delete_create_event",
				dataType:"json",
				method:"POST",
				async:true,
				data:{"id":d0},
				success:function(){
					
				}
			})


		});

	</script>	
</body>
</html>