extends Node

var last_world_position = Vector2(0, 0)
var recommencer : bool = false
var visibiliteAssaillant : bool
var tempsRestantAssaillant : float 
var resetTimerAssaillant : bool
var tempsBijou 
var Bijou : int
var conditionNoble : bool
var chance
var nombreAléatoire
var chanceMax
var chanceAssaillant
var occupe : bool
var chanceTavernier : bool

var noblesse : bool
var mariage : bool
var jeuTerminer : bool

var nbOui = 0
var nbNon = 0

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
	noblesse = false
	mariage = false
	jeuTerminer = false
	conditionNoble = false
	chance = RandomNumberGenerator.new()
	secondes = secMax
	minutes = minMax
	tempsMax = minMax * 60 + secMax
	Bijou = 1
	@warning_ignore("integer_division")
	tempsBijou = tempsMax/5

func _process(_delta):
	if recommencer:
		restart()
		
	temps()
	metier()
	
	chanceNoble()
	chanceCombat()
	chanceTavernierFonction()

func chanceTavernierFonction():
	
	if nombreAléatoire >= 50:
		chanceTavernier = true
	else:
		chanceTavernier = false

func chanceCombat():
	if nombreAléatoire >= 0 && nombreAléatoire < 15:
		chanceAssaillant = 1
	if nombreAléatoire >= 15 && nombreAléatoire < 30:
		chanceAssaillant = 2
	if nombreAléatoire >= 30 && nombreAléatoire < 40:
		chanceAssaillant = 3
	if nombreAléatoire >= 40 && nombreAléatoire < 50:
		chanceAssaillant = 4
	if nombreAléatoire >= 50:
		chanceAssaillant = 0

func chanceNoble():
	if prestige <= 200:
		chanceMax = 5
	if prestige >= 400:
		chanceMax = 15
	if prestige >= 600:
		chanceMax = 23
	if prestige >= 800:
		chanceMax = 50
	if prestige >= 900:
		chanceMax = 70
	chance.seed = secondes
	nombreAléatoire = chance.randi_range(0, 100) 
	if nombreAléatoire < chanceMax:
		conditionNoble = true
	else:
		conditionNoble = false
		
func metier():
	if tempsJeu >= tempsBijou:
		Bijou += 1
		@warning_ignore("integer_division")
		tempsBijou += tempsMax/3
	
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
