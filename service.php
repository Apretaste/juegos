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
			$response->setResponseSubject("Que desea buscar en Google?");
			$response->createFromTemplate("home.tpl", array());
			return $response;
}
}
