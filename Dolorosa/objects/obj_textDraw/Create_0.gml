/// @description Insert description here
// You can write your code in this editor
global.dialogue = ds_list_create()
if(instance_exists(obj_player)){
obj_player.lockeddir = obj_player.lastdir
obj_player.gamepaused = 1
}
ds_list_add(global.dialogue,"1gd------------------fg...------------s--dfg--s-dfg---sd------------fg-s--dfg-----s-df--g-h","2gdfgdsfgdsfgdsfg","3gdfsgdfsgdsfgs","4fdgsdfgdsfgsdfg")
i = 0

drawstring=""
drawchr=1
textspeedtick=5

defaulttickmax=5
textspeedtickmax=defaulttickmax
screen=1