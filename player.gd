extends CharacterBody3D

var STEP = 1.0
var STEP_DER = 0.4
const ROTATE = 90.0

var tween : Tween

############
## STATUS ##
var in_hostile_zone : bool
var fero : bool 

var fero_count : int

var encounter_rate : int
var latest_encounter : int

## READY NODES ##
@onready var shape_cast_3d_front: ShapeCast3D = $ShapeCast3DFront
@onready var shape_cast_3d_2_right: ShapeCast3D = $ShapeCast3D2Right
@onready var shape_cast_3d_3_back: ShapeCast3D = $ShapeCast3D3Back
@onready var shape_cast_3d_4_left: ShapeCast3D = $ShapeCast3D4Left

@onready var camera_3d: Camera3D = $Camera3D
@onready var world: Node3D = $".."



func _ready() -> void:
	in_hostile_zone = world.is_hostile
	fero = false
	fero_count = 10
	encounter_rate = world.level
	print(encounter_rate)
	print(in_hostile_zone)
	
	
func _physics_process(delta: float) -> void:
	move_and_slide()

func _input(event: InputEvent) -> void:
	
	if is_instance_valid(tween) && tween.is_running():
		return
	
	## MOVEMENT ##
	elif Input.is_action_pressed("up") and not shape_cast_3d_front.is_colliding():
		tween = get_tree().create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self,"position", (position + STEP * -self.get_global_transform().basis.z), STEP_DER)
		
		await tween.finished
		_check_encounter()
		_item_tick()
		
	elif Input.is_action_pressed("down") and not shape_cast_3d_3_back.is_colliding():
		tween = get_tree().create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self,"position", (position + STEP * self.get_global_transform().basis.z), STEP_DER)
	
	elif Input.is_action_pressed("strafeleft") and not shape_cast_3d_4_left.is_colliding():
		tween = get_tree().create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self,"position", (position - STEP * get_global_transform().basis.x), STEP_DER)
	
	elif Input.is_action_pressed("straferight") and not shape_cast_3d_2_right.is_colliding():
		tween = get_tree().create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self,"position", (position + STEP * get_global_transform().basis.x), STEP_DER)
	
	## ROTATION ##
	elif Input.is_action_pressed("left"):
		tween = get_tree().create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self, "rotation_degrees:y", self.rotation_degrees.y + ROTATE, STEP_DER)
	
	elif Input.is_action_pressed("right"):
		tween = get_tree().create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self, "rotation_degrees:y", self.rotation_degrees.y - ROTATE, STEP_DER)


func _check_encounter():
	if !fero && in_hostile_zone:
		var encounter_chance = randi_range(1,encounter_rate)
		##If the number is the same as last time, Re count.
		while encounter_chance == latest_encounter:
			encounter_chance = randi_range(1,encounter_rate)
		print(encounter_chance)
		if encounter_chance == 1:
			print("ENEMY ENCOUNTERED!!!")
		latest_encounter = encounter_chance

func _item_tick():
	if fero:
		fero_count -= 1
		print("Fero Count: ", fero_count)
		if fero_count == 0:
			fero = false
