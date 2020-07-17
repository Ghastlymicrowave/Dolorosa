var iGrid = ds_grid_create(instance_count-1,11)
//all entries need to be interger values, floats will be rounded
//x,0	instance
//x,1	xcord
//x,2	ycord
//x,3	spriteid (optional)
//x,4	depth
//x,5	optinal paramater a

//arg[0] origin x
//arg[1] origin y
//arg[2] room width
//arg[3] room height

var i, n, inst;

n = instance_number(obj_prefabComponent);
for (i = 0; i < n; i += 1) {
  inst = instance_find(obj_prefabComponent, i)
  
  //object index
  iGrid[# i,0]=inst.name
  //relatative x pos
  iGrid[# i,1]=inst.x - argument[0]
  //relative y pos
  iGrid[# i,2]=inst.y - argument[1]
  //sprite id
  iGrid[# i,3]=sprite_get_name(inst.sprite_index)
  //depth
  iGrid[# i,4]=inst.depth
  if variable_instance_exists(inst,"optional_A"){
  //optional a
  iGrid[# i,5]=0
  }else {iGrid[# i,5]=0}
  if variable_instance_exists(inst,"optional_B"){
  //optional b
  iGrid[# i,6]=0
  }else{ iGrid[# i,6]=0}
  // --------------------------------paramaters added in this function
  //x Scale
  iGrid[# i,7]=inst.image_xscale
  //y Scale
  iGrid[# i,8]=inst.image_yscale
  //rotation
  iGrid[# i,9]=inst.image_angle
  //alpha
  iGrid[# i,10]=inst.image_alpha
  show_debug_message("------------ #"+string(i)+" : "+iGrid[# i,0])
  //show_debug_message("index : "+string(iGrid[# i,0]))
  show_debug_message("xpos  : "+string(iGrid[# i,1]))
  show_debug_message("ypos  : "+string(iGrid[# i,2]))
  show_debug_message("sprite: "+string(iGrid[# i,3]))
  show_debug_message("depth : "+string(iGrid[# i,4]))
  show_debug_message("optionA: "+string(iGrid[# i,5]))
  show_debug_message("optionB: "+string(iGrid[# i,6]))
  show_debug_message("xScale : "+string(iGrid[# i,7]))
  show_debug_message("yScale : "+string(iGrid[# i,8]))
  show_debug_message("rotation: "+string(iGrid[# i,9]))
  show_debug_message("alpha : "+string(iGrid[# i,10]))
}


//var file = file_text_open_write("outputPrefab")
//file_text_write_string(file,ds_grid_write(iGrid))
//file_text_close(file)

var finalOutput = ds_list_create()
ds_list_add(finalOutput,ds_grid_write(iGrid))//grid
ds_list_add(finalOutput,argument[2])//room w
ds_list_add(finalOutput,argument[3])//room h

var outFile = get_save_filename("*.rmm","")
show_debug_message("saving "+string(outFile))
if outFile!=""{//save
	outFile = file_text_open_write_ns(outFile,65001) 
	string_save_ns(ds_list_write(finalOutput),outFile)
	file_text_close_ns(outFile)
	
} else {
	show_message("there was an error saving")	
}

ds_grid_destroy(iGrid)