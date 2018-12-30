/// @description Insert description here
// You can write your code in this editor

draw_set_font(global.dialougefont)
draw_set_color(c_white)
draw_text(x,y,/*IMPORTANT -->*/ds_list_find_value(global.dialogue,i))
draw_set_font(font0)