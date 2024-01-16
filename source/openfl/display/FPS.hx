package openfl.display;

import haxe.Timer;
import openfl.events.Event;
import openfl.text.TextField;
import openfl.text.TextFormat;
#if gl_stats
import openfl.display._internal.stats.Context3DStats;
import openfl.display._internal.stats.DrawCallContext;
#end
#if flash
import openfl.Lib;
#end

#if openfl
import openfl.system.System;
#end

/**
	The FPS class provides an easy-to-use monitor to display
	the current frame rate of an OpenFL project
**/
#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
class FPS extends TextField
{
	/**
		The current frame rate, expressed using frames-per-second
	**/
	var times:Array<Float> = [];
	var memPeak:UInt = 0;
	public var currentFPS(default, null):Int;

	@:noCompletion private var cacheCount:Int;
	@:noCompletion private var currentTime:Float;

	public function new(x:Float = 10, y:Float = 10, color:Int = 0x000000)
	{
		super();

		this.x = x;
		this.y = y;

		currentFPS = 0;
		selectable = false;
		mouseEnabled = false;
		autoSize = LEFT;
		multiline = true;
		text = "FPS: ";

		cacheCount = 0;
		currentTime = 0;
		times = [];

		#if flash
		addEventListener(Event.ENTER_FRAME, function(e)
		{
			var time = Lib.getTimer();
			__enterFrame(time - currentTime);
		});
		#end
	}

	static final intervalArray:Array<String> = ['B', 'KB', 'MB', 'GB', 'TB'];

	public static function getInterval(num:UInt):String
	{
		var size:Float = num;
		var data = 0;
		while (size > 1024 && data < intervalArray.length - 1)
		{
			data++;
			size = size / 1024;
		}

		size = Math.round(size * 100) / 100;
		return size + " " + intervalArray[data];
	}

	// Event Handlers
	@:noCompletion

	var displayMod:String = '';
	var experimentalFeatures:Bool = false;
	private #if !flash override #end function __enterFrame(deltaTime:Float):Void
	{
	
		if (ClientPrefs.loadModMenu || ClientPrefs.newEditors) experimentalFeatures = true;
		else experimentalFeatures = false;

		var now:Float = Timer.stamp();
		times.push(now);
		while (times[0] < now - 1)
			times.shift();

		var mem = System.totalMemory;
		if (mem > memPeak)
			memPeak = mem;

		while (times[0] < currentTime - 1000)
		{
			times.shift();
		}

		text = ''; // quick reset
		if (ClientPrefs.showFPS) text += times.length + ' FPS\n';
		var memoryMegas:Float = 0;
			
		#if openfl
		if (ClientPrefs.showMemory) text += '${getInterval(mem)} / ${getInterval(memPeak)}\n';
		#end

		textColor = 0xFFFFFFFF;
		if (memoryMegas > 3000 || times.length <= 60) // there is kinda no reason why it should warn you if you have 50% of 240 FPS
		{
			textColor = 0xFFFF0000;
		}

		#if !html5
		defaultTextFormat = new TextFormat(Paths.font('vcr.ttf'), 18, textColor);
		#else
		defaultTextFormat = new TextFormat('VCR OSD Mono', 18, textColor);
		#end

		#if (gl_stats && !disable_cffi && (!html5 || !canvas))
		text += "\ntotalDC: " + Context3DStats.totalDrawCalls();
		text += "\nstageDC: " + Context3DStats.contextDrawCalls(DrawCallContext.STAGE);
		text += "\nstage3DDC: " + Context3DStats.contextDrawCalls(DrawCallContext.STAGE3D);
		#end
	//	if (ClientPrefs.data.showDebug) text += MusicBeatState.mainClassState + '\n';
	//	if (ClientPrefs.data.showVersion) text += 'Psych Forever ${Main.foreverVersion}\n';

		displayMod = Paths.currentModDirectory;

		if (ClientPrefs.showVersion) text += 'Psych Forever v${Main.foreverVersion}\n';
		if (ClientPrefs.showMod) text += 'Mod: ${(displayMod == null || displayMod == '' ? 'Base Engine' : displayMod)}\n';
		if (experimentalFeatures) text += '!EXPERIMENTAL FEATURES ENABLED!';
		text += "\n";

	}
}
