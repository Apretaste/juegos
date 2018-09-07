<!DOCTYPE html>
<html>
<head>
	<title>ranking</title>
	<style type="text/css">
		#ranking table{
			width: 100%;
		}
		#ranking table tr:nth-child(odd){
				background: rgba(78, 226, 109,.2);
				min-height: 40px;
			}
		#ranking td{
				text-align: center;
				min-width: 80px;
			}
		th{
			background: silver;
			}
		#info{
			position: relative;
		}
		#atras{
			position: absolute;
			top: 0;
			right: 0;
		}
	</style>
</head>
<body>
	<div id="ranking">
	<div id="info">
		<h1>Mi Puntaje:</h1>
		<p>Ganados:{$score[0]->win}</p>
		<p>Perdidos:{$score[0]->lose}</p>
		<p>Puntos:{$score[0]->score}</p>
		<p id="atras">{button href="JUEGOS {$juego}"  caption="&#8592;atras"  size="small"}</p>
	</div>
	<h2 align="center">Los mejores 10 scores</h2>
	<table>
		<tr>
			<th>Jugador</th>
			<th>Ganados</th>
			<th>Perdidos</th>
			<th>Puntos</th>
		</tr>
		{foreach $listado as $fila}
		<tr>
			<td>{$fila->user}</td>
			<td>{$fila->win}</td>
			<td>{$fila->lose}</td>
			<td>{$fila->score}</td>
		</tr>
		{/foreach}
	</table>
	</div>
</body>
</html>