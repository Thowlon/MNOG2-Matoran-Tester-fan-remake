extends Node2D

const COLOR_ACTIVE  := Color(0.98, 0.84, 0.30) 
const COLOR_INACTIVE := Color(1, 1, 1)

func _ready():
	$Directions/btn_South.self_modulate = COLOR_ACTIVE
	$Masks/btn_Kaukau.self_modulate = COLOR_ACTIVE
	for button in $Directions.get_children():
		if button is Button:
			var dir = button.name.replace("btn_", "")
			button.pressed.connect(_on_direction_pressed.bind(dir, button))
	for button in $Masks.get_children():
		if button is Button:
			var dir = button.name.replace("btn_", "")
			button.pressed.connect(_on_mask_pressed.bind(dir, button))
	for button in $Animations.get_children():
		if button is Button:
			var dir = button.name.replace("btn_", "")
			button.pressed.connect(_on_animation_pressed.bind(dir))

func _on_direction_pressed(dir, current_button):
	var player = $Player
	player.set_facing(dir)
	for btn in $Directions.get_children():
		if btn is Button:
			btn.self_modulate = COLOR_INACTIVE
	current_button.self_modulate = COLOR_ACTIVE
	
func _on_animation_pressed(anim):
	var player = $Player
	player.set_animation(anim)
	
func _on_mask_pressed(anim, current_button):
	var player = $Player
	player.set_Mask(anim)
	for btn in $Masks.get_children():
		if btn is Button:
			btn.self_modulate = COLOR_INACTIVE
	current_button.self_modulate = COLOR_ACTIVE
