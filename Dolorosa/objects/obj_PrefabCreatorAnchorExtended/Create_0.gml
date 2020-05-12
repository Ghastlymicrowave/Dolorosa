var iGrid = ds_grid_create(instance_count,5)
//all entries need to be interger values, floats will be rounded
//x,0	instance
//x,1	xcord
//x,2	ycord
//x,3	spriteid (optional)
//x,4	depth
//x,5	optinal paramater a

var I, i, n, inst, thisFound;
thisFound=0
n = instance_number(all);
for (I = 0; I < n; I += 1) {
  inst = instance_find(all, I)
  
  if inst == id{
	thisFound=1  
	I++
	inst = instance_find(all, I)
  }
  
  i = I - thisFound
  //object index
  
  iGrid[# i,0]=inst.object_index
  //relatative x pos
  iGrid[# i,1]=inst.x - x
  //relative y pos
  iGrid[# i,2]=inst.y - y
  //sprite id
  iGrid[# i,3]=inst.sprite_index
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
  show_debug_message("------------ #"+string(i)+" : "+object_get_name(iGrid[# i,0]))
  show_debug_message("index : "+string(iGrid[# i,0]))
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


var file = file_text_open_write("testFile")
file_text_write_string(file,ds_grid_write(iGrid))
file_text_close(file)

ds_grid_destroy(iGrid)
//acessor: grid_index[# xpos, ypos]

