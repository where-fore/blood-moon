
- ideally also have the xp submenu button only appear after you've gotten some xp?
- have the reward cost increase, exponentially perhaps



supply_changed.name returns the enum index, not the stringname
	probably change the autoload to "supplies", the enum to nameEnum, and the names dictionary to names? there's got to be an idiomatic way, look it up
		a static dictionary probably provides the autocomplete i want
		why the hell do enums exist



there's a bug in the combat window, you seem to be able to start combat during the death animation despite the button being greyed out. can reproduce by spamming the combat button during death animation, and can crash the game by increasing the combat time scale enough to make a hit land while there's no enemy spawned in yet
- fix the crash when landing a hit with no enemy - that's just unsafe, even if i fix the cause
- fix the button working sometimes when it's not supposed to
	- match the visuals with it working at least
also if you time scale up too fast, the death animation sorta breaks?