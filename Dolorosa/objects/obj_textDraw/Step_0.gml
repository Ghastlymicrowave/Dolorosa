/// @description Insert description here
// You can write your code in this editor
if(i>ds_list_size(global.dialogue)){instance_destroy()}
if(mouse_check_button_pressed(mb_left)){i++}
if(mouse_check_button(mb_right)){i++}
draw_set_color(c_white)
draw_text(x,y,/*IMPORTANT -->*/ds_list_find_value(global.dialogue,i))