extends Node

@warning_ignore_start("unused_signal")
signal turn_ready(combatant:Combatant)
signal turn_complete(combatant:Combatant)
signal ui_update()
signal start_combat()
signal swap_to_reward_screen()
signal swap_to_combat_screen()
signal send_basic_message(message:String)
signal ready_to_spawn_new_enemy()
signal supply_add(supply:Supply, change:int)
signal supply_remove(supply:Supply, change:int)
@warning_ignore_restore("unused_signal")
