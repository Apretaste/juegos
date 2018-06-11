<!DOCTYPE html>
<html>
<head>
	<title>Resultado</title>

<style type="text/css">
	#container{
		background: rgb(220,220,220);
	}
	.opcion{
		display: inline-block;
		width:48%;
		
	}
	.figure{
		font-size: 5em;
	}
	h1,p{
		text-align: center;
	}
	.resultado{
		text-align: center;
		margin-bottom: 2em;
	}
	.resultado div{
		background: #fff;
	}
	#btn-main{
		text-align: center;
	}
	#btn-main a{
		padding: 1.5em;
		font-weight: bold;
		font-size: 4em;
	}
#btn-main a:hover{
		box-shadow: 7px 7px 7px rgb(200,200,200);
	}
	#win,#lose{
		font-size: 2.5em;
	}
	.win{
		color: green;
	}
	.lose{
		color: red;
	}
	#mensaje{
		font-size: 1.5em;
	}

</style>
</head>
<body>
	<div class="container">
	<div id="menu">
		{button href="JUEGOS PPT" caption="&#8592;Ir al inicio" size="small"}
		</div>
	<h1>Resultado</h1>
	{if isset($datos["error"])}
	<p>{$datos["error"]}</p>
	{else}
	<div id="mensaje"><p>{if isset($datos["resultado"])}
		{if $datos["resultado"]}
		felicidades, has ganado <span id="win" class="win">&#10004;</span><span class="win">+§{$datos["credit"]}</span>
		{else}
			Lo siento, has perdido <span id="lose" class="lose"> &#10006;</span><span class="lose">-§{$datos["credit"]}</span>
		{/if}
	{else}
		Hay un empate

	{/if}</p></div>
	<div class="resultado">
			
			<div class="opcion">
				
				<div class="figure">
					<h2>Sistema</h2>
					{if $datos["vs"]==piedra}
					&#9994;
					{else if $datos["vs"]==papel}
					&#9995;
					{else}
					&#9996;
					{/if}

				</div>
				
			</div>
			
			<div class="opcion">
				
				<div class="figure">
					<h2>{$datos["usuario"]}</h2>
					{if $datos["opcion"]==piedra}
					&#9994;
					{else if $datos["opcion"]==papel}
					&#9995;
					{else}
					&#9996;
					{/if}
				</div>
			</div>

		</div>
		

	<div id="resultado">
		<div></div>
		<div>
			
		</div>
		<div>
			
		</div>

	</div>
	<div id="btn-main">
		{button href="JUEGOS PPT" popup="true" caption="Jugar nuevamente" desc="n:Apuesta*|m:jugada[PIEDRA,PAPEL,TIJERA]" size="small"}
		{/if}
	</div>
	</div>
</body>
</html>