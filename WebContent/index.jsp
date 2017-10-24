<!DOCTYPE html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Modelo Para La Generación De Datos Enlazados</title>
<meta name="description"
	content="Write some words to describe your html page">
<!-- Progress bar -->
<script
	src="https://rawgit.com/kimmobrunfeldt/progressbar.js/1.0.0/dist/progressbar.js"></script>
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/alertifyjs/1.10.0/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/alertifyjs/1.10.0/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/alertifyjs/1.10.0/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/alertifyjs/1.10.0/css/themes/semantic.min.css" />
<!-- Bootstrap theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/alertifyjs/1.10.0/css/themes/bootstrap.min.css" />
<!--RTL version-->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/alertifyjs/1.10.0/css/alertify.rtl.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/alertifyjs/1.10.0/css/themes/default.rtl.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/alertifyjs/1.10.0/css/themes/semantic.rtl.min.css" />
<!-- Bootstrap theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/alertifyjs/1.10.0/css/themes/bootstrap.rtl.min.css" />
<link rel="stylesheet" type="text/css" href="css/estilos.css">
<!-- Fuente -->
<link href="https://fonts.googleapis.com/css?family=Bellefair"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
<!-- YASGUI -->
<script
	src='//cdn.jsdelivr.net/npm/yasgui-yasqe@2.11.16/dist/yasqe.bundled.min.js'></script>
<script
	src='//cdn.jsdelivr.net/npm/yasgui-yasqe@2.11.16/dist/yasqe.min.js'></script>
<link
	href='//cdn.jsdelivr.net/npm/yasgui-yasqe@2.11.16/dist/yasqe.min.css'
	rel='stylesheet' type='text/css' />
<script src="https://cdn.jsdelivr.net/npm/yasgui@2.7.5/yasgui.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/yasgui@2.7.5/yasgui.min.css">
<script
	src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.v0.6.3.js"></script>
<script src="<%=request.getContextPath()%>/js/sweetalert2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/GestorGrafo.js"></script>
<script src="<%=request.getContextPath()%>/js/d3sparql.js"></script>
<link rel="stylesheet" type="text/css" href="css/sweetalert2.min.css">
<script src="<%=request.getContextPath()%>/js/GestorIndice.js"></script>
<script src="<%=request.getContextPath()%>/js/GestorTabla.js"></script>
</head>
<body>

	<div class="blended_grid">
		<div class="pageHeader">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<img src="<%=request.getContextPath()%>/img/rdf.png" width="30"
							height="30"> <a class="navbar-brand"> Modelo Para La
							Generación De Datos Enlazados </a>
					</div>
				</div>
			</nav>
		</div>
		<div id="formulario" class="pageContent">
			<form name="form" id="form">
				<!-- <textarea class="form-control" rows="7" cols="50" id="textArea" name="textArea"
					placeholder="Escribe tu consulta"></textarea> -->
				<div id="yasgui" name="textArea"></div>
				<script type="text/javascript">
					var yasqe = YASQE(document.getElementById("yasgui"), {
						backdrop : false,
					//	value : "construct {?s ?p ?o} where {?s ?p ?o}",
						createShareLink : null,
						tabSize: 0,
						textWrapping:false,
						reindentOnLoad:true,
						indentWithTabs: false,
						indentUnit:1,
						noScriptCaching:true,
						sparql : {
							//endpoint : "${url}",
							showQueryButton : false
						}
					
					
					});
					function getQuery(){
						return yasqe.getValue();
					}
				</script>
			</form>
			<div id="button">
				<button class="btn btn-primary" type="button"
					onclick="getQueryData(getQuery())" id="botonRun">
					<span class="glyphicon glyphicon-play"></span>RUN
				</button>
			</div>

			<div class="btn-group" role="group" aria-label="...">
				<button type="button" class="btn btn-default"
					onclick="createTable(json)">Tabla</button>
				<button type="button" class="btn btn-default"
					onclick="createGraph(json)">Grafo</button>
				<button type="button" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
					id="dropdownMenu">
					Descargar <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a name="RDF/XML" onclick="getFile(name)">RDF/XML</a></li>
					<li><a name="JSON-LD" onclick="getFile(name)">JSON-LD</a></li>
				</ul>
			</div>
		</div>
		<div id="resultTable">
			<table id="table" border="1" class="table table-striped">
			</table>
		</div>
		<div id="resultGraph"></div>
	</div>
	<div class="pageFooter"></div>
</body>
</html>