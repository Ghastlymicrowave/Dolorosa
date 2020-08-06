

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
lastmousex = mouse_x
lastmousey = mouse_y
movetime=20

}
}



//show_debug_message(string(keyboardInUse))

