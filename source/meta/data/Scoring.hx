package meta.data;
import flixel.FlxG;

class Scoring
{
    public var fcRating:String = '';

    public static var ratingStuff:Array<Dynamic> = [
		['You Suck!', 0.2],
		['F', 0.7],
		['E', 0.75],
		['D', 0.8],
		['C', 0.85],
		['B', 0.9],
		['A', 0.95],
		['S', 1],
		['S+', 1]
	];

    public static function updateRating(sick:Int, good:Int, bad:Int, shit:Int, miss:Int) {

		fcRating = '';
		if (sick > 0) fcRating = ' [SFC]';
		if (good > 0) fcRating = ' [GFC]';
		if (bads> 0) fcRating = ' [FC]';
		if (shit > 0) fcRating = ' [FC-]';
		if (miss > 0) fcRating = '';
    }

    var divider = ' • ';
    public static function loadScore(score:Int, accuracy:Float, misses:Int, rank:String) {
        return 'Score: $score ${(ClientPrefs.displayAccuracy ? '${divider}Accuracy: $accuracy$fcRating${divider}Misses: $misses${divider}Rank: $rank': '')}';
    }
}