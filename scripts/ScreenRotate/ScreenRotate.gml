///@func ScreenRotate( duration, Angle, Random side or set side, curve !optional)
///@description apply a screen rotation
///@arg Duration
///@arg Angle
///@arg Random side, 0, or set side, 1 or 2 (one being left)
///@arg Curve type, 0 linear, 1 cosine
function ScreenRotate() {

	if(object_exists(obj_camera_follow)){
	with(obj_camera_follow){
	screenRotateTime=argument[0]
	iniScreenRotateTime=argument[0]
	angle=argument[1] -argument[1]*2*((irandom(1)=1&&argument[2]=0)||argument[2]=2)
	show_debug_message(angle)
	realAngle=0
	if argument[2]!=noone{
	rotateCurve=argument[2]}else rotateCurve=0
	}
	}else{
	show_message("Error, obj_camera_follow does not exist for the function ScreenRotate on the object "+string(object_index)+" "+object_get_name(object_index))
	}





}
