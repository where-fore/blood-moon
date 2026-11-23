extends Node

@warning_ignore_start("unused_signal")
signal turn_ready(combatant:Combatant)
signal turn_complete(combatant:Combatant)
signal ui_update()
signal start_combat()
signal reward_chosen(reward:Reward)
signal swap_to_reward_screen()
signal swap_to_combat_screen()
signal send_basic_message(message:String)
@warning_ignore_restore("unused_signal")
