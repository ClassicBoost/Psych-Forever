0.4.2 Overhaul. A quality of life improvement of Psych Engine with proper organization.

If you want the older versions:<br>
[For 0.6.3](https://github.com/ClassicBoost/Psych-Forever/tree/0.6.3-Legacy)<br>
[For 0.7.1h](https://github.com/ClassicBoost/Psych-Forever/tree/0.7.1h-Legacy)<br>

# FNF - Psych Forever Engine
Engine was only created for my mods so why not release it here lol.

## Credits
* Classic1926 - Programmer
* Yoshubs - Creator of Forever Engine (I do not support her)
* [Psych Engine](https://github.com/ShadowMario/FNF-PsychEngine) - The engine I forked over 2 years ago lol.

# Features
Everything from Psych Engine 0.4.2, as well with some features from 0.6.3

## Organization
* One of the main changes in the entire engine. The images folder is now organized, making the entire image folder less of a mess
  * Currently, the source folder is getting organized as well.
* **The data folder is also removed**. All of the songs code is moved into the songs folder. Characters, Stage Data, and Intro text is moved out of the data folder.
## Character Editor
* The characters can now support winning icons by changing their icon steps.
* The editor will now show the full icon instead of just the first frame.
* Editor is bit more updated towards newer Psych.
## Customizable Menu*
* The menu options can be found in images/menus/MenuOptions.json
* Setting those to false will hide the option.
  * Setting all to false would instead revert to prevent a crash.
* You could also set a background for each menu as well with base font
## Visuals
* Winning icons.
* Opponent Note Splashes. (Can be disabled)
* Forever Engine UI (Judgements and Score Bar).
* Opponents can have note splashes (can be disabled).
* Revived Combo Text
* Top left will now show Version and what Modpack you are on. (Can be hidden)
## Others/Gameplay
* Menus moves a bit faster.
* Late Damage is in place (can be disabled).
* Anti-Mash can be turned off.
* Practice Mode no longer disables score.
* Forced Loading Screens (haha).
* Selecting an invalid difficulty or have a missing chart in freeplay no longer crashes.
* New score and health system.
  * Max score for every song is 100000. (More notes will give the player less score on note hit)
## Experimental
* Right now, I am planning on adding a feature where the game automatically switches over to the modpack when you have it selected. (Such as different background and music)
* Updated Editors
  * Icon steps (Character editor icon steps is a bit buggy)
* Some features from newer Psych, not all though.
