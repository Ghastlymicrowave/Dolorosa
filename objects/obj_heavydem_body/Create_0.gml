/// @description Insert description here
// You can write your code in this editor
movestate = 0
attack = 0
cooldown = 0
dinput = 0
head = instance_create_depth(x,y,0,obj_heavydem_head)
snake_create(2,head,obj_trail,id,0.2,Sprite5,sp_wallSprite)
target = obj_player