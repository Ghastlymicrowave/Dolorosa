/// @description Insert description here
// You can write your code in this editor
global.dialogue = ds_list_create()
if(instance_exists(obj_player)){
obj_player.lockeddir = obj_player.lastdir
obj_player.gamepaused = 1
}
ds_list_add(global.dialogue,"1","2","3","4")
i = 0