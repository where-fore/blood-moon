
- get a ui mockup in, and make sure it all looks good and scalable
	- side bars with icons
	- mouseover tooltip with readable text for that side bar icon
	- central combat screen
	- a nice font that works with a tooltip

- try out slot-ATB combat
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