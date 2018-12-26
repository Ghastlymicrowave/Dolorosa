if keyboardMenus = 1 { 
	
cursor_sprite=sp_null; visible=1
	
x=keyboardx+obj_camera_follow.hspeed
y=keyboardy+obj_camera_follow.vspeed


} else {
	
cursor_sprite=sp_cursor; visible=0;
		
x=mouse_x+obj_camera_follow.hspeed
y=mouse_y+obj_camera_follow.vspeed
}