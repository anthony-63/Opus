extends NoteBase

func init_based_on_type():
	if note_data.direction == OpusTypes.NoteDirection.DOWN:
		$Arrow.rotation_degrees.z = 180.0

func check_hit():
	# Check hit for normal note
	pass
