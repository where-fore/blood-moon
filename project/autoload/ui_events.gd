extends Node

@warning_ignore_start("unused_signal")
signal combatant_ui_update(combatant:Combatant)
signal new_player_combatant(combatant:Combatant)
signal new_enemy_combatant(combatant:Combatant)
signal death_animation_finished()
signal supply_updated(supply:Supply)
@warning_ignore_restore("unused_signal")
