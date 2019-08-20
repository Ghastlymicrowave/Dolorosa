//x=obj_player.x
//y=obj_player.y
//direction=obj_player.lastdir
direction=image_angle
speed=spd
x+=hspeed
y+=vspeed
speed=0
duration--
if duration = 0 then instance_destroy()


dir= direction