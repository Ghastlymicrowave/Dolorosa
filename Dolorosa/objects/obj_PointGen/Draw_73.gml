switch(t){
	case 0:
	#region frame 1
	draw_set_color(c_red)
	for (var i = 0; i < array_height_2d(nodesArray); i++){
		//show_debug_message("sidepaths"+string(sidepaths))
		//show_debug_message("node size"+string(ds_list_size(nodesList)-1))
		var obj1 = nodesArray[i,0]
		var obj2 = nodesArray[i,1]
	
		if i >= ds_list_size(nodesList)-1 {
		draw_set_color(c_blue)	
		}
		draw_line_width(obj1.x,obj1.y,obj2.x,obj2.y,10)
	
	
	
	
	
	
	
	
	
	}

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
			draw_set_color(c_green)
			with(instance_create_depth(x,y,0,obj_wall)){
				coords[0]=startObj.x
				coords[1]=startObj.y
				coords[2]=endObj.x
				coords[3]=endObj.y
				image_yscale=10
			}
			show_debug_message(string(startObj.x)+":"+string(startObj.y)+"\n"+string(endObj.x)+":"+string(endObj.y))
		

		}
	
	}

	arrayLength = pathPairs
	for(var path = 0; path < arrayLength;path++){
		var obj1 = wallPaths[path,0]	
		var obj2 = wallPaths[path,1]	
	
		with(instance_create_depth(x,y,0,obj_wall)){
				coords[0]=obj1.x
				coords[1]=obj1.y
				coords[2]=obj2.x
				coords[3]=obj2.y
				image_yscale=10
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
		while(instance_exists(obj_breakstart)){instance_destroy(obj_breakstart)}
		while(instance_exists(obj_breakend)){instance_destroy(obj_breakend)}
		while(instance_exists(obj_breakstend)){instance_destroy(obj_breakstend)}
	break;
	#endregion
	t++
}

