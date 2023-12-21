extends Node

var last_world_position = Vector2(0, 0)
var recommencer : bool = false
var visibiliteAssaillant : bool
var tempsRestantAssaillant : float 
var resetTimerAssaillant : bool
var tempsBijou 
var Bijou : int

var prestige = 0
var richesse = 30
var vie = 3

#durée du temps de jeu max
var tempsMax : int
var secMax : int = 0
var minMax : int = 5

#temps dynamique
var tempsActuel : int
var secondes : int
var minutes : int

#temps jeu
var tempsJeu : int

func _ready():
	secondes = secMax
	minutes = minMax
	tempsMax = minMax * 60 + secMax
	Bijou = 1
	tempsBijou = tempsMax/5
	print(tempsBijou)

func _process(_delta):
	if recommencer:
		restart()
		
	temps()
	metier()
	
	
		
func metier():
	if tempsJeu >= tempsBijou:
		Bijou += 1
		tempsBijou += tempsMax/3
		print(tempsBijou) 
	
func temps():
	if secondes <= 0:
		if minutes > 0:
			secondes = 60
			minutes -= 1
	tempsActuel = minutes * 60 + secondes
	tempsJeu = tempsMax - tempsActuel

func restart():
		tempsRestantAssaillant = 0
		prestige = 0
		richesse = 30
		vie = 3
		tempsJeu = 0
		_ready()
		recommencer = false
		resetTimerAssaillant = true
