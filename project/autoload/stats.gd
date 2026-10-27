extends Node

@warning_ignore_start("unused_signal")
@warning_ignore_restore("unused_signal")

var health:StringName = &"Health"
var attack:StringName = &"Attack"
var attack_speed:StringName = &"Attack Speed"

var stats:Array[StringName] = [
	health, 
	attack,
	attack_speed,
]
