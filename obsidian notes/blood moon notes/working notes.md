- have a globals for buffs to stats
	- combatants if the player get buffs from that
	- probably on the "deal damage" frame recalculate stats? or it's really cheap, i can do it every frame? can also just listen for the signal of course
		- want it to update with the ui, so probably just hook onto that, not every frame
- pressing the button on the submenu changes the globals, and it Works tm
- ideally also have the xp submenu button only appear after you've gotten some xp?



button functionality:
- if supply meets cost, apply effect
	- button does its thing
		- not sure how this gets defined. currently the unlockdata is a resource with @export functions. it sounds like i want these to be scripts like lieutenant? since unlocks will have to have custom scripts attached. or at least a custom script field, unlock_script - some unlocks will be basic stats, some with custom scripts? and unlock data calls certain functions on the script, if present?
			- can have unlockscript class which does stuff, and unlockdata has an @export array for that, and then if there's anything in the array it slaps through them?


global buff_manager
 - has a dictionary of stats (and scripts)
 - whenever a combatant who istheplayer takes its turn, it checks against the global buff_manager for triggers
 - whenever the buff_manager updates its dictionary, it pushes it to all combatant who are tagged istheplayer?
 i feel like i should have a global player_combatant instead?
 - oh no no because i want multiple combatants, and the global buff to be "all fighters have +10 attack"
 - well sorta, i also want the player to have their own perks and stuff, but that is separate from this system? is it?
 - okay so there's a difference between "all fighters have +10 attack" and "you have +10 attack", but what is it? do "you" fight? do "fighters" use the same stats? is your combat different from theirs?
okay so i don't know what else i want, so for now ill just do basic "all fighters have +10 attack"?

okay so thinking globaleffects
- has a stat dictionary additive, and multiplicative
	- when changed, push update to combatants
	- combatants hear, check if controlledbyplayer, if so, recalculate stats
- when a combatant controlledbyplayer flag is set, recalc stats from global effects



supply_changed.name returns the enum index, not the stringname
	probably change the autoload to "supplies", the enum to nameEnum, and the names dictionary to names? there's got to be an idiomatic way, look it up
		a static dictionary probably provides the autocomplete i want
		why the hell do enums exist