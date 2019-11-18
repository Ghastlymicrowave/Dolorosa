x=obj_player.x
y=obj_player.y
direction=round(obj_player.lastdir/45)*45

image_angle=direction
speed=range
x+=hspeed
y+=vspeed
speed=0
duration--
if duration = 0 then instance_destroy()

dir= direction