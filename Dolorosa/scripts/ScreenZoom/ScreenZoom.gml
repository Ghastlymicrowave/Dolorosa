///@func ScreenZoom( duration, zoom Percentage, curve !optional)
///@description apply a zoom effect
///@arg duration
///@arg Zoom percentage
///@arg Curve type, 0 linear, 1 cosine

if(object_exists(obj_camera_follow)){
with(obj_camera_follow){
screenZoomTime=argument[0]
iniScreenZoomTime=argument[0]
Zoom=argument[1]
if argument[2]!=noone{
zoomCurve=argument[2]}else zoomCurve=0
}
}else{
show_message("Error, obj_camera_follow does not exist for the function ScreenZoom on the object "+string(object_index)+" "+object_get_name(object_index))
}