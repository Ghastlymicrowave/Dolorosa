



hspd= obj_camera_place.x-x
vspd= obj_camera_place.y-y

x+= hspd/10
y+= vspd/10



if screenshake>0{
	
	screenshake= screenshake- initalscreenshake/duration
	
	percent = screenshake/time
	angle = startingangle*percent
	
	if screenshake=0{ screenshake=0;angle=0}
	
	camera_set_view_angle(view_camera[0],angle)
	//960 x 540
	//screenScale = screenshake/15
	screenScaleInput= 1 - screenshake/time/zoom
	screenScale += (screenScaleInput-screenScale)/1.5
	
	//if screenScale<1 then screenScale=1
	camera_set_view_size(view_camera[0],viewh*(screenScale),viewv*(screenScale))
	camera_set_view_pos(view_camera[0],x-camera_get_view_width(view_camera[0])/2,y-camera_get_view_height(view_camera[0])/2)
	
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+ (1-2*(random(1))) * random(screenshake+1),camera_get_view_y(view_camera[0])+(1-2*(random(1))) * random(screenshake+1))
	
	//x+= (1-2*(random(1))) * random(screenshake+1)
	//y+= (1-2*(random(1))) * random(screenshake+1)
	
	
} else camera_set_view_pos(view_camera[0],x-camera_get_view_width(view_camera[0])/2,y-camera_get_view_height(view_camera[0])/2)



if keyboard_check_pressed(ord("G")) then ScreenshakeAmt(50,50,random(90)+15,4)
if keyboard_check_pressed(ord("H")) then ScreenshakeAmt(200,5,random(20)+20,1.5)
if keyboard_check_pressed(ord("J")) then ScreenshakeAmt(2000,40,random(360),1)
if keyboard_check_pressed(ord("K")) then ScreenshakeAmt(1,40,0,1)

