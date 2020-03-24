/// @description Insert description here
// You can write your code in this editor
dialogue = ds_list_create()
options = ds_list_create()

ds_list_add(options,"a big bo ba ba gong bab bfda fodo gag bab")
ds_list_add(options,"a")
ds_list_add(options,"a big bo ba bfsdafsdf sadfsdafa gong bab bfda fodo gag bab")
ds_list_add(options,"a big bo ba ba gong bab bfda fodo gag bab")
ds_list_add(options,"a big bo ba bab")
ds_list_add(dialogue,"aaaaaaa aaaaa")

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

obj_player.interactState=2

obj_inventoryControl.slotx=0
obj_inventoryControl.side=-1
obj_inventoryControl.lastslotx=0

_continue=0

hostSpeaker=0
show_debug_message("actually made")