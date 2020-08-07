
//if obj_player.interactState=1{

//cursor_sprite=sp_cursor; visible=0;	

if (keyboardMenus=1|| (keyboardMenus=2 && keyboardInUse=1)) { 



wobbletimer++

//wobblex= cos((pi*wobbletimer)/60)*6
//wobbley= sin((pi*wobbletimer)/56)*6
cursor_sprite=sp_null; visible=1
	
	
	


xSmooth += (keyboardx-xSmooth)*moveSpd
ySmooth += (keyboardy-ySmooth)*moveSpd

gotox= ConvertGUItoReal(xSmooth-(obj_inventory.horizdistance*obj_inventory.ivw-obj_inventory.horizmove)/10,0)//+obj_camera_follow.hspd //+round(wobblex)
gotoy= ConvertGUItoReal(ySmooth,1)//+obj_camera_follow.vspd //+round(wobbley)

x=gotox
y=gotoy



} else {
	
	var a = application_get_position();
	var xoff = a[0];
	var yoff = a[1];	
	var mouseX=ConvertGUItoReal((window_mouse_get_x()-xoff)/(window_get_width()-xoff*2) * surface_get_width(application_surface),0)
	var mouseY=ConvertGUItoReal((window_mouse_get_y()-yoff)/(window_get_height()-yoff*2) * surface_get_height(application_surface),1)
	gotox=mouseX+obj_camera_follow.hspeed 
	gotoy=mouseY+obj_camera_follow.vspeed 

	image_xscale=1
	image_yscale=1

if movetime == 0{
	x=mouse_x
	y=mouse_y
	
}else{
	show_debug_message(((maxmovetime-movetime)/maxmovetime))
	movetime--
	
	var a = application_get_position();
	var xoff = a[0];
	var yoff = a[1];	
	//this is all screwey
	var mouseX=(window_mouse_get_x()-xoff)/(window_get_width()-xoff*2) * surface_get_width(application_surface)
	var mouseY=(window_mouse_get_y()-yoff)/(window_get_height()-yoff*2) * surface_get_height(application_surface)
	
	//gotox = startx+(mouseX-startx)*((maxmovetime-movetime)/maxmovetime)
	//gotoy = starty+(mouseY-starty)*((maxmovetime-movetime)/maxmovetime)
	
	if movetime==0{
		cursor_sprite=sp_cursor; visible=0;	
		x=mouseX
		y=mouseY
	}
	
	
}
}


//if obj_player.interactState==0&&keyboardInUse==1||obj_player.interactState==3{
//visible=0	
//}

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