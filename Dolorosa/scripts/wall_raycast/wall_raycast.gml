///@func wall_raycast(distance)
///@arg distance
var out=array_create([0,4],0)
repeat(argument0){
var i=0
x+=lengthdir_x(1,direction)
y+=lengthdir_y(1,direction)
	if(instance_place(x,y,obj_breakend)!=noone){
		
		var targ = instance_place(x,y,obj_breakend)
		out[i,0]=targ.x	
		out[i,1]=targ.y
		instance_destroy(targ)
		
	}
	if(instance_place(x,y,obj_breakstart)!=noone){
	
		var targ = instance_place(x,y,obj_breakstart)
		out[i,2]=targ.x	
		out[i,3]=targ.y		
		instance_destroy(targ)
	
	}
	if((out[i,3]!=0)){
		
		i++
		
	}
}
return out
