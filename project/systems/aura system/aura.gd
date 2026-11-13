extends Node
class_name Aura

var additive_dictionary:Dictionary[Stats.Names, int]
var multiplicative_dictionary:Dictionary[Stats.Names, int]
var duration_type:Stats.DurationType
var current_duration:int
var icon:Texture2D
var visible_to_player:bool = true
