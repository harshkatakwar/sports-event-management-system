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
			<h2>Fixture created for the given events</h2>
			<h6>Click on declare results to upload result of matches</h6>	
			<g:each in="${data}" var="data1">
				<div class="row" id="a">
				<p>			
					<div class="col-lg-6 col-md-6 col-sm-6"><input type="hidden" name="id" id="deid" value="${data1.id}"><input type="hidden" name="eventdescription" id="ed" value="${data1.eventdescription}">${data1.eventdescription}</div>
					<div class="col-lg-3 col-md-6 col-sm-6"></div>
					<div class="col-lg-3 col-md-6 col-sm-6"><button type="submit" id="pb" data-id="${data1.id}" data-toggle="collapse" data-target="#abc">Declare result</button></div>	
				</p>
				</div>
			</g:each>
			<div id="result0"></div>
			<div id="result"></div>
			<div id='result1'></div>
			<div id="result2"></div>
			<!-- <table border="1">
			<tr><td><div class="row">			
				<div class="col-lg-7 col-md-6 col-sm-6"><p><input type="hidden" name="eventdescription" value="eventdescription">Event Description</p></div>
				<div class="col-lg-3 col-md-6 col-sm-6"><input type="hidden" name="eventdescription" value="eventdescription">date</div>
				<div class="col-lg-2 col-md-6 col-sm-6"><input type="submit" name="submit" value="Participate"></div>
			</div></td>
			</tr>
			</table> -->		
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
		var deid0=$('#deid').val();
		$(document).on('click','#pb',function(){
		console.log(deid0);
			$.ajax({
				url:"http://localhost:8080/sem/showFixture",
				method:"POST",
				async:true,
				dataType:"json",
				data:{"deid":deid0},
				success:function(r){
					var a1=r.su13
					var up1=r.up1
					var up2=r.up2
					console.log(a1);
					var a00="<div class='collapse' id='abc'>"
					$('#result0').html(a00);
					for(var i=0;i<a1.length;i++){
						var a2="<div class='row'><div class='col-lg-3 col-md-6 col-sm-6'><center>"+up1[i]+"</center></div><div class='col-lg-1 col-md-6 col-sm-6'><input type='radio' name='"+a1[i].id+"' class='player-check' data-id='"+a1[i].id+"' data-d='"+up1[i]+"'></div><div class='col-lg-3 col-md-6 col-sm-6'>"+up2[i]+"</div><div class='col-lg-1 col-md-6 col-sm-6'><input type='radio' class='player-check' name='"+a1[i].id+"' data-id='"+a1[i].id+"' data-d='"+up2[i]+"'></div></div>";
						$('#result').append(a2);
					}
					var a3="<center><button type='submit' id='sb' >Save</button></center>";
					var a001="</div>"
					$('#result1').html(a3+""+a001);
				}
			})
		});
		$(document).on('click','#sb',function(){
			var pns=[];
			var ids=[];
			$('.player-check').each(function(){
				var isChecked = $(this).is(":checked");
				if(isChecked) {
					var pn = $(this).data('d')
					pns.push(pn)
					var id1=$(this).data('id');
					ids.push(id1)
				}
			});
			console.log(ids);
			console.log(pns);
			pns=pns+"";
			ids=ids+""
			/*var ids0 = JSON.stringify(ids);
			var pns0 = JSON.stringify(pns)*/
			$.ajax({
				url:"http://localhost:8080/sem/saveMatchResult",
				dataType:"json",
				method:"POST",
				async:true,
				data:{"playernames":pns,"ids":ids},
				success:function(r){
					var a12=r.su16
					var a4="<div class='row'><div class='col-lg-12 col-md-6 col-sm-6'>Choose a player who will represent district</div></div>";
					$('#result2').html(a4);
					for(var i1=0;i1<a12.length;i1++){
						console.log(a12[i1].username);
						
						var a5="<div class='row'><div class='col-lg-2 col-sm-6 col-md-6'><input type='radio' name='players'  data-id='"+a12[i1].id+"' class='selectplayers-check' ></div><div class='col-lg-6 col-sm-6 col-sm-6'>"+a12[i1].username+"</div><div class='col-lg-4 col-md-6 col-sm-6'></div></div>"

						$('#result2').append(a5);
					}
					var a6="<div class='row'><div class='col-lg-12 col-md-6 col-sm-6'><center><button type='submit' id='submitbtn'>Submit</button></center></div></div>"
					$('#result2').append(a6);
				}
			});
				//<center><button type='submit' id='submitbtn'>Submit</button></center>
		});
		$(document).on('click','#submitbtn',function(){
			var deid1=deid0;
			var uid=[];
			var uids1;
			$('.selectplayers-check').each(function(){
				var isChecked1 = $(this).is(":checked");
				if(isChecked1) {
					uids1=$(this).data('id');
				}
			});
			console.log(uids1);
			$.ajax({
				url:"http://localhost:8080/sem/saveUserDistrictEvent",
				dataType:"json",
				method:"POST",
				async:true,
				data:{"playernames":uids1,"districtevent":deid1},
				success:function(r){
					
				}
				
			});	
		});
	</script>
</body>
</html>