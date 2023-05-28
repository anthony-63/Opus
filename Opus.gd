extends Node

var loaded_maps = []

var current_map = {}

const default_settings = {
	"notes": {
		"scroll_speed": 26,
	},
	"cursor": {
		"sensitivity": 0.1,
	},
}

func _ready():
	var hardcoded_map = {
		"meta": {
			"title": "Krave",
			"artist": "litmus",
			"id": "anya_litmus-krave",
		},
		"note_data": [
			{
				"type": OpusTypes.NoteType.Normal,
				"ms": 200,
				"width": 0.04, 
				"x": 0.14,
			},
			{
				"type": OpusTypes.NoteType.Normal,
				"ms": 200,
				"width": 0.04, 
				"x": 0.43,
			},
			{
				"type": OpusTypes.NoteType.Normal,
				"ms": 200,
				"width": 0.04, 
				"x": 0.02,
			},
			{
				"type": OpusTypes.NoteType.Normal,
				"ms": 200,
				"width": 0.04, 
				"x": -0.44,
			},
			{
				"type": OpusTypes.NoteType.Normal,
				"ms": 200,
				"width": 0.04, 
				"x": -0.24,
			},
			{
				"type": OpusTypes.NoteType.Normal,
				"ms": 200,
				"width": 0.04, 
				"x": -0.49,
			},
			{
				"type": OpusTypes.NoteType.Normal,
				"ms": 200,
				"width": 0.04, 
				"x": 0.0,
			},
			{
				"type": OpusTypes.NoteType.Scroll,
				"ms": 1500,
				"x": 0.24,
				"width": 0.07,
				"direction": OpusTypes.NoteDirection.RIGHT,
			}
		],
		"audio_stream": load("res://prefabs/litmus_krave.mp3"),
	}
	current_map = hardcoded_map
	loaded_maps.append(hardcoded_map)
