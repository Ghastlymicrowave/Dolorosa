//arg 0 is the viewport num
//arg 1 is width of window
//arg 2 is the height of window

var windW = argument[1]
var windH = argument[2]
view_wport[argument[0]] = windW
view_hport[argument[0]] = windH

	surface_resize(application_surface,view_wport[argument[0]],view_hport[argument[0]])
	camera_set_view_size(view_camera[argument[0]],windW,windH)
//if (view_wport[argument[0]] != surface_get_width(application_surface) || view_hport[argument[0]] != surface_get_height(application_surface) ){
//	surface_resize(application_surface,view_wport[argument[0]],view_hport[argument[0]])
//	camera_set_view_size(view_camera[argument[0]],windW(),windH())
//}