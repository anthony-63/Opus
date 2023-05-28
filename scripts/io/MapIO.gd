extends Node

const map_data_sep = "≦♭⥍"

func get_start_of_audio_buffer(f_txt: String):
	var a = f_txt.find(map_data_sep)
	var b = f_txt.find(map_data_sep, a + 1)
	var c = f_txt.find(map_data_sep, b + 1)
	return c + 12

func load_map_from_filename(name):
	var file_text = FileAccess.get_file_as_string("user://maps/%s" % name)
	var s_file_text = file_text.substr(1).split(map_data_sep)
	
	var map_data = {}
	
	# Get the version of the map file
	var file = FileAccess.open("user://maps/%s" % name, FileAccess.READ)
	var vers = file.get_8()
	if vers != 1:
		push_error("Invalid map version, skipping...")
		return
	file.close()

	# Get audio buffer from file
	var file_bytes = FileAccess.get_file_as_bytes("user://maps/%s" % name)
	var audio_buffer = file_bytes.slice(get_start_of_audio_buffer(file_text))
	var format = OpusUtil.get_audio_format(audio_buffer)
	match format:
		OpusTypes.AudioFormat.WAV:
			map_data["audio_stream"] = AudioStreamWAV.new()
			map_data["audio_stream"].data = audio_buffer
		OpusTypes.AudioFormat.OGG:
			map_data["audio_stream"] = AudioStreamOggVorbis.new()
			map_data["audio_stream"].packet_sequence = OpusUtil.get_ogg_packet_sequence(audio_buffer)
		OpusTypes.AudioFormat.MP3:
			map_data["audio_stream"] = AudioStreamMP3.new()
			map_data["audio_stream"].data = audio_buffer
		_:
			print("Map '%s' has an unknown format. Skipping: %s" % name)
	
	# Get metadata
	map_data["meta"] = JSON.parse_string(s_file_text[0])
	
	# Get note data
	map_data["note_data"] = JSON.parse_string(s_file_text[1])
	
	Opus.loaded_maps.append(map_data)
