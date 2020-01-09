/// @description Insert description here
// You can write your code in this editor
if(interacted=1){
interacted=0
show_debug_message("created")
var dialougeObj=instance_create_depth(x,y,0,obj_textDraw)
dialougeObj.prntSpeaker=object_index
switch(state){
case 0:	ds_list_add(dialougeObj.dialogue,"hey kid","this a test of the quest system","go kill that guy over there, he stinks")	
state = 1;
qst_newQuest(0)
break;
case 1:
if qst_check(0,"complete"){
ds_list_add(dialougeObj.dialogue,"great job you killed him","I'm so proud of you")
state =2;
}else{
ds_list_add(dialougeObj.dialogue,"dude come on, I don't have all day","Go kill him already")
}

break;
case 2: ds_list_add(dialougeObj.dialogue,"ok thanks", "piss off now please")
state =3
break;

case 3: ds_list_add(dialougeObj.dialogue,"I said piss off please")
break;
}

}