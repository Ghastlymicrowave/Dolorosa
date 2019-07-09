if !place_meeting(x,y,argument[0]){

	while place_meeting(x,y+vspeed,argument[0]){//vertical
		vspeed -= sign(vspeed)
	}
	while place_meeting(x+hspeed,y,argument[0]){//horizontal
		hspeed-=sign(hspeed)
	}
	var loops=0
	while collision_line(x,y,x+hspeed,y+vspeed,argument[0],1,1){
		loops++
	speed-=sign(speed)	
	
	if loops=5000 then break;
	}
	hspeed=sign(hspeed)*floor(abs(hspeed))
	vspeed=sign(vspeed)*floor(abs(vspeed))
	
	
}