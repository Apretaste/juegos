<!DOCTYPE html>
<html>
<head>
	<title>Piedra pepel o tijera</title>
	<style type="text/css">
	#container{
		background: rgb(220,220,220);
	}
	#instrucciones{
		background: #5DBD00;
		color: #fff;
		font-size: .8em;
		opacity: .9;
	}
	h1,h2,h3{
		text-align: center;
	}
	#btn-main{
		text-align: center;
		font-size: 2em;
	}
	#btn-main a{
		padding: 2em;
		font-weight: bold;
		font-size: 4em;
	}
	.menu{
		position: relative;
		min-height: 3em;
	}
	#creditos,#btn-atras{
		position: absolute;
		bottom: 0;
		right: 0;
	}
	h3{
	font-size: 1.2em;
	}
	#btn-main a:hover{
		box-shadow: 7px 7px 7px rgb(200,200,200);
	}

	</style>
</head>
<body>
	<div id="container">
	<div class="menu">
		<p>{button href="JUEGOS"  caption="&#8592;Juegos"  size="small"}</p>
	<p id="creditos">credito:§{$datos['creditos']}</p>
	
	</div>
	<div class="menu">
		<p id="btn-atras">{button href="JUEGOS VER_RANKING PPT" caption="Ver Ranking" size="small"}</p>
	</div>
	
<h1>Piedra&#9994; papel&#9995; o tijera&#9996;</h1>
{if $datos['creditos']>0}
<div id="instrucciones">
	<h3>Instrucciones:</h3>
<ol>
	<li>Hay un monto minimo de apuesta que es 1 credito. Este monto puede ser modificado por usted</li>
	<li>Debe seleccionar una de las 3 opciones(piedra pepel o tijera</li>
	<li>La aplicacion hará un juego al azar para competir con usted</li>
	<li>Se mostrará el resultado de la jugada en pantalla. Si usted resulta ganador, los creditos apostados se sumaran a su cuenta, sino serán descontados.</li>
</ol>

</div>
<div id="btn-main">
{button href="JUEGOS PPT" popup="true" caption="Jugar" desc="n:Apuesta*|m:jugada[PIEDRA,PAPEL,TIJERA]*" size="small"}
</div>

<!--
{link href="JUEGOS ppt tijera" caption='Piedra'  wait="true"}
{link href="JUEGOS ppt" caption='Papel'  wait="true"}
{link href="JUEGOS ppt" caption='Tijera'  wait="true"}-->
{else}
<p>No tiene creditos suficientes para jugar</p>
{button href="CREDITO" caption="Creditos"  size="small"}

{/if}
</div>
</body>
</html>