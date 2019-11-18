x=obj_player.x
y=obj_player.y

//centerx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2
//centery=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2

//direction = obj_player.lastdir
direction = round(obj_player.lastdir/45)*45
speed = 120
x+=hspeed
y+=vspeed
speed=0