extends Node


var supply_trackers:Array[SupplyTracker]
@export var supply_tracker_base_scene:PackedScene
@export var home_for_supply_trackers:Control
	#later this will also have home_for_skulls_tracker, and one for each supply
	#to track them in their individual ui's, not just the top/side/bottom whatever bar
	#but for now they all live in the top bar together

func _ready() -> void:
	Toolbox.clear_placeholder_ui_objects(home_for_supply_trackers)
	UiEvents.supply_updated.connect(update_tracker_for)

func update_tracker_for(supply_changed:Supply) -> void:
	if not check_if_already_tracking(supply_changed):
		create_new_tracker(supply_changed)
	
	for tracker:SupplyTracker in supply_trackers:
		if tracker.supply_tracking == supply_changed:
			tracker.update_ui()

func check_if_already_tracking(supply_to_check:Supply) -> bool:
	for tracker:SupplyTracker in supply_trackers:
		if tracker.supply_tracking == supply_to_check:
			return true
	return false

func create_new_tracker(supply_to_track:Supply) -> void:
	var new_tracker:SupplyTracker = supply_tracker_base_scene.instantiate()
	new_tracker.setup(supply_to_track)
	home_for_supply_trackers.add_child(new_tracker)
	supply_trackers.append(new_tracker)
