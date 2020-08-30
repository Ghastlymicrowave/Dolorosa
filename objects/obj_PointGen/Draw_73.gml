switch(t){
	case 0:
	#region frame 1
	//draw_set_color(c_red)
	//for (var i = 0; i < array_height_2d(nodesArray); i++){
	//	//show_debug_message("sidepaths"+string(sidepaths))
	//	//show_debug_message("node size"+string(ds_list_size(nodesList)-1))
	//	var obj1 = nodesArray[i,0]
	//	var obj2 = nodesArray[i,1]
	
	//	if i >= ds_list_size(nodesList)-1 {
	//	draw_set_color(c_blue)	
	//	}
	//	draw_line_width(obj1.x,obj1.y,obj2.x,obj2.y,10)
	
	
	
	
	
	
	
	
	
	//}

	//create wall objects

	var arrayLength 
	for(var node = 0; node< ds_list_size(nodesList);node++){

		var thisNode = ds_list_find_value(nodesList,node)
		var thisArray = thisNode.walls	
		arrayLength = thisNode.wallPairs
	
		//show_debug_message(thisNode.walls)
		//show_debug_message(thisNode.wallPairs)
	
		for(var wall = 0; wall < arrayLength; wall++){
			var startObj = thisArray[wall,0]
			var endObj = thisArray[wall,1]

			var inst = instance_create_depth(x,y,0,obj_wall)
			objx1=startObj.x
			objy1=startObj.y
			objx2=endObj.x
			objy2=endObj.y
			inst.host = id
			
			with (inst){
				var x1 = host.objx1
				var y1 = host.objy1
				var x2 = host.objx2
				var y2 = host.objy2
				x = x1
				y = y1
				image_angle=point_direction(x1,y1,x2,y2)
				image_yscale = host.wallWidth / sprite_height
				if(point_distance(x1,y1,x2,y2)>15){
					image_xscale=point_distance(x1,y1,x2,y2) / sprite_width
					var inst2 = instance_create_depth(x2,y2,0,obj_wall)
					inst2.sprite_index = spr_circleWallSprite
					inst2.image_xscale = host.wallWidth / inst2.sprite_width
					inst2.image_yscale = host.wallWidth / inst2.sprite_height
				}else{instance_destroy()}
			}
			
			//with(inst)){
				
			//	x=host.x1
			//	y=host.y1
			//	y=x2
			//	
			//	
			//}
			
			show_debug_message(string(startObj.x)+":"+string(startObj.y)+"\n"+string(endObj.x)+":"+string(endObj.y))
		

		}
	
	}

	arrayLength = pathPairs
	for(var path = 0; path < arrayLength;path++){
		var obj1 = wallPaths[path,0]	
		var obj2 = wallPaths[path,1]	
		//if !instance_exists(obj1)||!instance_exists(obj2){
		//continue;	
		//}
		var inst = instance_create_depth(x,y,0,obj_wall)
			objx1=obj1.x
			objy1=obj1.y
			objx2=obj2.x
			objy2=obj2.y
			inst.host = id
			inst.num = path
			with (inst){
				
				var x1 = host.objx1
				var y1 = host.objy1
				var x2 = host.objx2
				var y2 = host.objy2
				x = x1
				y = y1
				
				image_angle=point_direction(x1,y1,x2,y2)
				image_yscale = host.wallWidth / sprite_height
				if(point_distance(x1,y1,x2,y2)>15){
					image_xscale=point_distance(x1,y1,x2,y2) / sprite_width
					var inst2 = instance_create_depth(x,y,0,obj_wall)
					inst2.sprite_index = spr_circleWallSprite
					inst2.image_xscale = host.wallWidth / inst2.sprite_width
					inst2.image_yscale = host.wallWidth / inst2.sprite_height
					
				}else{instance_destroy()}
			}
	}
	#endregion
	t++
	break;
	case 1:
	#region frame 2
	//delete nodes
		for(var node = 0; node< ds_list_size(nodesList);node++){

			var thisNode = ds_list_find_value(nodesList,node)

			instance_destroy(thisNode)
			ds_list_delete(nodesList,node)
		}
	//delete corner objects
		//while(instance_exists(obj_breakstart)){instance_destroy(obj_breakstart)}
		//while(instance_exists(obj_breakend)){instance_destroy(obj_breakend)}
		//while(instance_exists(obj_breakstend)){instance_destroy(obj_breakstend)}
	break;
	#endregion
	t++
}

