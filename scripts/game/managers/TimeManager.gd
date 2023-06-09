extends Node

signal finished

@export var playing: bool = false
@export var playback_speed:float = 1

var last_time:int = 0
@export var real_time:float = 0
var current_time:float = 0
@export var length:float = 0
var paused:bool = false

func _ready():
	pass

func start(from:float=0):
	last_time = Time.get_ticks_msec()
	real_time = from
	playing = true

func seek(from:float=0):
	last_time = Time.get_ticks_msec()
	real_time += from - current_time

func finish():
	playing = false
	finished.emit()
		
func just_paused():
	pass
	
func just_unpaused():
	last_time = Time.get_ticks_msec()

func _process(_delta):
	if !playing: return
	var now = Time.get_ticks_msec()
	var time = playback_speed * (now - last_time)
	last_time = now
	real_time += time
	current_time = real_time
	try_finish()

func try_finish():
	if current_time > length + 3000:
		finish()
