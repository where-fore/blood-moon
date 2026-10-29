
- attack animation / damage numbers
	- probably have an attack animation, and if a new attack fires during the animation (very fast game speed and/or fast attack speed), queue it and hasten the current animation, probably?
- the lose-and-restart loop probably should reset fields on the combatant, it should probably delete it and start from a fresh PackedScene, because surely i'm going to apply temporary buffs or whatever that i don't want to have to manually account for clearing. the whole restart thing should be more robust
# UI
- the 9 patch should probably be drawn at like 20x20 not 16x16, cause they usually used with a 2px inner border