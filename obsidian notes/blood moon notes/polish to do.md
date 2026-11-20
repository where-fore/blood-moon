
# cool stuff
- attack animation / damage numbers
	- probably have an attack animation, and if a new attack fires during the animation (very fast game speed and/or fast attack speed), queue it and hasten the current animation, probably?
- 
# code / bugs
- the lose-and-restart loop probably shouldn't reset fields on the combatant, it should probably delete it and start from a fresh PackedScene, because surely i'm going to apply temporary buffs or whatever that i don't want to have to manually account for clearing. the whole restart thing should be more robust
- `BasicEvents.send_basic_message.emit("Time Scale set to: ", GlobalSettings.combat_time_scale)` is probably not good formatting. i should have a send_basic_message() function, which calls the signal. having to access the signal properties correctly fails very easily (functions that expect parameters just break), so a function is better for everyone
# UI
- the 9 patch should probably be drawn at like 20x20 not 16x16, cause they usually used with a 2px inner border
- the big choices should be their own part of a window probably, currently it's one window with three buttons, would rather three windows stacked
- the 9 patch borders are black, the purple part isn't the final edging. i kinda like it, it gives a bit of a border.. wonder if that should be a 1px purple though? does it look weird? maybe it should be the same size as the border between the lines and the corner pieces?
![[Pasted image 20261118110221.png]]
looks great here, but could be a problem later when i'm not expecting it?
- 