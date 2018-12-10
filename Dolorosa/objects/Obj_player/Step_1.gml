vinput = keyboard_check(ord("S")) - keyboard_check(ord("W"))
hinput = keyboard_check(ord("D")) - keyboard_check(ord("A"))

// 6 frame startup?
if (vinput!=0)||(hinput!=0){
inputdir = point_direction(0,0,hinput,vinput)
lastdir = direction - inputdir/2
speed = 8
} else if speed > 0 then speed= speed*0.85
direction = lastdir

hspeed = floor(abs(hspeed))*sign(hspeed)
vspeed = floor(abs(vspeed))*sign(vspeed)

