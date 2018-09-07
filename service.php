<?php

/**
 * Apretaste Juegos Service
 *
 * @author vilfer
 * @version 1.0
 */

class Juegos extends Service
{
	public function _main(Request $request){
		
			$response = new Response();
			$response->setCache();
			$response->setResponseSubject("Que juego desea utilizar?");
			$response->createFromTemplate("home.tpl", array());
			return $response;
		
	
	}

	public function _ppt(Request $request){
			$exist=Connection::query("SELECT * from _juegos_user where id_juego=1 and user='{$request->email}'");
			
			if(count($exist)==0)
				Connection::query("INSERT INTO _juegos_user(id_juego,user) VALUES(1,'{$request->email}')");
			$creditos=$this->gestionar_creditos($request->email);
			$user = $this->utils->getUsernameFromEmail($request->email);
		if(empty($request->query)){
			
			$responseContent["creditos"]=$creditos[0]->credit;
			
			$response = new Response();
			$response->setCache();
			$response->setResponseSubject("Elija su jugada");
			$response->createFromTemplate("ppt.tpl",["datos"=>$responseContent]);
			return $response;
		}
		if($creditos[0]->credit!=0){
			$params=$this-> proccessParams($request,["apuesta"=>1,"opcion"=>"piedra"]);
		

		$opciones=["piedra","papel","tijera"];
		$opcion=strtolower($params["opcion"]);

		$vs=random_int(0,2);
		$vs=$opciones[$vs];
		
		if($opcion!=$vs){
			$ganador=false;
			if($opcion=="tijera"){
				if($vs=="papel"){
					$ganador=true;
					
				}
				
			
			}
			else if($opcion=="piedra"){
				if($vs=="tijera"){
					$ganador=true;
					
				}
				
			}
				
			else if($opcion=="papel"){
				if($vs=="piedra"){
					$ganador=true;
					
				}
				
			}
			else{
				return response();
				
			}
			
		}
			
			
		else{
			
		
			
		}
		$responseContent=["opcion"=>$opcion,"vs"=>$vs,"credit"=>$params["apuesta"],"usuario"=>$user];
		if(isset($ganador)){
			if($ganador){
				$result=$this->gestionar_creditos($request->email,1,abs($params["apuesta"]));
						$responseContent["resultado"]=true;
			}
			else{
				$result=$this->gestionar_creditos($request->email,2,abs($params["apuesta"]));

					$responseContent["resultado"]=false;
			}
		}
		}
		else{
			$responseContent["error"]="Lo sentimos, no tiene creditos suficientes para jugar";
		}
		$response = new Response();
			$response->setCache();
			$response->setResponseSubject("Resultado");
			$response->createFromTemplate("ppt_results.tpl",["datos"=>$responseContent]);
			return $response;

		
	}
	private function gestionar_creditos($usuario,$accion=0,$apuesta=0){
		switch ($accion) {
			case 0:
				$sql="SELECT credit FROM person WHERE email = '{$usuario}'";
				
				break;
			case 1:
				$sql="UPDATE person SET credit=credit+{$apuesta} WHERE email = '{$usuario}'";
				$sql1="UPDATE _juegos_user set win=win+1,score=score+3 where id_juego=1 and user='{$usuario}'";
				break;
			case 2:
				$sql="UPDATE person SET credit=credit-{$apuesta} WHERE email = '{$usuario}'";
				$sql1="UPDATE _juegos_user set lose=lose+1 where id_juego=1 and user='{$usuario}'";
				break;
			default:
				# code...
				break;
		}
		if(isset($sql1)){
			$result=Connection::query($sql1);
		}
			
		$creditos=Connection::query($sql);
		
		
		return $creditos;
		
	}

	
	
	private function proccessParams($request, $default)
	{
		$params = $default;
		if (isset($request->params) && is_array($request->params))
		{
			$i = 0;
			foreach($default as $param => $value)
				if (isset($request->params[$i]))
				{
					$v = $request->params[$i];
					if (is_callable($value))
						$v = $value($v);

					if ( ! empty($v) || ! is_null($value))
					{
						$params[$param] = $v;
					}

					$i++;
				}
		}

		return $params;
	}

	public function _ver_ranking(Request $request){
		$juego=strtolower($request->query);

		$score=Connection::query("SELECT * from _juegos_user where user='{$request->email}'");
		$listado=Connection::query("SELECT * from _juegos_user,_juegos where _juegos_user.id_juego=_juegos.id and _juegos.seudonimo='{$juego}' order by score DESC LIMIT 10");
	
		$response = new Response();
			$response->setCache();
			$response->setResponseSubject("Ranking");
			$response->createFromTemplate("ranking.tpl",["listado"=>$listado,"score"=>$score,"juego"=>$request->query]);
			return $response;
	}
	
}


