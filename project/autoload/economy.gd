extends Node

var supplies:Dictionary[Supply, int]

func _ready() -> void:
	BasicEvents.supply_add.connect(add_supply)
	BasicEvents.supply_remove.connect(remove_supply)

func get_amount(supply_type:Supply) -> int:
	if not supplies.has(supply_type):
		return 0
	
	return supplies[supply_type]

func can_afford(supply_type:Supply, amount:int) -> bool:
	if supplies[supply_type] >= amount:
		return true
	else:
		return false

func add_supply(supply_changed:Supply, change:int) -> void:
	if change <= 0:
		print_stack()
		push_error("tried to add to supply a non-positive integer: ", change, " ", supply_changed.name)
		return
	
	if supply_changed in supplies:
		supplies[supply_changed] += change
	else:
		supplies[supply_changed] = change
	
	UiEvents.supply_updated.emit(supply_changed)

func remove_supply(supply_changed:Supply, change:int) -> void:
	if change <= 0:
		print_stack()
		push_error("tried to remove supply a non-positive integer: ", change, " ", supply_changed.name)
		return
	
	if supply_changed not in supplies:
		print_stack()
		push_error("tried to remove supply that hadn't even been tracked yet: ", change, " ", supply_changed.name)
		return
	
	if supplies[supply_changed] < change:
		print_stack()
		push_error("tried to remove from supply more than is available: ", change, " ", supply_changed.name)
		return
	
	supplies[supply_changed] -= change
	
	UiEvents.supply_updated.emit(supply_changed)
