

draw_set_alpha(0.5)
draw_set_color(c_white)
var camW = camera_get_view_width(view_camera[0])
var camH = camera_get_view_height(view_camera[0])
var camX = camera_get_view_x(view_camera[0])
var camY = camera_get_view_y(view_camera[0])
if grid = 1{
var i = 0
	while i*gridW < camW+gridW{//vertical lines
	
	var xPos = +i*gridW - (camX % gridW) + camX
	var yPos = -(camY % gridH) + camY
	
	draw_line(xPos,yPos-gridH,xPos,yPos+camH+gridH)
	i++
	}
i = 0
	while i*gridH < camH+gridH{//horizontal lines
	
	var xPos = -(camX % gridW) + camX
	var yPos =  +i*gridH - (camY % gridH) + camY
	
	draw_line(xPos-gridW,yPos,xPos+camW+gridW,+yPos)
	i++
	}


	
}







draw_set_alpha(1)



//draw origin
draw_sprite(spr_prefab_origin,0,xOrigin,yOrigin)

if (cursorMode == 0){

if object_exists(objIndex)&&object_get_sprite(objIndex)!=-1{//sprite avalable
	var spr= object_get_sprite(objIndex)
	
	
	var spr_height = sprite_get_height(spr)
	var spr_width = sprite_get_width(spr)
	var spr_xoff = sprite_get_xoffset(spr)
	var spr_yoff = sprite_get_yoffset(spr)
	
	

if grid = 1 {
	var personalSclX = (scaleW*gridW)/sprite_get_width(spr) 
	var personalSclY = (scaleH*gridH)/sprite_get_height(spr) 	
} else {
	var personalSclX = scaleW
	var personalSclY = scaleH
}
var spr_v = (spr_height - spr_yoff) * personalSclY
var spr_h = (spr_width - spr_xoff) * personalSclX

draw_sprite(spr_prefab_origin,0,mousX-offsetX,mousY-offsetY)

	draw_set_color(c_black)
	draw_text(mousX-spr_h,mousY+spr_v+2,string(object_get_name(objIndex)))
	draw_text(mousX-spr_h,mousY+22+spr_v,"obj Index:"+string(objIndex))
	draw_set_color(c_white)
	draw_text(mousX-spr_h,mousY+spr_v,string(object_get_name(objIndex)))
	draw_text(mousX-spr_h,mousY+20+spr_v,"obj Index:"+string(objIndex))
	
	draw_sprite_ext(object_get_sprite(objIndex),0,mousX,mousY,personalSclX,personalSclY,rotation,c_white,1)
	
	var xw = (spr_width)*personalSclX
	var yh = (spr_height)*personalSclY

	xs[0] = -xw/2
	ys[0] = -yh/2	
	xs[1] = -xw/2
	ys[1] = yh/2
	xs[2] = xw/2
	ys[2] = yh/2
	xs[3] = xw/2
	ys[3] = -yh/2

	for (i = 0; i< 4; i++){

	var s = dsin(-rotation)
	var c = dcos(-rotation)

	xs[i] += (xw/2 - spr_xoff * personalSclX)
	ys[i] += (yh/2 - spr_yoff * personalSclY)
	
	var tempx = xs[i]
	var tempy = ys[i]
	
	xs[i] = tempx * c - tempy * s + mousX
	ys[i] = tempx * s + tempy * c + mousY

	}
	
	for (i = 3; i > 0; i--){
		//3-2 2-1 1-0 
		draw_line(xs[i],ys[i],xs[i-1],ys[i-1])
	
	}
	
	draw_line(xs[0],ys[0],xs[3],ys[3])
	
} else{//no sprite avalable
	draw_sprite(spr_prefab_origin,0,mousX-offsetX,mousY-offsetY)
	draw_text(mousX,mousY,string(object_get_name(objIndex)))
	draw_text(mousX,mousY+20,"obj Index:"+string(objIndex))	
}

}

