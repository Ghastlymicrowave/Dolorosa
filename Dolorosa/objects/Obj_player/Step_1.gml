vinput = keyboard_check(ord("S")) - keyboard_check(ord("W"))
hinput = keyboard_check(ord("D")) - keyboard_check(ord("A"))

// 6 frame startup?
if (vinput!=0)||(hinput!=0){
	
var inputdir = point_direction(0,0,hinput,vinput)
angledif = angle_difference(lastdir,inputdir)
if speed = 0 {
	lastdir=inputdir
} else{
lastdir -= angledif/4
}

if speed < 8 then speed ++
} else if speed > 0 then speed= speed*0.85
direction = lastdir

hspeed = floor(abs(hspeed))*sign(hspeed)
vspeed = floor(abs(vspeed))*sign(vspeed)

