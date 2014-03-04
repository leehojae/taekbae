<title>SDMS</title>

<!-- css -->
<link rel="stylesheet" type="text/css"
	href="//w2ui.com/src/w2ui-1.3.min.css" />

<!-- Bootstrap -->
<link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/w2ui-1.3.1.min.css" />
<link href="css/starter-template.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- 맵 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<!-- <script src="js/jquery/jquery-1.11.0.js"></script>  -->
<script type="text/javascript" src="//w2ui.com/src/w2ui-1.3.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://api.ktgis.com:10080/v3/olleh/mapAPI.js?key=T2xsZWhNYXBBUEkwMDA0OnZUMVM0TnFWZGk="></script>
<script type="text/javascript" src="js/map.js"></script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<!-- <script type="text/javascript" src="member.js"></script> -->
</head>
<body onload="init()">
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="#about"><h1>SDMS(Smart Delivery
								Management System)</h1></a></li>
					<li><a href="#about">${loginUser.name}님</a></li>
					<li><a
						href="${pageContext.request.contextPath}/auth/logout.do">로그아웃</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>

	<div class="container">

		<div class="starter-template">
			<br>
			<form enctype="multipart/form-data" action="excel/add.do"
				method="POST" id="upload_form">
				<input type="file" id="excelFile" name="excelFile" /> <input
					type="submit" value="파일 전송" />
			</form>
			<script type="text/javascript" src="js/excelUpload.js"></script>
			<script type="text/javascript" src="js/toolbar.js"></script>
			<div id="toolbar"
				style="padding: 4px; border: 1px solid silver; border-radius: 3px"></div>
			<br>
			<div id="grid" style="width: 100%; height: 250px;"></div>
			<script type="text/javascript" src="js/excelGrid.js"></script>
			<div id="map" style="width: 1024px; height: 768px"></div>
		</div>
	</div>