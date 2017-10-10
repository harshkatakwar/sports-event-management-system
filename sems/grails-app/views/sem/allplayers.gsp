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
	    #res{
	    	border:1px solid black;
	    }
	</style>
	<title>District Sports Association</title>
</head>
<body>
<div class="row">
		<div class="col-lg-12 col-md-6 col-sm-6" id="header"><center><h1>District Sports Association</h1></center></div>
		<div class="col-lg-8 col-md-6 col-sm-6">
			<h2>All Players</h2>
			<g:each in="${data}" var="data1">	
				<div class="row" id="a">
				<p>
						<div class="col-lg-3 col-md-6 col-sm-6"><input type="checkbox" id="pid" class="player-check" data-id="${data1.id}" data-name=${data1.username} value="${data1.id}"></div>
						<div class="col-lg-9 col-md-6 col-sm-6"><input type="hidden" name="playername" id="pn" value="${data1.username}">${data1.username}</div>			
				</p>
				</div>
			</g:each>
			<input type="hidden" name="eventname" id="en" value="${data3}">
			<div class="col-lg-12 col-md-6 col-sm-6"><button type="submit" name="submit" id="pb"  data-toggle="collapse" data-target="#res">Create fixture</button></div>
			<br>
			<div id="result"></div>
			<div id='result1'></div>
			<div id='result2'></div>		
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
		
		$(document).on('click','#pb',function(){
			var i,j,k=1,n=0;
			var m=[];
			var en0=$('#en').val();
			console.log(en0)
			var pids=[];
			$('.player-check').each(function(){
					var isChecked = $(this).is(":checked");
					if(isChecked) {
						var pid = $(this).data('name')
						pids.push(pid);
					}
			});
			pids=pids+""
			console.log(pids);
			$.ajax({
				url:"http://localhost:8080/sem/selectedPlayers",
				dataType:"json",
				method:"POST",
				async:true,
				data:{"pids":pids,"eventname":en0},
				success:function(r){
					var c=[];
					var d=[];
					var e=[];
					c=r.ff02;
					d=r.uo1;
					e=r.ut1;
					var b="<div class='row' id='rep'><h2>Fixture saved set the date for respective matches</h2></div><br>";
					$('#result1').html(b);
					var a0="<form>";
					$('#result').html(a0);
					for(i=0;i<c.length;i++){
							
                    		var a="<div class='row' id='res'><div class='col-lg-1 col-md-6 col-sm-6'> "+k+" </div><div class='col-lg-3 col-md-6 col-sm-6'>"+d[i]+"</div><div class='col-lg-2 col-md-6 col-sm-6'>vs</div><div class='col-lg-3 col-md-6 col-sm-6'>"+e[i]+"</div><div class='col-lg-3 col-md-6 col-sm-6'><input type='date' class='date' name='eventdate' id="+c[i].id+" data-did="+c[i].id+"></div></div>";
                    		k++;
                    		n++;
                    		$('#result1').append(a);
					}
					var a1="</form>";
					$('#result2').html(a1);
					var b="<br><div><center><input type='submit' id='sv' name='submit' value='Save' ></center></div><div><center><b><div id='result3'></div></b></center></div>";
					$('#result2').append(b);
					/*$(document).on('click','#sf',function(){
						var mids =[];
						console.log("inside save");
					});*/
		
					//redirects to another page 
					/*<div class='col-lg-3 col-md-6 col-sm-6' id='group"+k+"'> "+c[i]+" </div><div class='col-lg-1 col-md-6 col-sm-6'>vs</div><div class='col-lg-3 col-md-6 col-sm-6'><p>"+c[j]+"</p></div><div class='col-lg-4 col-md-6 col-sm-6'><input type='date' id='d"+n+"' ></div>*/
					//window.location.replace('http://localhost:8080/sem/daction1?eventname='+en0+'');
				}
			})	
		});
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
			eds=eds+""
			ids=ids+""
			$.ajax({
				url:"http://localhost:8080/sem/date_save",
				dataType:"json",
				method:"POST",
				async:true,
				data:{"ids":ids,"eds":eds},
				success:function(r){
					var a2=r.a1;
					console.log(a2);
					$('#result3').html("Fixture saved with date.");		
				}
			})	
		});
	</script>
</body>
</html>