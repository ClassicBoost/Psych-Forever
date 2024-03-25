package gameObjects.userInterface;

import flixel.FlxSprite;
import openfl.utils.Assets as OpenFlAssets;

using StringTools;

class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;
	private var isOldIcon:Bool = false;
	private var isPlayer:Bool = false;
	private var char:String = '';

	public var initialWidth:Float = 0;
	public var initialHeight:Float = 0;

	var splitThing:Int = 2;

	private var iconOffsets:Array<Float> = [0, 0];
	public function new(char:String = 'bf', isPlayer:Bool = false, ?loadFullIcon:Bool = false)
	{
		super();
		isOldIcon = (char == 'bf-old');
		this.isPlayer = isPlayer;
		changeIcon(char, isPlayer, loadFullIcon);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}

	public function swapOldIcon() {
		if(isOldIcon = !isOldIcon) changeIcon('bf-old');
		else changeIcon('bf');
	}

	public function changeIcon(char:String, isPlayer:Bool = false, ?loadFullIcon:Bool = false) {
		if(this.char != char) {
			var name:String = 'icons/' + char;
		/*	if (isPlayer) {
			// Seems unneccessary but ehh, why not.
			// basically a player version of the opponent or gf, usually if their winning and losing is flipped.
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/' + char + '-player';
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char + '-player';
			}*/
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/' + char; //Older versions of psych engine's support
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Fuck it
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/face'; //Prevents crash from missing icon
			var file:Dynamic = Paths.image(name);
			loadGraphic(file);

			if (!loadFullIcon) {
			splitThing = width/3 == height ? 3 : 2;
			loadGraphic(graphic, true, Math.floor(width / splitThing), Math.floor(height));
			iconOffsets[0] = (width - 150) / splitThing;
			iconOffsets[1] = (width - 150) / splitThing;
			if (splitThing == 3) iconOffsets[2] = (width - 150) / 3;

			animation.add(char, [0, 1, (splitThing == 3 ? 2 : 0)], 0, false, isPlayer);
			animation.play(char);
			}

			this.char = char;

			initialWidth = width;
			initialHeight = height;

			antialiasing = ClientPrefs.globalAntialiasing;
			if(char.endsWith('-pixel'))
				antialiasing = false;
		}
	}

	public function getCharacter():String {
		return char;
	}
}
