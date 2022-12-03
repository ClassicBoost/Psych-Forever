package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class PsychForeverSettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Psych Forever Settings';
		rpcTitle = 'Psych Forever Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Opponent Note Splashes',
			'If checked, opponent will have note splashes.\nDoes not work if opponent strums is disabled.',
			'opponentSplashes',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Mechanics',
			'If unchecked, mechanics will be disabled. pussy',
			'mechanicsSystem',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Late Damage',
			'If checked, hitting notes late or early will hurt you.',
			'lateDamage',
			'bool',
			true);
		addOption(option);

		super();
	}
}