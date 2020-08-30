/// @description Insert description here
// You can write your code in this editor
var targlist = ds_list_create()
instance_place_list(x,y,obj_prewall,targlist,0)
for(var i=ds_list_size(targlist);i>0;i--){
	var targ = ds_list_find_value(targlist,i-1)
	if(instance_exists(targ)){
	#region get intersection
		var intersector = wall_get(targ)
		var origin = wall_get(id)
		var newpoint = LinesIntersect(origin[0],origin[1],origin[2],origin[3],intersector[0],intersector[1],intersector[2],intersector[3])
		//  By substituting the return value (t) into the parametric form
		//  of the first line, the point of intersection can be determined.
		//  eg. x = x1 + t * (x2 - x1)
		//      y = y1 + t * (y2 - y1)
		var newx = origin[0] + newpoint * (origin[2] - origin[0])
		var newy = origin[1] + newpoint * (origin[3] - origin[1])
	#endregion

	#region move walls

		if(point_distance(newx,newy,origin[0],origin[1])>point_distance(newx,newy,origin[2],origin[3])){
	
			wall_move(id,newx,newy,origin[0],origin[1])
		
		}else{
		
			wall_move(id,newx,newy,origin[2],origin[3])
	
		}
		
		if(point_distance(newx,newy,intersector[0],intersector[1])>point_distance(newx,newy,intersector[2],intersector[3])){
	
			wall_move(targ,newx,newy,intersector[0],intersector[1])
		
		}else{
		
			wall_move(targ,newx,newy,intersector[2],intersector[3])
	
		}
	
	

	#endregion
	}
}
instance_destroy(instance_nearest(newx,newy,obj_wall))
instance_change(obj_wall,1)
for(var i=ds_list_size(targlist);i>0;i--){
	
	var targ = ds_list_find_value(targlist,i-1)
	with(targ){instance_change(obj_wall,1)}
	
}
var inst2 = instance_create_depth(x,y,0,obj_wall)
	inst2.sprite_index = spr_circleWallSprite
	inst2.image_xscale = sprite_height / inst2.sprite_width
	inst2.image_yscale = sprite_height / inst2.sprite_height