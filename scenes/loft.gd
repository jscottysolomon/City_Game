extends Node2D

var path = "res://assets/json/loft.json"
var itemData = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	itemData = load_json_file(path) # Replace with function body.
	var children = get_node("Interactions").get_children()
	for child in children:
		child.set_interact_value(itemData[child.name])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
	
	
func load_json_file(filePath: String):
	if FileAccess.file_exists(filePath):
		var dataFile = FileAccess.open(filePath,FileAccess.READ)
		var parsedData = JSON.parse_string(dataFile.get_as_text())
		
		if(parsedData is Dictionary):
			print("loaded!")
			return parsedData
		else:
			print("Error reading data")
	else:
		print("File doesn't exist!")
