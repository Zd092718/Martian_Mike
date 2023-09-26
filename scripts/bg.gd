extends ParallaxBackground

@export var bg_texture: CompressedTexture2D = preload("res://assets/textures/bg/Brown.png")

@export var scroll_speed_x = 15
@export var scroll_speed_y = 15

@onready var sprite = $ParallaxLayer/Sprite2D

func _ready():
	sprite.texture = bg_texture

func _process(delta):
	sprite.region_rect.position += delta * Vector2(scroll_speed_x, scroll_speed_y)
	if(sprite.region_rect.position >= Vector2(64, 64)):
		sprite.region_rect.position = Vector2.ZERO
