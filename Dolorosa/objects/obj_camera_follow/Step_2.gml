



hspd= obj_camera_place.x-x
vspd= obj_camera_place.y-y


//if obj_player.wielding=1{ has gun out
//x+= hspd/5 
//y+= vspd/5
//} else{
x+= hspd/10
y+= vspd/10	
//}


/*screenZoomTime=0
 screenRotateTime=0
 screenshakeTime=0*/
 
 
 //case 0, linear
 //     1, cosine, fastest at end
 //     2, cosine, slow at beginning and end
 //     3, cosine, slow at end
#region Zoom
if screenZoomTime>0{
screenZoomTime--;
if screenZoomTime = 0 {screenScaleInput=1}else{
var zoomPercent = 0
	switch(zoomCurve){
	case 0: zoomPercent = screenZoomTime/iniScreenZoomTime
	break;
	case 1: zoomPercent = CosineCurveDec(screenZoomTime,iniScreenZoomTime)
	break;
	case 2: zoomPercent = CosineCurveDec2(screenZoomTime,iniScreenZoomTime)
	break;
	case 3: zoomPercent = CosineCurveDec3(screenZoomTime,iniScreenZoomTime)
	break;
	}
screenScaleInput= zoomPercent*((Zoom/(Zoom*Zoom))-1)+1
}
screenScale += (screenScaleInput-screenScale)/1.5
camera_set_view_size(view_camera[0],viewh*(screenScale),viewv*(screenScale))
}
#endregion


#region Rotate
if screenRotateTime>0{
screenRotateTime--;
if screenRotateTime=0{angle=0}
	switch(rotateCurve){
	case 0: angleInput = angle*(screenRotateTime/iniScreenRotateTime)
	break;
	case 1: angleInput = angle*CosineCurveDec(screenRotateTime,iniScreenRotateTime)
	break;
	case 2: angleInput = angle*CosineCurveDec2(screenRotateTime,iniScreenRotateTime)
	break;
	case 3: angleInput = angle*CosineCurveDec3(screenRotateTime,iniScreenRotateTime)
	break;
	}
realAngle = (angleInput - realAngle)/1.5
camera_set_view_angle(view_camera[0],realAngle)
}
#endregion


camera_set_view_pos(view_camera[0],x-camera_get_view_width(view_camera[0])/2,y-camera_get_view_height(view_camera[0])/2)


#region Shake
if screenshakeTime>0{
screenshakeTime--;	
if screenshakeTime = 0 {var shakePwr=0}else{
	var shakePwr=0
	switch(shakeCurve){
	case 0: shakePwr = screenshakeTime/iniScreenshakeTime*screenshakePower
	break;
	case 1: shakePwr = CosineCurveDec(screenshakeTime,iniScreenshakeTime)*screenshakePower
	break;
	case 2: shakePwr = CosineCurveDec2(screenshakeTime,iniScreenshakeTime)*screenshakePower
	break;
	case 3: shakePwr = CosineCurveDec3(screenshakeTime,iniScreenshakeTime)*screenshakePower
	break;
	}
}

	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+ (1-2*(random(1))) * random(shakePwr+1),camera_get_view_y(view_camera[0])+(1-2*(random(1))) * random(shakePwr+1))
}
#endregion


//check if wall is within bounds, if so- draw it
var x1 = camera_get_view_x(view_camera[0])
var y1 = camera_get_view_y(view_camera[0])
var x2 = camera_get_view_width(view_camera[0]) + x1
var y2 = camera_get_view_height(view_camera[0]) + y1

for (var i = 0; i < instance_number(obj_wall); ++i){
	var inst = instance_find(obj_wall,i)
		if collision_rectangle(x1,y1,x2,y2,inst,false,true){
			inst.visible = 1
		} else {
			inst.visible = 0
		}
	
}


////////////////////////////////////////////////////////////////////////////
/*

if keyboard_check_pressed(ord("G")) then ScreenshakeAmt(50,50,random(90)+15,4,0)
if keyboard_check_pressed(ord("H")) then ScreenshakeAmt(200,5,random(20)+20,1.5,0)
if keyboard_check_pressed(ord("J")) then ScreenshakeAmt(2000,40,random(360),1,0)
if keyboard_check_pressed(ord("K")) then ScreenshakeAmt(1,40,0,1,1)
if keyboard_check_pressed(ord("L")) then ScreenshakeAmt(random(1000)+1,random(1000),random(1000),random(1000),0)
*/