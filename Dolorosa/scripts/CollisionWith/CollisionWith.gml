if !place_meeting(x,y,argument[0]){

	while place_meeting(x,y+vspeed,argument[0]){//vertical
		vspeed -= sign(vspeed)
	}
	while place_meeting(x+hspeed,y,argument[0]){//horizontal
		hspeed-=sign(hspeed)
	}
	while place_meeting(x+hspeed,y+vspeed,argument[0]){//both
		speed-=sign(speed)
		hspeed=sign(hspeed)*floor(abs(hspeed))
		vspeed=sign(vspeed)*floor(abs(vspeed))
	}
}