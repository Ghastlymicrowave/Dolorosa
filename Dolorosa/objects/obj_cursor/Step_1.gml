


if keyboardMenus=2  && keyboardInUse=1 && (point_distance(lastmousex,lastmousey,mouse_x,mouse_y)>50){
keyboardInUse=0	
lastmousex = mouse_x
lastmousey = mouse_y
}
else if keyboardMenus=2 && keyboardInUse=0 {
	
if keyboard_check(ord("S")) || keyboard_check(ord("W"))|| keyboard_check(ord("D")) || keyboard_check(ord("A")){
keyboardInUse=1	
lastmousex = mouse_x
lastmousey = mouse_y
}
}

//show_debug_message(string(keyboardInUse))

