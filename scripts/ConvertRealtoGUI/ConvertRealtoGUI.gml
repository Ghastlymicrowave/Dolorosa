function ConvertRealtoGUI() {
	cord = argument[0]
	xOrY = argument[1]//0 is x, 1 is y

	if (!xOrY){
	return (cord-camera_get_view_x(view_camera[0]))/camera_get_view_width(view_camera[0])*display_get_gui_width()
	}else {
	return (cord-camera_get_view_y(view_camera[0]))/camera_get_view_height(view_camera[0])*display_get_gui_height()
	}
	// ui cord to y cord



}
