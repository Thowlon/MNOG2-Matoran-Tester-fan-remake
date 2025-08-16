extends CharacterBody2D

var facing = "South"
var animation = "Idle"
var mask = "Kaukau"
var item = ""

var body_offset_table = {
	"East": Vector2(25, -175),
	"North": Vector2(3, -118),
	"NorthEast": Vector2(10, -121),
	"NorthWest": Vector2(-6, -183),
	"South": Vector2(5, -127),
	"SouthEast": Vector2(-2, -115),
	"SouthWest": Vector2(-3, -111),
	"West": Vector2(-9, -176),
}

var mask_frames = {
		"Hau": preload("res://Assets/SpriteFrames/Masks/Mask_Hau_grey.tres"),
		"Kaukau": preload("res://Assets/SpriteFrames/Masks/Mask_Kaukau_grey.tres"),
		"Kakama": preload("res://Assets/SpriteFrames/Masks/Mask_Kakama_grey.tres"),
		"Pakari": preload("res://Assets/SpriteFrames/Masks/Mask_Pakari_Grey.tres"),
		"Miru": preload("res://Assets/SpriteFrames/Masks/Mask_Miru_grey.tres"),
		"Akaku": preload("res://Assets/SpriteFrames/Masks/Mask_Akaku_grey.tres"),
		"Huna": preload("res://Assets/SpriteFrames/Masks/Mask_Huna_grey.tres"),
		"Rau": preload("res://Assets/SpriteFrames/Masks/Mask_Rau_grey.tres"),
		"Komau": preload("res://Assets/SpriteFrames/Masks/Mask_Komau_grey.tres"),
		"Ruru": preload("res://Assets/SpriteFrames/Masks/Mask_Ruru_grey.tres"),
		"Mahiki": preload("res://Assets/SpriteFrames/Masks/Mask_Mahiki_grey.tres"),
		"Matatu": preload("res://Assets/SpriteFrames/Masks/Mask_Matatu_grey.tres"),
	}
var offset_table = {
	"Hau": {
		"East": Vector2(20, -196),
		"North": Vector2(5, -171),
		"NorthEast": Vector2(7, -181),
		"NorthWest": Vector2(-16, -227),
		"South": Vector2(8, -64),
		"SouthEast": Vector2(20, -144),
		"SouthWest": Vector2(-15, -146),
		"West": Vector2(-13, -197),
	},
	"Kaukau": {
		"East": Vector2(25, -246),
		"North": Vector2(3, -204),
		"NorthEast": Vector2(4, -214),
		"NorthWest": Vector2(-15, -254),
		"South": Vector2(9, -109),
		"SouthEast": Vector2(16, -174),
		"SouthWest": Vector2(-15, -193),
		"West": Vector2(-19, -247),
	},
	"Kakama": {
		"East": Vector2(21, -194),
		"North": Vector2(2, -168),
		"NorthEast": Vector2(3, -177),
		"NorthWest": Vector2(-14, -226),
		"South": Vector2(10, -57),
		"SouthEast": Vector2(9, -136),
		"SouthWest": Vector2(2, -140),
		"West": Vector2(-15, -195),
	},
	"Pakari": {
		"East": Vector2(30, -203),
		"North": Vector2(-1, -170),
		"NorthEast": Vector2(2, -179),
		"NorthWest": Vector2(-10, -225),
		"South": Vector2(10, -67),
		"SouthEast": Vector2(13, -143),
		"SouthWest": Vector2(-19, -144),
		"West": Vector2(-23, -202),
	},
	"Miru": {
		"East": Vector2(19, -199),
		"North": Vector2(9, -176),
		"NorthEast": Vector2(10, -183),
		"NorthWest": Vector2(-17, -231),
		"South": Vector2(4, -55),
		"SouthEast": Vector2(19, -131),
		"SouthWest": Vector2(-14, -135),
		"West": Vector2(-24, -202),
	},
	"Akaku": {
		"East": Vector2(24, -201),
		"North": Vector2(13, -188),
		"NorthEast": Vector2(15, -207),
		"NorthWest": Vector2(-10, -236),
		"South": Vector2(2, -63),
		"SouthEast": Vector2(13, -138),
		"SouthWest": Vector2(-32, -149),
		"West": Vector2(-28, -202),
	},
	"Huna": {
		"East": Vector2(32, -193),
		"North": Vector2(-1, -170),
		"NorthEast": Vector2(1, -177),
		"NorthWest": Vector2(-11, -223),
		"South": Vector2(11, -62),
		"SouthEast": Vector2(9, -134),
		"SouthWest": Vector2(-1, -136),
		"West": Vector2(-26, -191),
	},
	"Rau": {
		"East": Vector2(19, -199),
		"North": Vector2(0, -169),
		"NorthEast": Vector2(2, -179),
		"NorthWest": Vector2(-13, -226),
		"South": Vector2(10, -62),
		"SouthEast": Vector2(10, -139),
		"SouthWest": Vector2(-12, -142),
		"West": Vector2(-17, -198),
	},
	"Komau": {
		"East": Vector2(19, -199),
		"North": Vector2(-2, -175),
		"NorthEast": Vector2(0, -183),
		"NorthWest": Vector2(-11, -250),
		"South": Vector2(11, -59),
		"SouthEast": Vector2(9, -143),
		"SouthWest": Vector2(-8, -145),
		"West": Vector2(-13, -199),
	},
	"Ruru": {
		"East": Vector2(12, -195),
		"North": Vector2(2, -175),
		"NorthEast": Vector2(3, -182),
		"NorthWest": Vector2(-13, -228),
		"South": Vector2(9, -59),
		"SouthEast": Vector2(15, -135),
		"SouthWest": Vector2(-16, -136),
		"West": Vector2(-13, -195),
	},
	"Mahiki": {
		"East": Vector2(17, -197),
		"North": Vector2(4, -185),
		"NorthEast": Vector2(6, -182),
		"NorthWest": Vector2(-13, -228),
		"South": Vector2(7, -57),
		"SouthEast": Vector2(17, -140),
		"SouthWest": Vector2(-16, -144),
		"West": Vector2(-10, -197),
	},
	"Matatu": {
		"East": Vector2(21, -195),
		"North": Vector2(0, -174),
		"NorthEast": Vector2(3, -184),
		"NorthWest": Vector2(-16, -231),
		"South": Vector2(11, -57),
		"SouthEast": Vector2(9, -143),
		"SouthWest": Vector2(-4, -144),
		"West": Vector2(-28, -195),
	},
}

