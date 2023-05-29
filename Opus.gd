extends Node

var loaded_maps = []

var current_map = {}

const default_settings = {
	"notes": {
		"scroll_speed": 20,
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
				"width": 0.005, 
				"x": -0.5,
			},
			{
				"type": OpusTypes.NoteType.Normal,
				"ms": 201,
				"width": 0.01, 
				"x": -0.4,
			},
			{
				"type": OpusTypes.NoteType.Normal,
				"ms": 202,
				"width": 0.015, 
				"x": -0.3,
			},
			{
				"type": OpusTypes.NoteType.Normal,
				"ms": 203,
				"width": 0.02, 
				"x": -0.2,
			},
			{
				"type": OpusTypes.NoteType.Normal,
				"ms": 204,
				"width": 0.025, 
				"x": -0.1,
			},
			{
				"type": OpusTypes.NoteType.Normal,
				"ms": 205,
				"width": 0.03, 
				"x": 0,
			},
			{
				"type": OpusTypes.NoteType.Normal,
				"ms": 206,
				"width": 0.035, 
				"x": 0.1,
			},
			{
				"type": OpusTypes.NoteType.Scroll,
				"ms": 1000,
				"x": 0.24,
				"width": 0.07,
				"direction": OpusTypes.NoteDirection.UP,
			},
			{
				"type": OpusTypes.NoteType.Scroll,
				"ms": 1500,
				"x": 0.24,
				"width": 0.07,
				"direction": OpusTypes.NoteDirection.DOWN,
			},
			{
				"type": OpusTypes.NoteType.Gold,
				"ms": 2000,
				"x": 0.24,
				"width": 0.07,
				"direction": OpusTypes.NoteDirection.RIGHT,
			},
			{
				"type": OpusTypes.NoteType.Swipe,
				"ms": 2500,
				"x": 0.24,
				"width": 0.07,
				"direction": OpusTypes.NoteDirection.RIGHT,
			},
		],
		"audio_stream": load("res://prefabs/litmus_krave.mp3"),
	}
	current_map = hardcoded_map
	loaded_maps.append(hardcoded_map)
