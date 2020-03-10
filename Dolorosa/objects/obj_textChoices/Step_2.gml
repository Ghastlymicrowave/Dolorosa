if destroyMe=1{
	
	destroytime--
	if destroytime=0 
	{
		if (!_continue){obj_player.interactState=0}
		
		obj_player.dodgetime=0
		obj_player.dodgespeed=0
		obj_player.dodgedelay=0
		instance_destroy()
	return;
	}
}

if screen=1{
x=obj_camera_follow.x
y=obj_camera_follow.y

if screenScaleAmt>1{
	
	if screenScaleAmt<5{
		screenScaleAmt2+= 2/(screenScaleAmt-1)
	}
	screenScaleAmt-= screenScaleAmt/screenScaleAmt2
	

if screenScaleAmt<1 then screenScaleAmt=1
}
ScreenshakeAmt(1,40,0,screenScaleAmt,1)

// Argument 0 : screenshake amount
// Argument 1 : duration in frames
// Argument 2 : maximum random angle (as random positive num funciton)
// Argument 3 : zoom, a number probably between 1 and 10, 1 being a full zoom and 10 being hardly noticeable at all

}

if textEnded = 1 {return;}

if(mouse_check_button(mb_right)){
textspeedtickmax=defaulttickmax-5
if textspeedtickmax<0 then textspeedtickmax=0
} else textspeedtickmax=defaulttickmax

if(mouse_check_button_pressed(mb_left)){

	if drawstring==ds_list_find_value(dialogue,i){
	i++
	//if i > ds_list_size(global.dialogue) then i = ds_list_size(global.dialogue)-1
	drawchr=1
	textspeedtick=textspeedtickmax
	drawstring=""
	drawstringShown=""
	
	}else drawstring=ds_list_find_value(dialogue,i)
}else if(mouse_check_button(mb_right))&&i+1!=ds_list_size(dialogue){
	if string_length(drawstring)==string_length(ds_list_find_value(dialogue,i))
		{
		i++
		//if i > ds_list_size(global.dialogue) then i = ds_list_size(global.dialogue)-1
		drawchr=1
		drawstring=""
		drawstringShown=""
		}else textspeedtickmax=1
	} else textspeedtickmax=defaulttickmax
	
if(i>=ds_list_size(dialogue))&&textEnded==0{
	textEnded=1
	//if (_continue){prntSpeaker.interacted=1}
	
	ds_list_add(dialogue,ds_list_find_value(dialogue,i-1))
	drawstringShown=ds_list_find_value(dialogue,i-1)
	drawstring=drawstringShown
	show_debug_message("ee")
	//instance_destroy()
}
	
if textEnded==0{//<== probably a redundent line

if textspeedtick=0 && ds_list_find_value(dialogue,i)!= drawstring {


drawstring+=string_char_at(ds_list_find_value(dialogue,i),drawchr)
drawchr++
textspeedtick=textspeedtickmax
}else if textspeedtick >0 {textspeedtick--}

if ds_list_find_value(dialogue,i)!=drawstring{
	drawstringShown=drawstring
	drawstringShown = string_delete(drawstringShown,max(string_length(drawstringShown)-4,1),5)
	
	//show_debug_message(drawstringShown)
	//show_debug_message(drawstring)
}else{ drawstringShown=drawstring}
}