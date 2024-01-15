package;

import flixel.FlxG;
import flixel.util.FlxSave;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

class ClientPrefs {
	//TO DO: Redo ClientPrefs in a way that isn't too stupid
	public static var downScroll:Bool = false;
	public static var middleScroll:Bool = false;
	public static var showFPS:Bool = true;
	public static var showMemory:Bool = true;
	public static var showVersion:Bool = true;
	public static var showMod:Bool = true;
	public static var flashing:Bool = true;
	public static var globalAntialiasing:Bool = true;
	public static var noteSplashes:Bool = true;
	public static var lowQuality:Bool = false;
	public static var framerate:Int = 120;
	public static var cursing:Bool = true;
	public static var violence:Bool = true;
	public static var camZooms:Bool = true;
	public static var hideHud:Bool = false;
	public static var noteOffset:Int = 0;
	public static var arrowHSV:Array<Array<Int>> = [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]];
	public static var imagesPersist:Bool = false;
	public static var ghostTapping:Bool = true;
	public static var antiMash:Bool = true;
	public static var hideTime:Bool = false;
	public static var opponentSplashes:Bool = true;
	public static var displayAccuracy:Bool = true;
	public static var fixedJudgements:Bool = false;
	public static var lateDamage:Bool = true;
	public static var judgementCounter:Bool = true;

	// EXPERIMENTAL!!!
	public static var loadModMenu:Bool = false;
	public static var newEditors:Bool = false;
	public static var newGameplay:Bool = false;

	public static var defaultKeys:Array<FlxKey> = [
		A, LEFT,			//Note Left
		S, DOWN,			//Note Down
		W, UP,				//Note Up
		D, RIGHT,			//Note Right

		A, LEFT,			//UI Left
		S, DOWN,			//UI Down
		W, UP,				//UI Up
		D, RIGHT,			//UI Right

		R, NONE,			//Reset
		SPACE, ENTER,		//Accept
		BACKSPACE, ESCAPE,	//Back
		ENTER, ESCAPE,		//Pause

		SEVEN, NONE,		//Chart Editor
		EIGHT, NONE,		//Character Editor
		SIX, NONE,			//Botplay Toggle
		FIVE, NONE			//Practice Mode
	];
	//Every key has two binds, these binds are defined on defaultKeys! If you want your control to be changeable, you have to add it on ControlsSubState (inside OptionsState)'s list
	public static var keyBinds:Array<Dynamic> = [
		//Key Bind, Name for ControlsSubState
		[Control.NOTE_LEFT, 'Left'],
		[Control.NOTE_DOWN, 'Down'],
		[Control.NOTE_UP, 'Up'],
		[Control.NOTE_RIGHT, 'Right'],

		[Control.UI_LEFT, 'Left '],		//Added a space for not conflicting on ControlsSubState
		[Control.UI_DOWN, 'Down '],		//Added a space for not conflicting on ControlsSubState
		[Control.UI_UP, 'Up '],			//Added a space for not conflicting on ControlsSubState
		[Control.UI_RIGHT, 'Right '],	//Added a space for not conflicting on ControlsSubState

		[Control.RESET, 'Reset'],
		[Control.ACCEPT, 'Accept'],
		[Control.BACK, 'Back'],
		[Control.PAUSE, 'Pause'],

		[Control.CHART, 'Chart'],
		[Control.CHAR, 'Character'],
		[Control.BOTPLAY, 'Botplay'],
		[Control.PRACTICE, 'Practice']
	];
	public static var lastControls:Array<FlxKey> = defaultKeys.copy();

	public static function saveSettings() {
		FlxG.save.data.downScroll = downScroll;
		FlxG.save.data.middleScroll = middleScroll;
		FlxG.save.data.showFPS = showFPS;
		FlxG.save.data.showMemory = showMemory;
		FlxG.save.data.showVersion = showVersion;
		FlxG.save.data.showMod = showMod;
		FlxG.save.data.flashing = flashing;
		FlxG.save.data.globalAntialiasing = globalAntialiasing;
		FlxG.save.data.noteSplashes = noteSplashes;
		FlxG.save.data.lowQuality = lowQuality;
		FlxG.save.data.framerate = framerate;
		FlxG.save.data.cursing = cursing;
		FlxG.save.data.violence = violence;
		FlxG.save.data.camZooms = camZooms;
		FlxG.save.data.noteOffset = noteOffset;
		FlxG.save.data.hideHud = hideHud;
		FlxG.save.data.arrowHSV = arrowHSV;
		FlxG.save.data.imagesPersist = imagesPersist;
		FlxG.save.data.ghostTapping = ghostTapping;
		FlxG.save.data.antiMash = antiMash;
		FlxG.save.data.hideTime = hideTime;
		FlxG.save.data.opponentSplashes = opponentSplashes;
		FlxG.save.data.displayAccuracy = displayAccuracy;
		FlxG.save.data.fixedJudgements = fixedJudgements;
		FlxG.save.data.lateDamage = lateDamage;
		FlxG.save.data.judgementCounter = judgementCounter;
		FlxG.save.data.newGameplay = newGameplay;

		FlxG.save.data.loadModMenu = loadModMenu;
		FlxG.save.data.newEditors = newEditors;

		var achieves:Array<String> = [];
		for (i in 0...Achievements.achievementsUnlocked.length) {
			if(Achievements.achievementsUnlocked[i][1]) {
				achieves.push(Achievements.achievementsUnlocked[i][0]);
			}
		}
		FlxG.save.data.achievementsUnlocked = achieves;
		FlxG.save.data.henchmenDeath = Achievements.henchmenDeath;
		FlxG.save.flush();

		var save:FlxSave = new FlxSave();
		save.bind('controls', 'ninjamuffin99'); //Placing this in a separate save so that it can be manually deleted without removing your Score and stuff
		save.data.customControls = lastControls;
		save.flush();
		FlxG.log.add("Settings saved!");
	}

	public static function loadPrefs() {
		if(FlxG.save.data.downScroll != null) downScroll = FlxG.save.data.downScroll;
		if(FlxG.save.data.middleScroll != null)	middleScroll = FlxG.save.data.middleScroll;
		if(FlxG.save.data.showFPS != null) showFPS = FlxG.save.data.showFPS;
		if(FlxG.save.data.showMemory != null) showMemory = FlxG.save.data.showMemory;
		if(FlxG.save.data.showVersion != null) showVersion = FlxG.save.data.showVersion;
		if(FlxG.save.data.showMemory != null) showMemory = FlxG.save.data.showMemory;
		if(FlxG.save.data.flashing != null)	flashing = FlxG.save.data.flashing;
		if(FlxG.save.data.globalAntialiasing != null) globalAntialiasing = FlxG.save.data.globalAntialiasing;
		if(FlxG.save.data.noteSplashes != null)	noteSplashes = FlxG.save.data.noteSplashes;
		if(FlxG.save.data.lowQuality != null) lowQuality = FlxG.save.data.lowQuality;
		if(FlxG.save.data.framerate != null) {
			framerate = FlxG.save.data.framerate;
			if(framerate > FlxG.drawFramerate) {
				FlxG.updateFramerate = framerate;
				FlxG.drawFramerate = framerate;
			} else {
				FlxG.drawFramerate = framerate;
				FlxG.updateFramerate = framerate;
			}
		}
		/*if(FlxG.save.data.cursing != null) cursing = FlxG.save.data.cursing;
		if(FlxG.save.data.violence != null)	violence = FlxG.save.data.violence;*/
		if(FlxG.save.data.camZooms != null)	camZooms = FlxG.save.data.camZooms;
		if(FlxG.save.data.hideHud != null) hideHud = FlxG.save.data.hideHud;
		if(FlxG.save.data.noteOffset != null) noteOffset = FlxG.save.data.noteOffset;
		if(FlxG.save.data.arrowHSV != null) arrowHSV = FlxG.save.data.arrowHSV;
		if(FlxG.save.data.opponentSplashes != null) opponentSplashes = FlxG.save.data.opponentSplashes;
		if(FlxG.save.data.displayAccuracy != null) displayAccuracy = FlxG.save.data.displayAccuracy;
		if(FlxG.save.data.fixedJudgements != null) fixedJudgements = FlxG.save.data.fixedJudgements;
		if(FlxG.save.data.imagesPersist != null) {
			imagesPersist = FlxG.save.data.imagesPersist;
			FlxGraphic.defaultPersist = ClientPrefs.imagesPersist;
		}
		if(FlxG.save.data.ghostTapping != null) ghostTapping = FlxG.save.data.ghostTapping;
		if(FlxG.save.data.antiMash != null)	antiMash = FlxG.save.data.antiMash;
		if(FlxG.save.data.hideTime != null)	hideTime = FlxG.save.data.hideTime;
		if(FlxG.save.data.lateDamage != null) lateDamage = FlxG.save.data.lateDamage;
		if(FlxG.save.data.judgementCounter != null) judgementCounter = FlxG.save.data.judgementCounter;

		if(FlxG.save.data.loadModMenu != null) loadModMenu = FlxG.save.data.loadModMenu;
		if(FlxG.save.data.newEditors != null) newEditors = FlxG.save.data.newEditors;
		if(FlxG.save.data.newGameplay != null) newGameplay = FlxG.save.data.newGameplay;

		// flixel automatically saves your volume!
		if(FlxG.save.data.volume != null) FlxG.sound.volume = FlxG.save.data.volume;
		if (FlxG.save.data.mute != null) FlxG.sound.muted = FlxG.save.data.mute;

		var save:FlxSave = new FlxSave();
		save.bind('controls', 'ninjamuffin99');
		if(save != null && save.data.customControls != null) {
			reloadControls(save.data.customControls);
		}
	}

	public static function reloadControls(newKeys:Array<FlxKey>) {
		ClientPrefs.removeControls(ClientPrefs.lastControls);
		ClientPrefs.lastControls = newKeys.copy();
		ClientPrefs.loadControls(ClientPrefs.lastControls);
	}

	private static function removeControls(controlArray:Array<FlxKey>) {
		for (i in 0...keyBinds.length) {
			var controlValue:Int = i*2;
			var controlsToRemove:Array<FlxKey> = [];
			for (j in 0...2) {
				if(controlArray[controlValue+j] != NONE) {
					controlsToRemove.push(controlArray[controlValue+j]);
				}
			}
			if(controlsToRemove.length > 0) {
				PlayerSettings.player1.controls.unbindKeys(keyBinds[i][0], controlsToRemove);
			}
		}
	}
	private static function loadControls(controlArray:Array<FlxKey>) {
		for (i in 0...keyBinds.length) {
			var controlValue:Int = i*2;
			var controlsToAdd:Array<FlxKey> = [];
			for (j in 0...2) {
				if(controlArray[controlValue+j] != NONE) {
					controlsToAdd.push(controlArray[controlValue+j]);
				}
			}
			if(controlsToAdd.length > 0) {
				PlayerSettings.player1.controls.bindKeys(keyBinds[i][0], controlsToAdd);
			}
		}
	}
}