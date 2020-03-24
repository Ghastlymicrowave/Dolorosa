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




/*
3 items
0.5/4
1.5/4
2.5/4
3.5/4
*/

//draw options

if (textEnded){
var totalOptions = ds_list_size(options)
var width = (display_get_gui_width()/2)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
var lineSep = 14
for (var pos = 0; pos< totalOptions;pos++){
	var xx = (width/2) + width*((pos+0.5)/totalOptions)
	var yy = display_get_gui_height()-400
	draw_text_ext_transformed(xx,yy,ds_list_find_value(options,pos),lineSep,width/totalOptions/4,4,4,0)
	var strW = string_width_ext(ds_list_find_value(options,pos),lineSep,width/totalOptions/4) /2 *4 //these are already calculated as half length
	var strH = string_height_ext(ds_list_find_value(options,pos),lineSep,width/totalOptions/4) /2 *4 //these are already calculated as half length
	draw_rectangle(xx-strW,yy-strH,xx+strW,yy+strH,5)
	//if keyboard_check(vk_alt){destroyMe=1}
	var x1 = xx - strW
	var x2 = xx+ strW
	var y1 = yy - strH
	var y2 = yy + strH
	
	if obj_inventoryControl.slotx = pos{
	obj_inventoryControl.lastslotx=pos
	obj_cursor.keyboardx=xx
	obj_cursor.keyboardy=yy
	obj_inventoryControl.lastslotx=obj_inventoryControl.slotx
	obj_inventoryControl.lastsloty=obj_inventoryControl.sloty
	obj_cursor.boxWidth = strW *2
	obj_cursor.boxHeight =strH *2
	}
	
	
	
	
	if point_in_rectangle(ConvertRealtoGUI(obj_cursor.x,0),ConvertRealtoGUI(obj_cursor.y,1),x1,y1,x2,y2){

		draw_text_ext_transformed(xx,yy,ds_list_find_value(options,pos),lineSep,width/totalOptions/4,4.25,4.25,0)
		
		if (obj_cursor.keyboardInUse==0 && mouse_check_button_pressed(mb_left) )|| (obj_cursor.keyboardInUse==1 && mouse_check_button_pressed(mb_left) && pos == obj_inventoryControl.slotx) {
			show_debug_message("textchoices selected : "+string(pos))
			if hostSpeaker!=0{
				hostSpeaker.inputChoice = pos
			}else{
			show_debug_message("NO SPEAKER!")	
			}
			destroyMe=1
		}
	}
	//clicked
	
}
	
}
