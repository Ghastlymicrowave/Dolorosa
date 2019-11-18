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
textspeedtick=1

defaulttickmax=1
textspeedtickmax=defaulttickmax
screen=1

destroytime=10
destroyMe=0
screenScaleAmt=80
screenScaleAmt2=10

smoothLineHeight=0

drawstringShown=""