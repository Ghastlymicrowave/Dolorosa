/// @description Insert description here
// You can write your code in this editor

var fromSides=100
var lineSep=150
var edgeHeight=100

draw_set_font(global.dialougefont)

if smoothLineHeight=0{
smoothLineHeight=(string_height_ext(ds_list_find_value(dialogue,i),lineSep,(display_get_gui_width()-fromSides*2)))	
}
if is_string(ds_list_find_value(dialogue,i)){
var lineHeight = (string_height_ext(ds_list_find_value(dialogue,i),lineSep,(display_get_gui_width()-fromSides*2)))
smoothLineHeight+=(lineHeight-smoothLineHeight)/4
//top
draw_sprite_stretched_ext(sp_inventory,0,fromSides/2,display_get_gui_height()/2-edgeHeight,display_get_gui_width()-fromSides,edgeHeight,c_white,0.75)
//body
draw_sprite_stretched_ext(sp_inventory,0,fromSides/2,display_get_gui_height()/2,display_get_gui_width()-fromSides,smoothLineHeight,c_white,0.75)
//bottom
draw_sprite_stretched_ext(sp_inventory,0,fromSides/2,display_get_gui_height()/2+smoothLineHeight,display_get_gui_width()-fromSides,edgeHeight,c_white,0.75)

draw_text_ext(fromSides,display_get_gui_height()/2,drawstringShown,lineSep,display_get_gui_width()-fromSides*2)
}
draw_set_font(font0)
