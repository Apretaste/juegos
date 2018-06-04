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
}
