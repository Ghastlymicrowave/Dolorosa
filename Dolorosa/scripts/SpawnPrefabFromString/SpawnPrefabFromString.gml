///@func SpawnPrefab( prefabString, anchorX, anchorY)
///@desc 
///@arg prefab as string
///@arg anchorX
///@arg anchorY


//spawns a dummy object and spawns prefab items relative to it's position


//var spawner = instance_create_depth(argument[1],argument[2],0,obj_temp)

//with (spawner){

	var iGrid = ds_grid_create(1,1)
	ds_grid_read(iGrid,argument[0])

	var bong, n, component;

	n = ds_grid_width(iGrid)
	show_debug_message(ds_grid_width(iGrid))
	show_debug_message(ds_grid_height(iGrid))
	
	for (bong = 0; bong< n-1; bong += 1) {
		show_debug_message(bong)
		var instIndex =		asset_get_index(iGrid[# bong,0])//changed to name
		var xpos =			iGrid[# bong,1]
		var ypos =			iGrid[# bong,2]
		var spriteIndex =	asset_get_index(iGrid[# bong,3])
		var instDepth =		iGrid[# bong,4]
		var optionA =		iGrid[# bong,5]
		var optionB =		iGrid[# bong,6]
		show_debug_message("------------ #"+string(bong)+" : "+string(iGrid[# bong,0]))
		show_debug_message("index : "+string(iGrid[# bong,0]))
		show_debug_message("xpos  : "+string(iGrid[# bong,1]))
		show_debug_message("ypos  : "+string(iGrid[# bong,2]))
		show_debug_message("sprite: "+string(iGrid[# bong,3]))
		show_debug_message("depth : "+string(iGrid[# bong,4]))
		
		
		component = instance_create_depth(argument[1]+xpos,argument[2]+ypos,instDepth,instIndex)
		//show_debug_message(spriteIndex)
		//show_debug_message(instIndex)
		component.sprite_index=spriteIndex 
		//component.name = iGrid[# bong,0]
		//inst.optional_A = optionA
		//inst.optional_B = optionB
		
		if ds_grid_height(iGrid)>6{ //loading from extended
			 show_debug_message("LoadingFromExt")
			 component.image_xscale = iGrid[# bong,7]
			 component.image_yscale = iGrid[# bong,8]
			 component.image_angle =  iGrid[# bong,9]
			 component.image_alpha =  iGrid[# bong,10]
		}
		
	}

	ds_grid_destroy(iGrid)





