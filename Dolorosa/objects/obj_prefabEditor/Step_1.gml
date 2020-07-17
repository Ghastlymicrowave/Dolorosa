//load file
//
// compressed as:

// ds list:
//			0 ds grid: 
//					prefab data
//			1 room width
//			2 room height
//
if (keyboard_check_pressed(ord("O"))){//load ROOM (NOT PREFAB)
var inputFile = get_open_filename("*.rmm","")
show_debug_message("loading"+string(inputFile))
	if inputFile!=""{//open
		
		instance_destroy(obj_prefabComponent)
		
		show_debug_message(inputFile)
		inputFile=file_text_open_read_ns(inputFile,65001) 
			var inputData = string_load_ns(inputFile)
		file_text_close_ns(inputFile)
		
		var inputList = ds_list_create()
		ds_list_read(inputList,inputData)
		
		roomW = ds_list_find_value(inputList,1)
		roomH = ds_list_find_value(inputList,2)
		SpawnPrefabForEditing(ds_list_find_value(inputList,0),xOrigin,yOrigin)
		ds_list_destroy(inputList)
	}
}else if (keyboard_check_pressed(ord("I"))) {//save ROOM
	if instance_count > 1{
		ConstructRoomPrefab(xOrigin,yOrigin,roomW,roomH)
	}
}else if (keyboard_check_pressed(ord("L"))){//load PREFAB
var inputFile = get_open_filename("*.pfb","")
show_debug_message("loading"+string(inputFile))
	if inputFile!=""{//open
		
		instance_destroy(obj_prefabComponent)
		
		show_debug_message(inputFile)
		inputFile=file_text_open_read_ns(inputFile,65001) 
			var inputData = string_load_ns(inputFile)
		file_text_close_ns(inputFile)
		
		SpawnPrefabForEditing(inputData,xOrigin,yOrigin)

	}
}else if (keyboard_check_pressed(ord("K"))) {//save PREFAB
	if instance_count > 1{
		ConstructPrefab(xOrigin,yOrigin)
	}
}

//reset cam
var windW = window_get_width()
var windH = window_get_height()
view_wport[0] = windW
view_hport[0] = windH


if (view_wport[0] != surface_get_width(application_surface) || view_hport[0] != surface_get_height(application_surface) ){
	surface_resize(application_surface,view_wport[0],view_hport[0])
	camera_set_view_size(view_camera[0],window_get_width(),window_get_height())
}

if keyboard_check_pressed(ord("M")){

//camera_destroy(view_camera[0]) //view_camera[0] = camera_create_view(0, 0, window_get_width(),window_get_height())
camera_set_view_pos(view_camera[0],-window_get_width()/2,-window_get_height()/2)
//view_set_hport(view_camera[0],window_get_height())
//view_set_hport(view_camera[0],window_get_width())
}

if keyboard_check_pressed(ord("R")){//reset
	rotation =  0
	scaleW = 1
	scaleH = 1
	offsetX = 0
	offsetY = 0
	targetObject = noone
}


#region panning
if mouse_check_button(mb_middle)||keyboard_check(vk_space){
if panning!=1 {//panning start
	camPos_x = camera_get_view_x(view_camera[0])
	camPos_y = camera_get_view_y(view_camera[0])
	panning = 1
	panStart_x = window_mouse_get_x()
	panStart_y = window_mouse_get_y()
	}else{//panning
	var relX = camPos_x+panStart_x-window_mouse_get_x()
	var relY = camPos_y+panStart_y-window_mouse_get_y()
	camera_set_view_pos(view_camera[0],relX,relY)
	}
} else{
	if panning==1 {//panning end
		camPos_x = camera_get_view_x(view_camera[0])
		camPos_y = camera_get_view_y(view_camera[0])
		panning = 0
	}
}
#endregion



var oldIndex = objIndex
objIndex+=mouse_wheel_up()-mouse_wheel_down()
if !object_exists(objIndex){
objIndex=oldIndex	
}

if keyboard_check_pressed(vk_tab){
scaleMode++
if scaleMode==3{scaleMode=0}
}

if keyboard_check_pressed(vk_alt){
cursorMode++
if cursorMode==2{cursorMode=0}
}

