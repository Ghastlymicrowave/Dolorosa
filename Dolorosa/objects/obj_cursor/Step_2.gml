
//if obj_player.interactState=1{

//cursor_sprite=sp_cursor; visible=0;	

if (keyboardMenus=1|| (keyboardMenus=2 && keyboardInUse=1)) { 



wobbletimer++

wobblex= cos((pi*wobbletimer)/60)*6
wobbley= sin((pi*wobbletimer)/56)*6
cursor_sprite=sp_null; visible=1
	
gotox= ConvertGUItoReal(keyboardx-(obj_inventory.horizdistance*obj_inventory.ivw-obj_inventory.horizmove)/10,0)+obj_camera_follow.hspeed +round(wobblex)
gotoy= ConvertGUItoReal(keyboardy,1)+obj_camera_follow.vspeed +round(wobbley)


x+=(gotox-x)/4
y+=(gotoy-y)/4

x=gotox
y=gotoy

} else {
	

gotox=mouse_x+obj_camera_follow.hspeed 
gotoy=mouse_y+obj_camera_follow.vspeed 

image_xscale=1
image_yscale=1

if movetime == 0{
	x=mouse_x
	y=mouse_y
	
}else{
	movetime--
	x = startx+(mouse_x-startx)*((maxmovetime-movetime)/maxmovetime)
	y = starty+(mouse_y-starty)*((maxmovetime-movetime)/maxmovetime)
	if movetime==0{
		cursor_sprite=sp_cursor; visible=0;	
		x=mouse_x
		y=mouse_y
	}
	
	
}
}


if obj_player.interactState==0&&keyboardInUse==1{
visible=0	
}

/*
acelScale -= acelScale/20
acelScale = max(acelScale,1)
if abs(x-mouse_x)+abs(y-mouse_y) < 1{

acelScale=20
x=mouse_x
y=mouse_y
}else{

}
*/

//}