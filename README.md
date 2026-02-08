0.4.2 Overhaul. A quality of life improvement of Psych Engine with proper organization.

If you want the older versions of the engine (or if you wanna use a more updated psych engine), be aware they are not being maintained:
* [**PE 0.6.3 (PFE 0.1)**](https://github.com/ClassicBoost/Psych-Forever/tree/0.6.3-Legacy) - Late 2022-2023
  * Usually the go to if you want a more modern Psych Engine. Though there are some issues.
* [**PE 0.7.1h (PFE 0.2)**](https://github.com/ClassicBoost/Psych-Forever/tree/0.7.1h-Legacy) - Late 2023
  * Originally this was suppose to be ported to more modern Psych Engine, but was discontinued quickly since of the changes that made it very difficult. Otherwise this might've been fully ported over to PE 1.0.
* [**PFE Legacy**](https://github.com/ClassicBoost/LEGACY-Psych-Forever-Engine) - Early/Mid 2022
  * Typically not the best to be used as the code is horrible, like REALLY horrible. The version btw is PE 0.5.2 to PE 0.6.2
  * Also this brings you to another github respository.
<!--I hate 2022 so much I wanna kms-->

# FNF - Psych Forever Engine
Engine was only created for my mods so why not release it here lol.

## Credits
### Main
* Classic1926 - Programmer
* [crowplexus](https://x.com/IamMorwen) - Maintainer of Forever Engine as of Late 2022. (I suppose)
* Yoshubs - Original Creator of Forever Engine
  * I do not support her, like seriously. She's a fucking creep.
* [Psych Engine](https://github.com/ShadowMario/FNF-PsychEngine) - The engine I forked over 2 years ago lol.
### Contributors
* Cehroaza - Loading BGs
* ytggobs - French Translation.
# Features
Everything from Psych Engine 0.4.2, as well with some features from 0.6.3

## Organization
* One of the main changes in the entire engine. A lot of folders (such as images and source) is now organized, making the entire game less of a mess
* **The data folder is also removed**. All of the songs code is moved into the songs folder. Characters, Stage Data, and Intro text is moved out of the data folder.
## Character Editor
* The characters can now support winning icons. (not required)
* The editor will now show the full icon instead of just the first frame.
* Editor is bit more updated towards newer Psych.
## Customizable Menu (W.I.P.)
* The menu options can be found in images/menus/MenuOptions.json
* Setting those to false will hide the option.
  * Setting all to false would instead revert to prevent a crash.
* You could also set a background for each menu as well with base font
## Visuals
* Winning icons. (not required)
* Opponent Note Splashes. (Can be disabled)
* Forever Engine UI (Judgements and Score Bar).
* Opponents can have note splashes (can be disabled).
* Revived Combo Text (basically the unused "Combo" graphic if you have at least 10 combo.)
* Top left will now show Version and what Modpack you are on. (Can be hidden)
* Pixel Note Splashes
* World Judgements are fixed to GF's speakers. (Some cases the judgement counter would just not be visible otherwise with custom stages)
  * Though using the "Fixed Judgements" setting can just be used instead.
## Others/Gameplay
* Translations (Currently there is English, Spanish, French, and Portugese)
  * Though I do want to softcode this soon.
* Menus moves a bit faster.
* Late Damage is in place (can be disabled).
* Anti-Mash can be turned off.
* Practice Mode no longer disables score.
* Forced Loading Screens (haha).
  * Also wanted to be softcoded to allow custom loading screens.
* Selecting an invalid difficulty or have a missing chart in freeplay no longer crashes.
* New score and health system.
* Mouse can be used almost anywhere.
* You can have a player and opponent vocal track. (not required)
* Many other crap
## Experimental/Planned
* Feature where the game automatically switches over to the modpack when you have it selected. (Such as different background and music)
* Updated Editors
* Some features from newer Psych, not all though.
* Disable Story Mode Checkpoints. (Basically, if you die you have to restart the whole week again)
