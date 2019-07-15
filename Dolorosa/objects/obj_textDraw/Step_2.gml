if screen=1{
x=obj_camera_follow.x
y=obj_camera_follow.y

ScreenshakeAmt(2,4,0,1,1)
// Argument 0 : screenshake amount
// Argument 1 : duration in frames
// Argument 2 : maximum random angle (as random positive num funciton)
// Argument 3 : zoom, a number probably between 1 and 10, 1 being a full zoom and 10 being hardly noticeable at all

}


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
	}else drawstring=ds_list_find_value(dialogue,i)
}else if(mouse_check_button(mb_right))&&i+1!=ds_list_size(dialogue){
	if string_length(drawstring)==string_length(ds_list_find_value(dialogue,i))
		{
		i++
		//if i > ds_list_size(global.dialogue) then i = ds_list_size(global.dialogue)-1
		drawchr=1
		drawstring=""
		}else textspeedtickmax=1
	} else textspeedtickmax=defaulttickmax
	
if(i>=ds_list_size(dialogue)){
	destroytime--
	if destroytime=0 then instance_destroy()
	exit;
	}

if textspeedtick=0 && ds_list_find_value(dialogue,i)!= drawstring {


drawstring+=string_char_at(ds_list_find_value(dialogue,i),drawchr)
drawchr++
textspeedtick=textspeedtickmax
}else if textspeedtick >0 {textspeedtick--}