/// @description Insert description here
// You can write your code in this editor
if(interacted=1){
interacted=0
var dialougeObj=instance_create_depth(x,y,0,obj_textDraw)
dialougeObj.prntSpeaker=object_index
with (dialougeObj){
ds_list_add(dialogue,"Uno","Dos","three in spanish","fore")	
}

}