extends NoteBase

func init_based_on_type():
	match note_data.direction:
		OpusTypes.NoteDirection.LEFT: $Arrow.rotation_degrees.z = 90.0
		OpusTypes.NoteDirection.DOWN: $Arrow.rotation_degrees.z = 180.0
		OpusTypes.NoteDirection.RIGHT: $Arrow.rotation_degrees.z = -90.0
		OpusTypes.NoteDirection.UP: $Arrow.rotation_degrees.z = 0.0

func check_hit():
	pass

