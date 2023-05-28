extends Node

@export var note_data = {}
@export var hittable = false

func init():
	$NoteSprite.scale.x = note_data.width
	self.transform.origin.z = -2.1
	self.transform.origin.x = note_data.x

func check_hit():
	pass

func _process(delta):
	if check_hit():
		self.queue_free()

func update(d):
	self.transform.origin.z += (Opus.default_settings.notes.scroll_speed / 20.0) * d
	if self.transform.origin.z > 2.0:
		self.queue_free()
