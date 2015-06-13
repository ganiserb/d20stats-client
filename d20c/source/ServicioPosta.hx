package ;
import flash.events.Event;
import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.net.URLRequestHeader;
import flash.net.URLRequestMethod;
import flash.net.URLVariables;
import haxe.Json;


class ServicioPosta {
	
	public static var instancia(get, null) : ServicioPosta;
	private inline static var ruta_base : String = "https://d20s.herokuapp.com/api/v1/";
	private inline static var formato : String = "json";
	private inline static var api_key : String = "8d235d12ea67602454cc10502e518eb502b74b92";
	private inline static var api_username : String = "d20client";
	private inline static var password : String = "pepelopo01";
	
	private inline static var ruta_roll : String = "roll/";
	private inline static var ruta_user : String = "user/";	
	
	private function new() {
		
	}
	
	private static function get_instancia():ServicioPosta {
		if (null == instancia) {
			instancia = new ServicioPosta();
		}
		return instancia;
	}
	
	//public static getUsers(objects : Dynamic) {
		//
	//}
	
	public function obtenerUsuarios(callback : Event -> Void, onErrorHandler : Event -> Void) : Void {
		//var cargador:URLLoader = new URLLoader();
		//cargador.addEventListener(Event.COMPLETE, callback);
		//cargador.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
		//cargador.addEventListener(IOErrorEvent.IO_ERROR, onErrorHandler);
		//cargador.addEventListener(Event.OPEN, openHandler);
		//cargador.addEventListener(ProgressEvent.PROGRESS, progressHandler);
		//cargador.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
		//var ruta : String = ruta_base + ruta_user + '?format='+ServicioPosta.formato + '&api_key=' + ServicioPosta.api_key + '&api_username=' + ServicioPosta.api_username ;
		//trace(ruta);
		var cargador:URLLoader = new URLLoader();
		cargador.addEventListener(Event.COMPLETE, callback);
		cargador.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
		cargador.addEventListener(IOErrorEvent.IO_ERROR, onErrorHandler);
		cargador.addEventListener(Event.OPEN, openHandler);
		cargador.addEventListener(ProgressEvent.PROGRESS, progressHandler);
		cargador.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
		var ruta : String = ruta_base + ruta_user + '?format='+ServicioPosta.formato + '&api_key=' + ServicioPosta.api_key + '&api_username=' + ServicioPosta.api_username ;
		trace(ruta);
		
		var request : URLRequest = new URLRequest(ruta);
		request.requestHeaders.push(new URLRequestHeader("Content-Type", "application/json"));
		trace(request);
		request.method = URLRequestMethod.GET;
		
		cargador.load(request);
	}

	//public function postRoll(numero : Int) : Void {
		//var cargador:URLLoader = new URLLoader();
		//cargador.addEventListener(Event.COMPLETE, function(e:Event) {});
		//cargador.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
		//cargador.addEventListener(IOErrorEvent.IO_ERROR, function(e:Event) {
			//FlxG.resetGame(); // Si el server no se pudo alcanzar guardando el juego, chau
		//});//ioErrorHandler);
		//cargador.addEventListener(Event.OPEN, openHandler);
		//cargador.addEventListener(ProgressEvent.PROGRESS, progressHandler);
		//cargador.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
		//var ruta : String = ruta_base + ruta_play ; //+ '&api_key=' + ServicioPosta.api_key + '&api_username=' + ServicioPosta.api_username ;
		//trace(ruta);
		//var params : Dynamic = { };
		//params.device_app_version = Reg.deviceAppVersion;
		//params.device_id = Reg.deviceId;
		//params.player = Reg.usuarioActual;
		//params.play_date = Date.now().toString(); // Se jugó cuando se envió. No guardamos datos offline
		//
		//params.app = appId;
		//params.level = levelId;
		//params.used_time = Std.string(Std.int(usedTime));
		//params.result = Std.string(Std.int(puntaje));
		//
		////params.id = Math.ceil(Math.random() * 100);
		////params.id = 41;
		//
		//trace(params);
		//trace(Json.stringify(params));
		//
		//var request:URLRequest = new URLRequest(ruta);
		//request.requestHeaders.push(new URLRequestHeader("Authorization", "ApiKey " + api_username + ":" + api_key));
		//request.requestHeaders.push(new URLRequestHeader("Content-Type", "application/json"));
		//request.method = URLRequestMethod.POST;
		//request.data = Json.stringify(params);
		//trace(request.data);
//
		//cargador.load(request);
	//}
	
	private function securityErrorHandler(e:SecurityErrorEvent):Void {
		trace( "Servicio.securityErrorHandler > e : " + e );
	}
	
	private function progressHandler(e:ProgressEvent):Void {
		trace( "Servicio.progressHandler > e : " + e );
	}
	
	private function openHandler(e:Event):Void {
		trace( "Servicio.openHandler > e : " + e );
	}
	
	private function ioErrorHandler(e:IOErrorEvent):Void {
		trace( "Servicio.ioErrorHandler > e : " + e );
		trace( "Servicio.ioErrorHandler > e : " + e.errorID );
		trace( "Servicio.ioErrorHandler > e : " + e.text );
	}
	
	private function httpStatusHandler(e:HTTPStatusEvent):Void {
		trace(this);
		trace( "Servicio.httpStatusHandler > e : " + e.status );
	}
	
}