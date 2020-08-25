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

