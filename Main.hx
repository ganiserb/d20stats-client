package ;

import flash.sampler.NewObjectSample;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.controls.TextInput;
import haxe.ui.toolkit.controls.OptionBox;
import haxe.ui.toolkit.controls.popups.SimplePopupContent;
import haxe.ui.toolkit.controls.popups.Popup;
import haxe.ui.toolkit.core.PopupManager;
import haxe.ui.toolkit.events.UIEvent;

  
class Main {

    public static function main() {
        Toolkit.init();
        Toolkit.openFullscreen(function(root:Root) {
			var options : Array<OptionBox> = new Array<OptionBox>();

			function btnSaveOnClick(e : UIEvent) {
				// see which number is selected
				for (option in options) {
					if (option.selected) {
						// Do something with the number
						PopupManager.instance.showSimple(option.text);
						break;
					}
				}
			}
			
            var button:Button = new Button();
            button.text = "Click Me!";
            button.x = 100;
            button.y = 100;
            button.onClick = function(e:UIEvent) {
                e.component.text = Std.string(root.width) + "x" + Std.string(root.height);
            };
            root.addChild(button);
			trace("Test");
			
			// Texto
			var txtNombre : TextInput = new TextInput();
			txtNombre.value = "hola, probá el teclado";
			txtNombre.x = 10;
			txtNombre.y = 10;
			txtNombre.width = 600; 
			root.addChild(txtNombre);
			
			// Add the grid with the rolls
			var initialY : Float = root.height * 0.2; // The initial height for the options
			var initialX : Float = 0;
			var ROWS : Int = 4;
			var COLUMNS : Int = 5;
			var ySpacing : Float = (root.height - initialY) * 0.8 / ROWS;
			var xSpacing : Float = root.width * 0.8 / COLUMNS;
			
			
			for (row in 1...ROWS + 1) {
				for (column in 1...COLUMNS + 1) {
					var rollOption =  new OptionBox();
					rollOption.group = "numbers";
					rollOption.text = Std.string(row * column);
					
					// Keep a reference in the array
					options.push(rollOption);
					
					root.addChild(rollOption);
					rollOption.x = initialX + xSpacing * column;
					rollOption.y = initialY + ySpacing * row;
				}
			}
			
			var btnSave : Button = new Button();
			btnSave.text = "Send roll";
			btnSave.x = root.width;
			btnSave.y = root.height;
			btnSave.onClick = btnSaveOnClick;
			root.addChild(btnSave);
			btnSave.x -= btnSave.width + 5;
			btnSave.y -= btnSave.height + 5;
       });
    }

}