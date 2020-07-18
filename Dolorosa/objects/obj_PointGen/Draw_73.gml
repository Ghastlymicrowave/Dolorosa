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
		draw_line(startObj.x,startObj.y,endObj.x,endObj.y)
		
		show_debug_message(string(startObj.x)+":"+string(startObj.y)+"\n"+string(endObj.x)+":"+string(endObj.y))
		

	}
}

arrayLength = pathPairs
for(var path = 0; path < arrayLength;path++){
	var obj1 = wallPaths[path,0]	
	var obj2 = wallPaths[path,1]	
	
	draw_line(obj1.x,obj1.y,obj2.x,obj2.y)
}