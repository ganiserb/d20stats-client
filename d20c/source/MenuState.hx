package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flash.events.Event;
import haxe.Json;


/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		ServicioPosta.instancia.obtenerUsuarios(showUsers, onError);
	}
	
	public function showUsers(e : Event) {
		var listaUsuarios = Json.parse(e.target.data);
		trace(listaUsuarios.objects[0].id);
		var altura = 0;
		var textSize = 30;
		for (usuario in listaUsuarios.objects) {
			//if (Reg.idsUsuario.indexOf(usuario.id) != -1 ) {
				// Nos fijamos que los usuarios que tenemos hardcodeados estén en el backend
				var btnUsuario = new FlxButton(0, 0, null, function() {
					trace('boton');
				});
				btnUsuario.x = (FlxG.width / 2) - (btnUsuario.width / 2);
				btnUsuario.y = FlxG.height * 0.23 + altura;
				btnUsuario.text = usuario.username;
				
				add(btnUsuario);
				altura += 50;
			//}
		}
	}
	public function onError(e : Event) {
		trace('error');
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}