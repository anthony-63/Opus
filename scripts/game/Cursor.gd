extends Node

const bounds = 0.88

func _process(delta):
	pass
	
func _input(ev):
	if ev is InputEventMouseMotion:
		self.transform.origin.x += (ev.relative.x * (Opus.default_settings.cursor.sensitivity) / 90)
		self.transform.origin.x = clamp(self.transform.origin.x, -bounds, bounds)
