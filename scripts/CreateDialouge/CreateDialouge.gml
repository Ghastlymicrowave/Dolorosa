///@func CreateDialouge(strlist)
///@desc creates a dialouge object and applies a sting to it
///@arg list string list
function CreateDialouge(argument0) {

	if instance_exists(obj_textDraw){
	ds_list_copy(obj_textDraw.dialogue,argument0)
	}else{
	var text = instance_create_depth(x,y,0,obj_textDraw)
	ds_list_copy(text.dialogue,argument0)
	}


}
