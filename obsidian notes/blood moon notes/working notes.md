
probably rewrite the system a bit: have a basic Combatant preset, and when the game restarts delete and repopulate. that way i don't have to deal with all the "starting health, max health, current health" shit, and when i add custom scripts they just die with the old combatant

probably make the special things components that tack on? they listen to their parents main triggers (turn start, attack attempt etc) and hook on?
	have a "triggered components" node that's a parent, and instantiate nodes under that with the class TriggerScript, and the parent has
			take_turn()
				for each trigger:TriggerScript in triggers_parent.get_assigned_triggers():

yoink the base code from lieutenant probably





















atb specific cool mechanics:
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
