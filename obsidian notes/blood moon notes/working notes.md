- have second ui button thing open a submenu to spend them
- have this spending permanently increase your attack/speed/health


- make the submenu
	- long button, mostly description, with purchase button on the side
		- purchase button greyed out if not enough resources
- have a globals for buffs to stats
	- combatants if the player get buffs from that
	- probably on the "deal damage" frame recalculate stats? or it's really cheap, i can do it every frame? can also just listen for the signal of course
- pressing the button on the submenu changes the globals, and it Works tm
- ideally also have the xp submenu button only appear after you've gotten some xp?


upgrade buttons
- menu simply holds button objects
- button objects read from buttonData which has their stat, cost, description (later cost scaling and maximums and etc)
- button objects grab that data and use them, fills out the cost/desc labels and etc
	- listens to supply updates and activates/deactivates button
- menu creates button objects and assigns them buttonData, i suppose through an array of @export buttonData's?