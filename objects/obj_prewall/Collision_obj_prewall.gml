/// @description Insert description here
// You can write your code in this editor
#region get intersection
	var targ = instance_place(x,y,obj_prewall)
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

	if(point_distance(newx,newy,origin[0],origin[1])<point_distance(newx,newy,origin[2],origin[3])){
	
		wall_move(id,newx,newy,origin[0],origin[1])
	
	}else{
		
		wall_move(id,newx,newy,origin[2],origin[3])
	
	}
	

#endregion