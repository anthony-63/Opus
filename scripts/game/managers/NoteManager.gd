extends Node

var note_index = 0
var spawn_new_notes = true

# load all the note scenes for each type
@onready var normal_note_scene = preload("res://scenes/notes/Normal.tscn")
@onready var normal_long_note_scene = preload("res://scenes/notes/NormalLong.tscn")
@onready var gold_note_scene = preload("res://scenes/notes/Gold.tscn")
@onready var gold_long_note_scene = preload("res://scenes/notes/GoldLong.tscn")
@onready var swipe_note_scene = preload("res://scenes/notes/Swipe.tscn")
@onready var scroll_note_scene = preload("res://scenes/notes/Scroll.tscn")

func spawn_note():
	var note_data = Opus.current_map.note_data[note_index]
	var note = null
	match note_data.type:
		OpusTypes.NoteType.Normal:
			print("Spawn normal note")
			note = normal_note_scene.instantiate()
		OpusTypes.NoteType.NormalLong:
			print("Spawn normal long note")
			note = normal_long_note_scene.instantiate()
		OpusTypes.NoteType.Gold:
			print("Spawn gold note")
			note = gold_note_scene.instantiate()
		OpusTypes.NoteType.GoldLong:
			print("Spawn long gold note")
			note = gold_long_note_scene.instantiate()
		OpusTypes.NoteType.Scroll:
			print("Spawn scroll note")
			note = scroll_note_scene.instantiate()
		OpusTypes.NoteType.Swipe:
			print("Spawn swipe note")
			note = swipe_note_scene.instantiate()
		
	note.note_data = note_data
	note.init()
	add_child(note)

func _process(delta):
	if note_index >= len(Opus.current_map.note_data):
		spawn_new_notes = false
	
	if spawn_new_notes:
		if $"../AudioManager".current_time > Opus.current_map.note_data[note_index].ms:
			spawn_note()
			note_index += 1
			
	for child in get_children():
		child.update(delta)
