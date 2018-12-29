if obj_player.inventoryopen&&keyboardMenus=1 { 



wobbletimer++

wobblex= cos((pi*wobbletimer)/45)*4
wobbley= sin((pi*wobbletimer)/42)*4
image_xscale=sin((pi*wobbletimer)/45)/6+1
image_yscale=sin((pi*wobbletimer)/45)/6+1
cursor_sprite=sp_null; visible=1
	
gotox=keyboardx+obj_camera_follow.hspeed +wobblex
gotoy=keyboardy+obj_camera_follow.vspeed +wobbley
x+=(gotox-x)/4
y+=(gotoy-y)/4




} else {
	
cursor_sprite=sp_cursor; visible=0;
		
x=mouse_x+obj_camera_follow.hspeed
y=mouse_y+obj_camera_follow.vspeed
}