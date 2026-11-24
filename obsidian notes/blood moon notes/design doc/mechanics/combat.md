[[mechanics overview]]

start idle-iktah like. basic attack & attack speed vs enemy hp.


# active buttons
to add some texture and strategy - have some cooldown gated powers which help the current action, and provide the player with multiple simultaneous actions. combat, with a 15s cd auto-kill; while also mining with a 10s cd extra ore for 3s buff. both can be minmaxed to be cast at specific times, the auto kill you may want to wait 2s for the next fresh mob or maybe that 2s isn't worth the uptime - the ore you want it to clip two nodes to get double the benefit

but your attention isn't always possible to stretch there? just a neat lil minigame?
## auras

- items/auras with custom effects, as detailed below. stunned when hit but extra attack, stun enemy for first few seconds, buff that lasts a few seconds, crit chance, procs on crit, etc.
	- items are just convenient ways to apply and remove auras - the only way they are different from auras is that they can be removed and remove their consequent aura. right now i don't need removal, and it's easy to tack on after, so auras first
- statuses, things like stunned or slowed or weak or vulnerable
	- these are a subset of auras, they have the same properties they are just prepackaged and exclusive? vulnerable while vulnerable just extends it, or overwrites it?

okay so i just need auras. i want to implement
- when picked, passive stat buff permanently
- when picked, big buff for next 3 combats
- when picked, start combats with 3s of extra power
all of which explode on death
# atb combat brain dump
## abilities to try
- You start by ambushing the enemy, they wait 1,2,3,4 seconds at start of combat (per rank)
- Every time you attack, gain x% attack speed
- Every 4th attack, stun the enemy
- Triple your attack, but when hit, reset/setback your attack timer.
- half attack speed, triple damage
- poise system where certain amounts of damage at once stuns (poe heavy strike)
- enemies wait for x seconds, then enrage
	- have execute abilities you can pick too, missing health damage or extra under threshold
- health regen coupled to time, or damage vamp
- basic % or flat bonuses work with varied attack speed
- buffs that last specific amounts of time, which mean you want to match your attack speed to buff length (debuffs too to their attack speed). which means things that modify attack speed or buff duration on the fly, interact with this
## how to calculate "time"
- literal real delta time. every frame calculate the time, remove it from the timer, if <0 then fire
- autonomous turn based with tiny turns which are mostly nothing: fire a turn for each side, then start a 0.1s dead air wait time and remove 0.1s from each sides timer. when it's your turn, if timer <0s, then do something.
	- when firing the turns, probably signal start_turn and await finished_turn
		my worries for real time are for sync - if im 0.1s from attacking (which would kill my enemy) and my enemy is 0.2s from attacking (and killing me), i should always win. but if my frame takes 0.3s to draw, then both turns will go simultaneously since they'll both be below 0 when checked. obviously i can calculate one side, and fire a combat_stop signal when someone wins, so the second side doesn't get to go since combat_stopped=true, but these sort of unforeseen issues worry me
		
	- the turn based makes more sense to me. i assume it's a performance concern, signaling back and forth every 0.1 seconds instead of the combatant signaling when it's their turn, but surely that's completely meaningless performance.
		- hm i think both are actually the same - and instead of checking player first then enemy, i should check who has the lowest cooldown and send that: -0.2 fires before -0.1s.
		- if the idea is to add frame delta time into a sum of elapsed time, and resetting when elapsed time > cooldown, make sure to include the overage. otherwise the real time will slowly drift, especially at high speeds and/or low frame rates. instead of clamping the values and resetting to 0, keep the full true value, and subtract the cooldown from it - and while loop it if still above cooldown. note that exceptionally high speeds/low framerates will influence game **logic**