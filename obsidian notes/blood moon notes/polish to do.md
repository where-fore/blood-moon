
# cool stuff
- attack animation / damage numbers
	- probably have an attack animation, and if a new attack fires during the animation (very fast game speed and/or fast attack speed), queue it and hasten the current animation, probably?
- combat rewards: have enemies give different rewards based on how you kill them?
	- killing a skeleton with slashing/piercing gives you literal bones you can work with, but bludgeoning gives you splinters which are worth more gold or something?
	- if you kill enemies while they are stunned, you get more rewards?
	- if you kill enemies above 50% hp you get more rewards (mix with a vampirism ability)?
	- a perk tree for rewards for combat, or maybe different rewards per enemy? both?
- combat interactivity: have daily consumables or other cooldown based buttons, which reward you for activating them at a certain time.
	- eg. 2 healing potions per day which restore to full, so you want to time them within the autocombat to heal the most.
	- or 2x attack speed potion, and your character has chances to enrage, so you want to stack those
# code / bugs
- combatants in content are saved as scenes, they should be resources. a combatantdata resource that the combatant reads some initialization data from, all the current @exports
## export variable validation
having to create custom checks for every @export is so bad, i want a simple drag&drop where i get an error for something that has an @export that isn't defined on runtime
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
- the top resource bar shifts size when first adding a resource tracker
	- currently it's set to a manual pixel minimum size
	- not sure how else to do this. it clears placeholders, so i could manually mess around with placeholders, but if i change the placeholder size later in development the minimum size won't update
	- a code check to make the minimum size it's current size, before clearing?
- the 9 patch should probably be drawn at like 20x20 not 16x16, cause they usually used with a 2px inner border
- the big choices should be their own part of a window probably, currently it's one window with three buttons, would rather three windows stacked
- the 9 patch borders are black, the purple part isn't the final edging. i kinda like it, it gives a bit of a border.. wonder if that should be a 1px purple though? does it look weird? maybe it should be the same size as the border between the lines and the corner pieces?
![[Pasted image 20261118110221.png]]
looks great here, but could be a problem later when i'm not expecting it?

## nice tooltip
https://docs.godotengine.org/en/stable/classes/class_control.html#class-control-private-method-make-custom-tooltip

seems like i have to override this on every control i want a custom tooltip for, if i want basic text

i actually may want to fully override though, and have every control with:
mouse_entered() -> void:
	tooltipmanager.show(global_position, my_tooltip_data_object)


so i can do a quick stylebox for tooltip, or i can do the full manager
seems like for a ui mockup i can validate the font size with just a stylebox? the actual border changing colours etc is nice but should function identically resolution-wise, so it comes later