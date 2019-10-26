/// @description Insert description here
// You can write your code in this editor

var fromSides=100
var lineSep=150
var edgeHeight=100

draw_set_font(global.dialougefont)
var lineHeight = (string_height_ext(drawstring,lineSep,(display_get_gui_width()-fromSides*2)))
//top
draw_sprite_stretched_ext(sp_inventory,0,fromSides/2,display_get_gui_height()/2-edgeHeight,display_get_gui_width()-fromSides,edgeHeight,c_white,0.75)
//body
draw_sprite_stretched_ext(sp_inventory,0,fromSides/2,display_get_gui_height()/2,display_get_gui_width()-fromSides,lineHeight,c_white,0.75)
//bottom
draw_sprite_stretched_ext(sp_inventory,0,fromSides/2,display_get_gui_height()/2+lineHeight,display_get_gui_width()-fromSides,edgeHeight,c_white,0.75)

draw_text_ext(fromSides,display_get_gui_height()/2,drawstring,lineSep,display_get_gui_width()-fromSides*2)
draw_set_font(font0)
