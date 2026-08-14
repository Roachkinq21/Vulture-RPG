class_name Item_Stack

signal item_changed(item: Item)

var max_count : int = 100

var item : Item:
    set(val):
        item = val
        item_changed.emit(val)

var count : int


func _init(item: Item, count : int = 9) -> void:
    self.item = item
    self.count = count

    