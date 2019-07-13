x=obj_player.x
y=obj_player.y
direction=obj_player.lastdir
image_angle=direction
speed=range
x+=hspeed
y+=vspeed
speed=0
duration--
if duration = 0 then instance_destroy()

dir= direction