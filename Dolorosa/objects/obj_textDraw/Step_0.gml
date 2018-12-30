/// @description Insert description here
// You can write your code in this editor
if(mouse_check_button_pressed(mb_left)){i++}
if(mouse_check_button(mb_right)){i++}
if(i+1>ds_list_size(global.dialogue)){instance_destroy()}