switch (scaleMode){
					case 0://room changing
					
var roomChangeH = keyboard_check(ord("D")) - keyboard_check(ord("A"))
var roomChangeV = keyboard_check(ord("W")) - keyboard_check(ord("S"))

if keyboard_check(vk_shift){
	roomChangeH *= 10
	roomChangeV *= 10
} else if keyboard_check(vk_control){
	roomChangeH *= 100
	roomChangeV *= 100	
}

if keyboard_check_pressed(ord("D"))||keyboard_check_pressed(ord("A"))||keyboard_check_pressed(ord("W"))||keyboard_check_pressed(ord("S")){
roomW = max(roomW+roomChangeH,0)
roomH = max(roomH+roomChangeV,0)

}
					break;
					case 1://grid changing
									
var gridChangeH = keyboard_check(ord("D")) - keyboard_check(ord("A"))
var gridChangeV = keyboard_check(ord("W")) - keyboard_check(ord("S"))

if keyboard_check(vk_shift){
	gridChangeH *= 10
	gridChangeV *= 10
} else if keyboard_check(vk_control){
	gridChangeH *= 100
	gridChangeV *= 100	
}

if keyboard_check_pressed(ord("D"))||keyboard_check_pressed(ord("A"))||keyboard_check_pressed(ord("W"))||keyboard_check_pressed(ord("S")){
gridW = max(gridW+gridChangeH,1)
gridH = max(gridH+gridChangeV,1)
}
					break;
					case 2://object scale changing
var scaleChangeH = (keyboard_check(ord("D")) - keyboard_check(ord("A")))/10
var scaleChangeV = (keyboard_check(ord("W")) - keyboard_check(ord("S")))/10

if keyboard_check(vk_shift){
	scaleChangeH *= 2
	scaleChangeV *= 2
} else if keyboard_check(vk_control){
	scaleChangeH *= 8
	scaleChangeV *= 8
}

if keyboard_check_pressed(ord("D"))||keyboard_check_pressed(ord("A"))||keyboard_check_pressed(ord("W"))||keyboard_check_pressed(ord("S")){
scaleW = max(scaleW+scaleChangeH,.1)
scaleH = max(scaleH+scaleChangeV,.1)
}

}

//offsets
if cursorMode == 0 {

var xoffChange = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
var yoffChange = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
if keyboard_check(vk_shift){
	xoffChange *= 5
	yoffChange *= 5
} else if keyboard_check(vk_control){
	xoffChange *= 10
	yoffChange *= 10
}
offsetX += xoffChange
offsetY += yoffChange

} else if cursorMode == 1 && targetObject!=noone{ // move selected object
	
var xoffChange = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
var yoffChange = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
if keyboard_check(vk_shift){
	xoffChange *= 5
	yoffChange *= 5
} else if keyboard_check(vk_control){
	xoffChange *= 10
	yoffChange *= 10
}
targetObject.x += xoffChange
targetObject.y += yoffChange

}


//grid toggle
if keyboard_check_pressed(ord("G")){
grid = !grid	
}


if cursorMode == 0 {

	//rotation
	var rotChange = keyboard_check(ord("Q")) - keyboard_check(ord("E"))
	if keyboard_check(vk_shift){
		rotChange *= 45
	} else if keyboard_check(vk_control){
		rotChange *= 90
	}
	if keyboard_check_pressed(ord("E"))||keyboard_check_pressed(ord("Q")){
		rotation += rotChange
		if rotation < 0 {
			rotation+=360	
		}
		if rotation > 360 {
			rotation-=360	
		}
	}
} else if cursorMode == 1 && targetObject!=noone{//rotate selected object
	
	var rotChange = keyboard_check_pressed(ord("Q")) - keyboard_check_pressed(ord("E"))

	if keyboard_check(vk_shift){
		rotChange *= 45
	} else if keyboard_check(vk_control){
		rotChange *= 90
	}
	targetObject.image_angle+=rotChange
	if targetObject.image_angle < 0 {
		targetObject.image_angle+=360	
	}
	if targetObject.image_angle > 360 {
		targetObject.image_angle-=360	
	}
}

if cursorMode == 1 && targetObject==noone {//local position	
	if mouse_wheel_up() { localPosition++}
	if mouse_wheel_down() { localPosition--}
}

if grid == 1 {//snapped
	mousX = round(mouse_x/gridW)*gridW+offsetX
	mousY = round(mouse_y/gridH)*gridH+offsetY
} else {
	mousX = round(mouse_x)+offsetX
	mousY = round(mouse_y)+offsetY
}

if (cursorMode == 0) {
	if mouse_check_button_released(mb_left){
		var bobert = instance_create_depth(mousX,mousY,0,obj_prefabComponent)
		bobert.name = object_get_name(objIndex)
		bobert.sprite_index = object_get_sprite(objIndex)
		bobert.image_angle = rotation
			
		var spr= object_get_sprite(objIndex)
			
		if grid = 1 {
			var personalSclX = (scaleW*gridW)/sprite_get_width(spr) 
			var personalSclY = (scaleH*gridH)/sprite_get_height(spr) 	
		} else {
			var personalSclX = scaleW
			var personalSclY = scaleH
		}
		
		bobert.image_xscale = personalSclX
		bobert.image_yscale = personalSclY
	}
} else if cursorMode == 1 && targetObject!=noone{ //scale selected object HARD TO IMPLIMENT, NOT A THING FOR NOW
	//HAVE TO FIND A WAY TO STORE THE OBJECT'S SCALE OUTSIDE OF IT'S XSCALE YSCALE 
	
}
