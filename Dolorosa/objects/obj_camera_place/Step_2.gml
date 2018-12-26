x=obj_player.x
y=obj_player.y

centerx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2
centery=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2

direction = point_direction(centerx,centery,mouse_x,mouse_y)
speed = point_distance(centerx,centery,mouse_x,mouse_y)*distancefactor

if obj_player.inventoryopen=1 then speed=0
x+=hspeed
y+=vspeed
speed=0