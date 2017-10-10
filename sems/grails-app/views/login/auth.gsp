<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		#header{
	    	background-color: #d1d1d1;
	    }
	    .text_{
	    	text-align:center;
	    }
	</style>
	<asset:stylesheet src="application.css"/>
	<title>Sports Association:Login</title>
</head>
<body>
		<div class="col-lg-12 col-md-6 col-sm-6" id="header">
			<center>
				<h1>Sports Association</h1>
			</center>
		</div>
		<div id="login">
		<center>
		<div class="inner">
			<div class="fheader"><h1>Please Login</h1></div>
			<br>
				<form action="/login/authenticate" method="POST" id="loginForm" class="cssform" 
				<p>
					<input type="text" class="text_" name="username" id="username" placeholder="Username" />
				</p>
				<br>
				<p>
					<input type="password" class="text_" name="password" id="password" placeholder="Password"/>
				</p>
				<br>
				<p>
					<input type="submit" id="submit" value="Login"/>
				</p>
			</form>
		</div>
		</center>
	</div>
	<script type="text/javascript" src="/assets/jquery-2.2.0.min.js?compile=false" ></script>
	<script type="text/javascript" src="/assets/bootstrap.js?compile=false" ></script>
	<script type="text/javascript" src="/assets/application.js?compile=false" ></script>
</body>
</html>