const NO_IDLE_AFTER = [
	"TurnLeft",
	"TurnRight",
	"OpenInv",
	"RummageInv",
]

func _ready() -> void:
	set_facing(facing)
	set_Mask(mask)
	set_animation(animation)
	set_Item(item)
	$AS2D_Body.animation_finished.connect(_on_body_animation_finished)
	$AS2D_Mask.animation_finished.connect(_on_mask_animation_finished)
	$AS2D_Item.animation_finished.connect(_on_item_animation_finished)


func set_facing(new_dir: String):
	facing = new_dir
	if facing == "North":
		$AS2D_Mask.z_index = 0
		$AS2D_Body.z_index = 1
	else:
		$AS2D_Mask.z_index = 2
		$AS2D_Body.z_index = 1
		
	var body_offset = body_offset_table.get(facing, Vector2.ZERO)
	var offset = offset_table.get(mask, {}).get(facing, Vector2.ZERO)
	$AS2D_Mask.offset = offset
	$AS2D_Body.offset = body_offset
	
	$AS2D_Body.play("Idle_" + facing)
	$AS2D_Mask.play("Idle_" + facing)
	$AS2D_Item.play("Idle_" + facing)

func set_Mask(new_mask: String):
	mask = new_mask	
	if facing == "North":
		$AS2D_Mask.z_index = 0
		$AS2D_Body.z_index = 1
	else:
		$AS2D_Mask.z_index = 2
		$AS2D_Body.z_index = 1
		
	$AS2D_Mask.sprite_frames = mask_frames.get(mask)
	var offset = offset_table.get(mask, {}).get(facing, Vector2.ZERO)
	$AS2D_Mask.offset = offset


	$AS2D_Body.play(animation + "_" + facing)
	$AS2D_Mask.play(animation + "_" + facing)
	$AS2D_Item.play(animation + "_" + facing)
	
func set_animation(new_anim: String):
	animation = new_anim
	var body_offset = body_offset_table.get(facing, Vector2.ZERO)
	var offset = offset_table.get(mask, {}).get(facing, Vector2.ZERO)
	$AS2D_Mask.offset = offset
	$AS2D_Body.offset = body_offset
	
	$AS2D_Body.play(animation + "_" + facing)
	$AS2D_Mask.play(animation + "_" + facing)
	$AS2D_Item.play(animation + "_" + facing)
	
	
func set_Item(new_item: String):
	item = new_item
	var offset = offset_table.get(mask, {}).get(facing, Vector2.ZERO)
	$AS2D_Mask.offset = offset
	
	$AS2D_Body.play(animation + "_" + facing)
	$AS2D_Mask.play(animation + "_" + facing)
	$AS2D_Item.play(animation + "_" + facing)

			
# Signal-Callback für den Körper
func _on_body_animation_finished():
	if _should_return_to_idle(animation):
		animation = "Idle"
		$AS2D_Body.play("Idle_" + facing)

func _on_mask_animation_finished():
	if _should_return_to_idle(animation):
		$AS2D_Mask.play("Idle_" + facing)

func _on_item_animation_finished():
	if _should_return_to_idle(animation):
		$AS2D_Item.play("Idle_" + facing)
		

func _should_return_to_idle(anim: String) -> bool:
	# nichts tun bei Idle, Loops, oder explizit verbotenen
	if anim.begins_with("Idle"):
		return false
	if anim in NO_IDLE_AFTER:
		return false
	return true
