x=obj_player.x
y=obj_player.y
//if has gun out{
//distancefactor=.5 + (obj_player.atktimeheld/100)/2
//}else{
//	distancefactor=.5	
//}
centerx= window_get_width()/2 //camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2
centery= window_get_height()/2//camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2

//direction = point_direction(centerx,centery,window_view_mouse_get_x(view_camera[0]),window_view_mouse_get_y(view_camera[0]))
direction = point_direction(centerx,centery,window_mouse_get_x(),window_mouse_get_y())
speed = point_distance(centerx,centery,window_mouse_get_x(),window_mouse_get_y())*distancefactor

if obj_player.playerstate == playerstates.inventory{
	var cX = obj_cursor.x - camera_get_view_x(view_camera[0])/camera_get_view_width(view_camera[0]) * window_get_width()
	var cY = obj_cursor.y - camera_get_view_y(view_camera[0])/camera_get_view_height(view_camera[0]) * window_get_height()
	
direction = point_direction(centerx,centery,cX,cY)
speed = point_distance(centerx,centery,cX,cY)*distancefactor	

	if obj_inventoryControl.side=0{
x= obj_player.x-camera_get_view_width(view_camera[0])/3
y= obj_player.y+camera_get_view_height(view_camera[0])/4
	}else if obj_inventoryControl.side=1{
x= obj_player.x-camera_get_view_width(view_camera[0])/-3
y= obj_player.y+camera_get_view_height(view_camera[0])/4		
	}
direction = point_direction(x,y,mouse_x,mouse_y)+180
speed/=10
//ScreenshakeAmt(0,20,0,1)
obj_camera_follow.time=10
//ScreenZoom(20,1,3)

//obj_camera_follow.screenshake =argument[0]
//obj_camera_follow.initalscreenshake =argument[0]
//obj_camera_follow.time = argument[0]*2

//if (random(1)) then mult = 1 else mult = -1


//obj_camera_follow.startingangle = (argument[2]) * mult
//obj_camera_follow.angle=obj_camera_follow.startingangle
//obj_camera_follow.duration = argument[1]
//obj_camera_follow.zoom = argument[3]


}else if instance_exists(obj_textDraw){
	y= obj_player.y+camera_get_view_height(view_camera[0])/4	
	direction = point_direction(x,y,mouse_x,mouse_y)+180
	speed/=10
}
x+=hspeed
y+=vspeed
speed=0