//select mode
if (cursorMode==1){
	boberts = ds_list_create()
	instance_place_list(mouse_x,mouse_y,obj_prefabComponent,boberts,false)
	var target = noone
	
	if targetObject != noone {
		target = targetObject
		if instance_exists(target){
			draw_sprite(spr_prefab_origin,0,target.x,target.y)
			var targIndex = asset_get_index(target.name)
			draw_set_color(c_black)
			draw_text(mouse_x+15,mouse_y+22,"selected object:"+string(object_get_name(targIndex)))
			draw_text(mouse_x+15,mouse_y+42,"obj Index:"+string(targIndex))
			draw_text(mouse_x+15,mouse_y+62,"x :"+string(target.x))
			draw_text(mouse_x+15,mouse_y+82,"y :"+string(target.y))
			draw_set_color(c_white)
			draw_text(mouse_x+15,mouse_y+20,"selected object:"+string(object_get_name(targIndex)))
			draw_text(mouse_x+15,mouse_y+40,"obj Index:"+string(targIndex))	
			draw_text(mouse_x+15,mouse_y+60,"x :"+string(target.x))
			draw_text(mouse_x+15,mouse_y+80,"y :"+string(target.y))
		}
	}else if ds_list_size(boberts)>1 {
		if localPosition>ds_list_size(boberts)-1{
			localPosition = ds_list_size(boberts)-1
		} else if localPosition < 0 {
			localPosition = 0	
		}
		
		target = ds_list_find_value(boberts,localPosition) //instance_place(mouse_x,mouse_y,obj_prefabComponent)	
		if instance_exists(target){
			var targIndex = asset_get_index(target.name)
			draw_set_color(c_black)
			draw_text(mouse_x+15,mouse_y+2,string(object_get_name(targIndex)))
			draw_text(mouse_x+15,mouse_y+22,"obj Index:"+string(targIndex))
			draw_text(mouse_x+15,mouse_y+42,"object in stack:"+string(localPosition+1)+"/"+string(ds_list_size(boberts)))
			draw_set_color(c_white)
			draw_text(mouse_x+15,mouse_y,string(object_get_name(targIndex)))
			draw_text(mouse_x+15,mouse_y+20,"obj Index:"+string(targIndex))	
			draw_text(mouse_x+15,mouse_y+40,"object in stack:"+string(localPosition+1)+"/"+string(ds_list_size(boberts)))
		}
	}else if ds_list_size(boberts) > 0{
		localPosition=0
		target = ds_list_find_value(boberts,0) //instance_place(mouse_x,mouse_y,obj_prefabComponent)	
		if instance_exists(target){
			var targIndex = asset_get_index(target.name)
			draw_set_color(c_black)
			draw_text(mouse_x+15,mouse_y+2,string(object_get_name(targIndex)))
			draw_text(mouse_x+15,mouse_y+22,"obj Index:"+string(targIndex))
			draw_set_color(c_white)
			draw_text(mouse_x+15,mouse_y,string(object_get_name(targIndex)))
			draw_text(mouse_x+15,mouse_y+20,"obj Index:"+string(targIndex))	
		}
	}
	
	if targetObject!=noone {//has object
		
		if mouse_check_button_released(mb_right){//delete
			if targetObject==target{targetObject=noone}
			instance_destroy(target)
		}else if mouse_check_button_released(mb_left){//select
			
			if target != targetObject { targetObject = target} else {
			targetObject = noone	
			}
		}
	} else {//no object
	
		if target != noone {// no object, has target
			if mouse_check_button_released(mb_left){//reselect
				targetObject = target	
			}
		}else{//no target, no object
			//mouse_check_button_released(mb_left){//deselect
			//	targetObject = noone	
			//}
		}
	}
	
}

draw_text(camX+10,camY+10,"Room Width:"+string(roomW))
draw_text(camX+10,camY+30,"Room Height:"+string(roomH))
draw_text(camX+10,camY+50,"Grid Width:"+string(gridW))
draw_text(camX+10,camY+70,"Grid Height:"+string(gridH))
draw_text(camX+10,camY+90,"Object Xscale:"+string(scaleW))
draw_text(camX+10,camY+110,"Object Yscale:"+string(scaleH))
draw_text(camX+10,camY+130,"Rotation:"+string(rotation))
draw_text(camX+10,camY+150,"X offset:"+string(offsetX))
draw_text(camX+10,camY+170,"Y offset:"+string(offsetY))
switch(cursorMode){
case 0:
draw_text(camX+10,camY+210,"Scale: W/S/A/D\nChange scale mode: TAB\nChange cursor mode\nPan: middle mouse/Space\nRotate: Q/E\nChange X and Y placement offsets: arrow keys\nChange factor (small): SHIFT\nChange factor (large): CTRL\nReset camera position: M\nToggle grid: G\nSave room: I\nLoad room: O\nSave Prefab: K\nLoad Prefab: L")
break;
case 1:
if targetObject != noone{
	draw_text(camX+10,camY+210,"Scale: W/S/A/D\nChange scale mode: TAB\nChange cursor mode\nPan: middle mouse/Space\nSelect hovered object: LMB\nDelete hovered object: RMB\nRotate selected: Q/E\nAdjust selected object X and Y: arrow keys\nChange factor (small): SHIFT\nChange factor (large): CTRL\nReset camera position: M\nToggle grid: G\nSave room: I\nLoad room: O\nSave Prefab: K\nLoad Prefab: L")
} else {
	draw_text(camX+10,camY+210,"Scale: W/S/A/D\nChange scale mode: TAB\nChange cursor mode\nPan: middle mouse/Space\nSelect hovered object: LMB\nDelete hovered object: RMB\nReset camera position: M\nToggle grid: G\nSave room: I\nLoad room: O\nSave Prefab: K\nLoad Prefab: L")	
}
break;
}


var modeText = ""
switch (scaleMode) {
	case 0: modeText = "Room"
	break;
	case 1: modeText = "Grid"
	break;
	case 2: modeText = "Object"
	break;
}
var cursorText = ""
switch (cursorMode) {
	case 0: cursorText = "Place"
	break;
	case 1: cursorText = "Select"
	break;
}

modeText = "Scale Mode: "+modeText
cursorText = "Cursor Mode: "+cursorText
draw_text(camX+camW-string_width(modeText)-10,camY+10,modeText)
draw_text(camX+camW-string_width(cursorText)-10,camY+30,cursorText)
