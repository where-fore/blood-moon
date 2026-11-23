
- ~~1: ready: initalize combatants, combat is paused~~
- ~~2: press pause/unpause button~~
- ~~3: combat begins as before, turn timers tick down~~
- 4: when one dies, pause turn timers
- 5: loot, reset new enemy
- 6: new combat: keep damaged hp, reset turn timer
- back to step 4
- if player dies, instead of "loot": "rest". this resets combat for enemy and player, healing enemy to full or similar. dont want to kill/respawn enemy, but want it to recover?

combatant own died signal, not global. connect on setup of ui combatant, so it can play an animation or whatever
	red radially growing from center to cover?

thinking small and big windows for this stuff, small window to simply track and large window to fine tune? nothing to fine tune right now ofc but for later when you have builds and rewards and etc