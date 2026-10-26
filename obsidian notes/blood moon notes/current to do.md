
- get a ui mockup in with working fonts at resolution
	- side bars with icons
	- mouseover tooltip with readable text for that side bar icon
	- central combat screen
	- a nice font that works with a tooltip
	this doesn't need to be perfect, i don't even know what the game will be, but i want to settle on a resolution that works with fonts and rescaling before making anything further - have them in their viewports or whatever is actually necessary

- try out slot-ATB combat
	- basically remake the original endless combat (poorly coded) with atb combat. try fast and loose prototyping
		- no inventory, just +stat button choices which modify character
		- fight - when someone loses, either end game and restart, or get +stat choice
		- fight randomly stronger enemy (+5-15% power?)

	- start out with just dagger (fast hit), sledgehammer (slow hit)
		- later of course middle grounds, double hit items, magic that pierces armor, one hander & shield for defensives, bow for 2 turns free at start of combat, etc
	- items that give flat or percentage damage, defensives
		- limited charges per fight (first 3 hits do double)?
	- two ATB approaches:
		- literal real delta time. every frame calculate the time, remove it from the timer, if <0 then fire
		- autonomous turn based with tiny turns which are mostly nothing: fire a turn for each side, then start a 0.1s dead air wait time and remove 0.1s from each sides timer. when it's your turn, if timer <0s, then do something.
			- when firing the turns, probably signal start_turn and await finished_turn
		my worries for real time are for sync - if im 0.1s from attacking (which would kill my enemy) and my enemy is 0.2s from attacking (and killing me), i should always win. but if my frame takes 0.3s to draw, then both turns will go simultaneously since they'll both be below 0 when checked. obviously i can calculate one side, and fire a combat_stop signal when someone wins, so the second side doesn't get to go since combat_stopped=true, but these sort of unforeseen issues worry me
		the turn based makes more sense to me. i assume it's a performance concern, signaling back and forth every 0.1 seconds instead of the combatant signaling when it's their turn, but surely that's completely meaningless performance.
		hm i think both are actually the same - and instead of checking player first then enemy, i should check who has the lowest cooldown and send that: -0.2 fires before -0.1s.
		- if the idea is to add frame delta time into a sum of elapsed time, and resetting when elapsed time > cooldown, make sure to include the overage. otherwise the real time will slowly drift, especially at high speeds and/or low frame rates. instead of clamping the values and resetting to 0, keep the full true value, and subtract the cooldown from it - and while loop it if still above cooldown. note that exceptionally high speeds/low framerates will influence game logic

- setup a nice combatant - ui update pipeline
	- have a "tracked by ui stat" class, which is basically just an int/float that has a getter/setter in it that sends the ui signal with the parent combatant. health = Stat.new(50, self) in combatant
		- this is cool, can also do this for things like export variables that auto fire errors
		- also works well for non-combatants, something like a weapon knows what stats it can draw from
	- have a global list of stat stringnames, and then each combatant makes a dictionary of each stat, and has their own function stats.get(name, 0), which returns the stat and signals the ui
	- make sure there's a boilerplate for a ui object that listens to these updates