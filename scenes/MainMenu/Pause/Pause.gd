extends CanvasLayer

# This scene is Singelton/Autoload check GameManager.gd for reference

# Variables and constants like always nothing special
const SAVE_DIR = "user://saves/"
var save_path = SAVE_DIR + "save.dat"
var loading = false

# When scene is loaded set it invisible because it is always loaded
func _ready():
	set_visible(false)

# handlings inputs but in reality only one input
func _input(event):
	
	# When Escape is clicked
	if event.is_action_pressed("ui_cancel"): #escape button by default
		
		# Bocking pause in mainmenu and difficulty node
		if get_tree().current_scene.name == "dificulty": 
			return
		if get_tree().current_scene.name == "Control":
			return
		if get_tree().current_scene.name == "Options":
			return
		if get_tree().current_scene.name == "main":
			return
		
		# Set it to visible when not in above three scenes
		set_visible(!get_tree().paused) # if not pause then hide
		$NameDialog.visible = false
		pausedgame() #toogle pause status

# Pause toggling
func pausedgame():
	get_tree().paused = !get_tree().paused

func _on_Continue_pressed():
	get_tree().paused = false
	set_visible(false)

func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible


# setting variables that can be saved in the file
# In godot You must save variables like this in autoload 
# Otherwise it is lost in the void or something
var playerpos
var maxmovesleft 
var boxesPos = [] #save
var username
#save


func _on_Save_pressed():
	
	# Defining the dictionary for saving
	var data = {
		"GMrando" : GameManager.rando,
		"GMeasy" : GameManager.easy,
		"GMnormal" : GameManager.normal,
		"GMhard" : GameManager.hard,
		"GMgradually" : GameManager.gradually,
		"GMscore" : GameManager.score,
		"Vector2Player" : playerpos,
		"currentscenename" : get_tree().current_scene.name,
		"maxmovesleft" : maxmovesleft,
		"Boxes" : boxesPos,
		"username" : username,
		"single" : GameManager.single,
	}
	
	print(playerpos) #debug
	
	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	# Creating a file with dictionary inside
	# It is encrypted 
	var file = File.new()
	var error = file.open_encrypted_with_pass(save_path, File.WRITE, "PeppaPig2169")
	if error == OK:
		file.store_var(data)
		file.close()


var save_data
# Loadng data
func _on_Load_pressed():
	var file = File.new()
	# Checking if file exist
	if file.file_exists(save_path):
		var error = file.open_encrypted_with_pass(save_path, File.READ, "PeppaPig2169")
		if error == OK:
			save_data = file.get_var()
			
			# Pulling out the data
			var Gm = GameManager
			Gm.easy =  save_data["GMeasy"]
			Gm.gradually =  save_data["GMgradually"]
			Gm.hard =  save_data["GMhard"]
			Gm.normal =  save_data["GMnormal"]
			Gm.score =  save_data["GMscore"]
			Gm.rando =  save_data["GMrando"]
			Gm.maxmoves =  save_data["maxmovesleft"]
			Gm.single = save_data["single"]
			var current = save_data["currentscenename"]
			username = save_data["username"] #helllooooooo
			
			#changing scene to match the save scene
			if Gm.easy:
				get_tree().change_scene("res://scenes/LevelsDone/easy/" +str(current)+ "/LevelBlank.tscn")
			elif Gm.normal:
				get_tree().change_scene("res://scenes/LevelsDone/normal/" +str(current)+ "/LevelBlank.tscn")
			elif Gm.hard:
				get_tree().change_scene("res://scenes/LevelsDone/hard/" +str(current)+ "/LevelHardBlank.tscn")
			
			# I forgot but probably very important
			loading = true
			# I remember now it is for not saving and loading at the same time
			# Silly me :)
			
			# Debug just debug
			#print(save_data["Vector2Player"])
			#print(save_data) 
			
			
			file.close()

# Exiting and saving
func _on_Exit_pressed():
	_on_Save_pressed()
	get_tree().quit()

# Exiting to menu
func _on_ExitToMenu_pressed():
	get_tree().change_scene("res://Main.tscn")
	_on_Continue_pressed()

# saving boxes
func save_boxes(children):
	boxesPos = []
	for child in children:
		boxesPos.append(child.position)

# changing scene
func _on_Options_pressed():
	get_tree().change_scene("res://Main.tscn")

func _on_Button_pressed():
	username = $Save/username.text

# Submiting to looserboard
func _on_SubmitScoreButton_pressed():
	var name = $"NameDialog/NameInput".text
	GameManager.set_player_name(name)
	SilentWolf.Scores.persist_score(GameManager.player_name, GameManager.total_score)
	SilentWolf.Scores.get_high_scores()
	$"NameDialog".hide()

# Changing visibility
func _on_Leave_pressed():
	$NameDialog.visible = false

func _on_SaveScore_pressed():
	$NameDialog.visible = true

func _on_NameDialog_tree_entered():
	$NameDialog.visible = false
