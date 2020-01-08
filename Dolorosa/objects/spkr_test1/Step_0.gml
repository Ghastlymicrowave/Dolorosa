/// @description Insert description here
// You can write your code in this editor
if(interacted=1){
interacted=0
show_debug_message("created")
var dialougeObj=instance_create_depth(x,y,0,obj_textDraw)
dialougeObj.prntSpeaker=object_index
switch(state){
case 0:	ds_list_add(dialougeObj.dialogue,"First bit of text","yeehaw")	
state = 1;
dialougeObj._continue=1;
break;
case 1: ds_list_add(dialougeObj.dialogue,"This is the second bit of text")
state =2;
break;
case 2: ds_list_add(dialougeObj.dialogue,"This is the third bit of text and it repeats")
state =1;
break;
}

}