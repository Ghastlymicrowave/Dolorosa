
//I don't understand this shit

var mouseMoved = point_distance(window_mouse_get_x(),window_mouse_get_y(),stillx,stilly)>50
if(keyboardInUse=1 && mouseMoved){

keyboardInUse=0	
startx = x
starty = y
lastmousex = mouse_x
lastmousey = mouse_y
if(obj_player.playerstate!=playerstates.inventory){movetime=1}

}
else if keyboardMenus=2 && keyboardInUse=0 {
	
if (obj_player.vinput!=0||obj_player.hinput!=0)&&(obj_player.playerstate==playerstates.inventory){
keyboardInUse=1	
stillx=window_mouse_get_x()
stilly=window_mouse_get_y()	
var a = application_get_position();
var xoff = a[0];
var yoff = a[1];	
var mouseX=ConvertGUItoReal((window_mouse_get_x()-xoff)/(window_get_width()-xoff*2) * surface_get_width(application_surface),0)
var mouseY=ConvertGUItoReal((window_mouse_get_y()-yoff)/(window_get_height()-yoff*2) * surface_get_height(application_surface),1)
lastmousex = mouseX
lastmousey = mouseY
startx = x
starty = y
movetime=maxmovetime

}
}



//show_debug_message(string(keyboardInUse))

