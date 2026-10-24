extends Node

@warning_ignore_start("unused_signal")
signal turn_ready(combatant:Combatant)
signal turn_complete(combatant:Combatant)
signal ui_update()
signal combatant_died(combatant_who_died:Combatant)
signal start_combat()
@warning_ignore_restore("unused_signal")
