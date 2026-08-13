extends Resource
class_name Item

@export_enum("Key Item", "Usable") var item_type

@export var item_name : String = "Item"
@export var texture : Texture2D
@export var count : int