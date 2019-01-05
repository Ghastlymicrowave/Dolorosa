/// @description Insert description here
// You can write your code in this editor

if(mouse_check_button(mb_right)){
textspeedtickmax=defaulttickmax-5
if textspeedtickmax<0 then textspeedtickmax=0
} else textspeedtickmax=defaulttickmax

if(mouse_check_button_pressed(mb_left)){

	if drawstring==ds_list_find_value(global.dialogue,i){
	i++
	drawchr=1
	textspeedtick=textspeedtickmax
	drawstring=""
	}else drawstring=ds_list_find_value(global.dialogue,i)
}

if(mouse_check_button(mb_right)){
	if string_length(drawstring)==string_length(ds_list_find_value(global.dialogue,i))
		{
		i++
		drawchr=1
		drawstring=""
		}else textspeedtickmax=1
	} else textspeedtickmax=defaulttickmax
if(i+1>ds_list_size(global.dialogue)){instance_destroy()}

if textspeedtick=0 && ds_list_find_value(global.dialogue,i)!= drawstring {

drawstring+=string_char_at(ds_list_find_value(global.dialogue,i),drawchr)
drawchr++
textspeedtick=textspeedtickmax
}else if textspeedtick >0 {textspeedtick--}



