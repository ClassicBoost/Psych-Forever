package editors;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.system.FlxSound;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import editors.updated.*;
import flixel.effects.FlxFlicker;

using StringTools;

class MasterEditorMenu extends MusicBeatState
{
	var options:Array<String> = [
		'Chart Editor',
		'Character Editor',
		'Week Editor',
		'Menu Character Editor',
		'Dialogue Editor',
		'Dialogue Portrait Editor'
	];
	private var grpTexts:FlxTypedGroup<Alphabet>;

	private var curSelected = 0;

	public static var inMasterMenu:Bool = false;

	var disableControls:Bool = false;

	override function create()
	{
		if (!inMasterMenu) FlxG.sound.playMusic(Paths.music('chartEditorLoop'), 0.7);
		Conductor.changeBPM(137);
		inMasterMenu = true;
		disableControls = false;
		FlxG.camera.bgColor = FlxColor.BLACK;
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Editors Main Menu", null);
		#end

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/bg'));
		bg.scrollFactor.set();
		// bg.color = 0xFF353535;
		bg.color = 0xFF00FF90;
		add(bg);

		grpTexts = new FlxTypedGroup<Alphabet>();
		add(grpTexts);

		for (i in 0...options.length)
		{
			var leText:Alphabet = new Alphabet(0, (70 * i) + 30, options[i], true, false);
			leText.isMenuItemCenter = true;
			leText.targetY = i;
			grpTexts.add(leText);
		}

		changeSelection();
		super.create();
	}

	override function update(elapsed:Float)
	{
		if (!disableControls) {
			if (controls.UI_UP_P)
			{
				changeSelection(-1);
			}
			if (controls.UI_DOWN_P)
			{
				changeSelection(1);
			}

			if(FlxG.mouse.wheel != 0)
				changeSelection(-FlxG.mouse.wheel);

			if (controls.BACK)
			{
			//	FlxTween.tween(FlxG.sound.music, {pitch: 1, volume: 0.7}, 1, {ease: FlxEase.cubeOut});
				inMasterMenu = false;
				Conductor.changeBPM(102);
				FlxG.sound.playMusic(Paths.music('freakyMenu'), 0.7);
				MusicBeatState.switchState(new MainMenuState());
			}

			if (controls.ACCEPT || FlxG.mouse.justPressed)
			{
				FlxG.sound.play(Paths.sound('menus/base/confirmMenu'), 0.4);
				FlxFlicker.flicker(grpTexts.members[curSelected], 0.5, 0.06 * 2, true, false, function(flick:FlxFlicker)
					{
						for (item in grpTexts.members) {
							item.alpha = 0;
						}
						disableControls = true;
						switch(options[curSelected]) {
							case 'Chart Editor':
								PlayState.SONG = Song.loadFromJson('test', 'test');
								LoadingState.loadAndSwitchState(new ChartingState());
							case 'Character Editor':
								if (ClientPrefs.newEditors) LoadingState.loadAndSwitchState(new NewCharacterEditorState(Character.DEFAULT_CHARACTER, false));
								else LoadingState.loadAndSwitchState(new CharacterEditorState(Character.DEFAULT_CHARACTER, false));
							case 'Week Editor':
								MusicBeatState.switchState(new WeekEditorState());
							case 'Menu Character Editor':
								MusicBeatState.switchState(new MenuCharacterEditorState());
							case 'Dialogue Portrait Editor':
								LoadingState.loadAndSwitchState(new DialogueCharacterEditorState(), false);
							case 'Dialogue Editor':
								LoadingState.loadAndSwitchState(new DialogueEditorState(), false);
						}
					//	FlxG.sound.music.volume = 0;
						FreeplayState.destroyFreeplayVocals();
					});
			}
		}
		
		var bullShit:Int = 0;
		for (item in grpTexts.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('menus/base/scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;
	}
}