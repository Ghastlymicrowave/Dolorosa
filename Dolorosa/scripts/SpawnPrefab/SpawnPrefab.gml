//(string filename, anchor x, anchor y)

//spawns a dummy object and spawns prefab items relative to it's position


var spawner = instance_create_depth(argument[1],argument[2],0,obj_temp)

with (spawner){
	
	var file = file_text_open_read(argument[0])
	var iGrid = ds_grid_create(1,1)
	ds_grid_read(iGrid,file_text_read_string(file))

	var i, n, inst;
	n = ds_grid_width(iGrid)
	for (i = 0; i < n-1; i += 1) {
	
		var instIndex =		iGrid[# i,0]
		var xpos =			iGrid[# i,1]
		var ypos =			iGrid[# i,2]
		var spriteIndex =	iGrid[# i,3]
		var instDepth =		iGrid[# i,4]
		var optionA =		iGrid[# i,4]
		var optionB =		iGrid[# i,4]
		show_debug_message("------------ #"+string(i)+" : "+object_get_name(iGrid[# i,0]))
		show_debug_message("index : "+string(iGrid[# i,0]))
		show_debug_message("xpos  : "+string(iGrid[# i,1]))
		show_debug_message("ypos  : "+string(iGrid[# i,2]))
		show_debug_message("sprite: "+string(iGrid[# i,3]))
		show_debug_message("depth : "+string(iGrid[# i,4]))
	
		inst = instance_create_depth(x+xpos,y+ypos,0,instIndex)
		inst.sprite_index=spriteIndex 
		inst.optional_A = optionA
		inst.optional_B = optionB
		
		if ds_grid_height(iGrid)>6{ //loading from extended
			 inst.image_xscale = iGrid[# i,7]
			 inst.image_yscale = iGrid[# i,8]
			 inst.image_angle =	 iGrid[# i,9]
			 inst.image_alpha =	 iGrid[# i,10]
		}
		
	}

	ds_grid_destroy(iGrid)

	file_text_close(file)

}

instance_destroy(spawner)