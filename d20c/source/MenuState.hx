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
	
	var labelSelectedUsername : FlxText;
	var labelSelectedRoll : FlxText;
	
	override public function create():Void
	{
		super.create();
		
		labelSelectedUsername = new FlxText(0, 0, 50, 'Username', 10);
		labelSelectedRoll = new FlxText(0, 25, 50, 'Roll', 20);
		
		add(labelSelectedUsername);
		add(labelSelectedRoll);
		
		ServicioPosta.instancia.obtenerUsuarios(showUsers, onError);
	}
	
	public function showUsers(e : Event) {
		var listaUsuarios = Json.parse(e.target.data);
		trace(listaUsuarios.objects[0].username);
		var altura = 0;
		var textSize = 30;
		for (usuario in listaUsuarios.objects) {
			//if (Reg.idsUsuario.indexOf(usuario.id) != -1 ) {
				// Nos fijamos que los usuarios que tenemos hardcodeados estén en el backend
				var btnUsuario = new FlxButton(0, 0, null, function() {
					Reg.selectedUserUri = usuario.resource_uri;
					Reg.selectedUserName = usuario.username;
					labelSelectedUsername.text = Reg.selectedUserName;
					trace('boton');
				});
				btnUsuario.x = 10;
				btnUsuario.y = FlxG.height * 0.1 + altura;
				btnUsuario.text = usuario.username;
				
				add(btnUsuario);
				altura += 50;
			//}
		}
		//add(new FlxButton(50, 50, "test", function ()
		//{
			//trace("anda");
		//}));
		var rows = 4;
		var columns = 5;
		var initialX = FlxG.width * 0.2;
		var initialY = FlxG.height * 0.1;
		var spaceX = (FlxG.width - initialX) / columns;
		var spaceY = (FlxG.height - initialY) / rows;
		for (row in 0...rows) {
			for (column in 0...columns) {
				var number = (row * columns + (column + 1));
				var numberButton = new FlxButton(initialX, initialY, Std.string(number), function()
				{
					Reg.selectedRollValue = number;
					labelSelectedRoll.text = Std.string(Reg.selectedRollValue);
				});
				numberButton.x += column * (numberButton.width);
				numberButton.y += row * (spaceY - numberButton.height);
				add(numberButton);
			}
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