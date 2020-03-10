/// @description Insert description here
// You can write your code in this editor
dialogue = ds_list_create()
options = ds_list_create()

ds_list_add(options,"a big bo ba ba gong bab bfda fodo gag bab")
ds_list_add(options,"a big bo ba ba gong bab bfda fodo gag bab")
ds_list_add(options,"a big bo ba ba gong bab bfda fodo gag bab")
ds_list_add(options,"a big bo ba ba gong bab bfda fodo gag bab")
ds_list_add(options,"a big bo ba ba gong bab bfda fodo gag bab")
ds_list_add(dialogue,"aaaaaaaaaaaa")

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

textEnded=0

destroytime=1
destroyMe=0
screenScaleAmt=80
screenScaleAmt2=10

smoothLineHeight=0

drawstringShown=""

_continue=0
show_debug_message("actually made")