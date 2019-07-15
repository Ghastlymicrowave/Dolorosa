/// @description Insert description here
// You can write your code in this editor
dialogue = ds_list_create()
if(instance_exists(obj_player)){
obj_player.lockeddir = obj_player.lastdir
obj_player.gamepaused = 1
}

i = 0

drawstring=""
drawchr=1
textspeedtick=5

defaulttickmax=5
textspeedtickmax=defaulttickmax
screen=1

destroytime=10