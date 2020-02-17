if obj_player.inventoryopen&&(keyboardMenus=1|| (keyboardMenus=2 && keyboardInUse=1))  { 



wobbletimer++

wobblex= cos((pi*wobbletimer)/60)*6
wobbley= sin((pi*wobbletimer)/56)*6
cursor_sprite=sp_null; visible=1
	
gotox=keyboardx+obj_camera_follow.hspeed +round(wobblex)
gotoy=keyboardy+obj_camera_follow.vspeed +round(wobbley)
x+=(gotox-x)/4
y+=(gotoy-y)/4




} else {
	
//cursor_sprite=sp_cursor; visible=0;
		
//x=mouse_x+obj_camera_follow.hspeed
//y=mouse_y+obj_camera_follow.vspeed


gotox=mouse_x+obj_camera_follow.hspeed 
gotoy=mouse_y+obj_camera_follow.vspeed 
x+=(gotox-x)/acelScale
y+=(gotoy-y)/acelScale

acelScale -= acelScale/20
acelScale = max(acelScale,1)
if abs(x-mouse_x)+abs(y-mouse_y) < 1{
cursor_sprite=sp_cursor; visible=0;	
acelScale=20
}else{
image_xscale=1
image_yscale=1
}

}