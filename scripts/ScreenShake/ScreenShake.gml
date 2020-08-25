///@func ScreenShake duration, power, curve !optional)
///@description apply a screen rotation
///@arg Duration
///@arg Screenshake Power
///@arg Curve type, 0 linear, 1 cosine
function ScreenShake() {


	if(object_exists(obj_camera_follow)){
	with(obj_camera_follow){
	screenshakeTime=argument[0]
	iniScreenshakeTime=argument[0]
	screenshakePower=argument[1]
	if argument[2]!=noone{
	shakeCurve=argument[2]}else shakeCurve=0
	}
	}else{
	show_message("Error, obj_camera_follow does not exist for the function ScreenShake on the object "+string(object_index)+" "+object_get_name(object_index))
	}




}
