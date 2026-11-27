- have second ui button thing open a submenu to spend them
- have this spending permanently increase your attack/speed/health


- have a globals for buffs to stats
	- combatants if the player get buffs from that
	- probably on the "deal damage" frame recalculate stats? or it's really cheap, i can do it every frame? can also just listen for the signal of course
- pressing the button on the submenu changes the globals, and it Works tm
- ideally also have the xp submenu button only appear after you've gotten some xp?



button functionality:
- if supply meets cost, apply effect
	- button does its thing
		- not sure how this gets defined. currently the unlockdata is a resource with @export functions. it sounds like i want these to be scripts like lieutenant? since unlocks will have to have custom scripts attached. or at least a custom script field, unlock_script - some unlocks will be basic stats, some with custom scripts? and unlock data calls certain functions on the script, if present?



supply_changed.name returns the enum index, not the stringname