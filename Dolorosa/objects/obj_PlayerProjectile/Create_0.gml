x=obj_player.x+obj_player.sprite_width*cos(obj_player.aimdir*pi/180)/2
y=obj_player.y+obj_player.sprite_height*-sin(obj_player.aimdir*pi/180)/2
//range=20
duration=500

dir = image_angle
spd = 20
knockback = 5
initalknockbacktime=10// needs to = knockback

knockbackmult = 60//knockback's inital speed

iframes=20

knockbacktype=0