
# cool stuff
- attack animation / damage numbers
	- probably have an attack animation, and if a new attack fires during the animation (very fast game speed and/or fast attack speed), queue it and hasten the current animation, probably?
- 
# code / bugs
## global emit vs function
`BasicEvents.send_basic_message.emit("Time Scale set to: ", GlobalSettings.combat_time_scale)`
is probably not good formatting. i should have a send_basic_message() function, which calls the signal. having to access the signal properties correctly fails very easily (functions that expect parameters just break), so a function that can ask for arguments in tooltip is better for everyone
## a nice combatant - ui update pipeline
- have a "tracked by ui stat" class, which is basically just an int/float that has a getter/setter in it that sends the ui signal with the parent combatant. health = Stat.new(50, self) in combatant
	- this is cool, can also do this for things like export variables that auto fire errors
	- also works well for non-combatants, something like a weapon knows what stats it can draw from
- have a global list of stat stringnames, and then each combatant makes a dictionary of
	- each stat, and has their own function stats.get(name, 0), which returns the stat and signals the ui
	- make sure there's a boilerplate for a ui object that listens to these updates
# UI
- the 9 patch should probably be drawn at like 20x20 not 16x16, cause they usually used with a 2px inner border
- the big choices should be their own part of a window probably, currently it's one window with three buttons, would rather three windows stacked
- the 9 patch borders are black, the purple part isn't the final edging. i kinda like it, it gives a bit of a border.. wonder if that should be a 1px purple though? does it look weird? maybe it should be the same size as the border between the lines and the corner pieces?
![[Pasted image 20261118110221.png]]
looks great here, but could be a problem later when i'm not expecting it?
- 