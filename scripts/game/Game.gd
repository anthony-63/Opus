extends Node3D

var cursor_captured = true

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	$AudioManager.length = Opus.current_map.note_data[-1].ms
	$AudioManager.play($MusicStream)
	
func _process(delta):
	if Input.is_action_just_pressed("toggle_cursor"):
		cursor_captured = !cursor_captured
		if cursor_captured:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
