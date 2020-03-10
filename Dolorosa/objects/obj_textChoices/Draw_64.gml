/// @description Insert description here
// You can write your code in this editor

var fromSides=100
var lineSep=150
var edgeHeight=100
draw_set_halign(fa_left)
draw_set_valign(fa_top)
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


var totalOptions = ds_list_size(options)
var width = (display_get_gui_width()/2)

/*
3 items
0.5/4
1.5/4
2.5/4
3.5/4
*/

//draw options
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
var lineSep = 14
for (var pos = 0; pos< totalOptions;pos++){
	var xx = (width/2) + width*((pos+0.5)/totalOptions)
	var yy = display_get_gui_height()-400
	draw_text_ext_transformed(xx,yy,ds_list_find_value(options,pos),lineSep,width/totalOptions/4,4,4,0)
	var strW = string_width_ext(ds_list_find_value(options,pos),lineSep,width/totalOptions/4) /2 *4
	var strH = string_height_ext(ds_list_find_value(options,pos),lineSep,width/totalOptions/4) /2 *4
	draw_rectangle(xx-strW,yy-strH,xx+strW,yy+strH,5)
	//if keyboard_check(vk_alt){destroyMe=1}
	//clicked
	
	
	
}
