


depth=-500


if obj_player.inventoryopen=1{
	draw_self()
	var ivSize=ds_list_size(global.inventory)
	var ivDivided=ivSize/objectsPerRow
	
	if slotx=-1{slotx=0;sloty=0;lastslotx=0;lastsloty=0}
	
	if slotx!=lastslotx || sloty!=lastsloty{
	slotx=lastslotx
	sloty=lastsloty
	}
	page= floor(sloty/MaxRowsPerPage) 
	
	var v =keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"))
	var h =keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"))
	
	var v1 =keyboard_check(ord("S")) - keyboard_check(ord("W"))
	var h1 =keyboard_check(ord("D")) - keyboard_check(ord("A"))
	
	if (abs(v1)xor(abs(h1))) {if heldtime <20 {heldtime++;heldwaittime=8} }else heldtime=0
	
	if heldtime=20{
		heldwaittime--
		if heldwaittime=0{
		v=v1
		h=h1
		heldwaittime=8//ads a delay for holding down keys
		} 
	}
	
	if (h>0 && slotx<objectsPerRow-1)||(h<0&&slotx>0) then slotx+=h
	if (v>0)||(v<0&&sloty>0) { sloty+=v
		
		
		
		} //&&sloty<MaxRowsPerPage-1
	gotopageheight=pageheight*page
	followpageheight+= (gotopageheight-followpageheight)/2


var ii=0//don't delete this line
for (var i = 0; i<floor(ivDivided);i++){//for each full row
	//loops for each full row
	
	//if i > MaxRowsPerPage-1 then break;
	
	for (var ii=0; ii<objectsPerRow;ii++){
		var xx = ivx+ii*ivw/objectsPerRow+((ii+1)*ivw/objectsPerRow)/ivw+ivw/objectsPerRow/2
		var yy = ivy+i*ivh/MaxRowsPerPage+((i+1)*ivh/MaxRowsPerPage)/ivh+ivh/MaxRowsPerPage/2 -followpageheight
		//instance_create_depth(xx,yy,-5000,obj_inventoryItem)	
		//			this needs to be reformatted to take the information from a 2d array contaning the object's ID and all the information about it
		
			if obj_player.inventoryopen=1 && (obj_cursor.keyboardMenus=1|| obj_cursor.keyboardMenus=2) && (sloty=i&&slotx=ii){
			//show_debug_message(string(slotx)+string(ii)+string(sloty)+string(i)+"MOVED")
			obj_cursor.keyboardx=xx
			obj_cursor.keyboardy=yy
			lastslotx=slotx
			lastsloty=sloty
			}//else show_debug_message(string(slotx)+string(ii)+string(sloty)+string(i))
		
		var spr = sp_placeholderItem
		
		if point_in_rectangle(xx,yy,x,y,x+sprite_width,y+sprite_height){
		draw_sprite(spr,depth-1,xx,yy)
		draw_rectangle(xx-ivw/objectsPerRow/2,yy-ivh/MaxRowsPerPage/2,xx+ivw/objectsPerRow/2,yy+ivh/MaxRowsPerPage/2,5)
	
		if collision_rectangle(xx-ivw/objectsPerRow/2,yy-ivh/MaxRowsPerPage/2,xx+ivw/objectsPerRow/2,yy+ivh/MaxRowsPerPage/2,obj_cursor,1,1)&&mouse_check_button_pressed(mb_left){
		//idk it's clicked	
		show_debug_message("clicked item "+ string(ii+i*objectsPerRow)+" object: "+ string(ds_list_find_value(global.inventory,ii+i*objectsPerRow)))
		}
		}
	}
	
	//x = ii*width/objectsPerRow
	//make annother for loop for each object using ii as the horiz location
	//draws object in slot (MaxRowsPerPage*(page-1)+ii)
	}
	//show_debug_message(string(i)+"full rows")
	if floor(ivDivided)!=ivDivided{
		
		
		for (var iii=floor(i*objectsPerRow); iii<ivSize;iii++){ //iii = 0+floor(i*objectsPerRow)
			//show_debug_message(string(iii)+"leftover")
			
			var xx = ivx+(iii-round(i*objectsPerRow))*ivw/objectsPerRow+(ivw/objectsPerRow)/ivw+ivw/objectsPerRow/2
			var yy = ivy+i*ivh/MaxRowsPerPage+((i+1)*ivh/MaxRowsPerPage)/ivh+ivh/MaxRowsPerPage/2 -followpageheight
			//instance_create_depth(xx,yy,-1,obj_inventoryItem)	
			//show_debug_message(string(iii)+" 3,2 "+string(ii))
			if obj_player.inventoryopen=1 && (obj_cursor.keyboardMenus=1||obj_cursor.keyboardMenus=2)&&(sloty=i&&slotx=iii-floor(i*objectsPerRow)){
				
				//show_debug_message(string(slotx)+":"+string(iii-floor(i*objectsPerRow))+","+string(sloty)+":"+string(i))
			obj_cursor.keyboardx=xx
			obj_cursor.keyboardy=yy
			lastslotx=slotx
			lastsloty=sloty
			
			}//else show_debug_message(string(slotx)+":"+string(iii-floor(i*objectsPerRow))+","+string(sloty)+":"+string(i))
			
			var spr = sp_placeholderItem
			
			if point_in_rectangle(xx,yy,x,y,x+sprite_width,y+sprite_height){
			draw_sprite(spr,depth-1,xx,yy)
			draw_rectangle(xx-ivw/objectsPerRow/2,yy-ivh/MaxRowsPerPage/2,xx+ivw/objectsPerRow/2,yy+ivh/MaxRowsPerPage/2,5)
		
			if collision_rectangle(xx-ivw/objectsPerRow/2,yy-ivh/MaxRowsPerPage/2,xx+ivw/objectsPerRow/2,yy+ivh/MaxRowsPerPage/2,obj_cursor,1,1)&&mouse_check_button_pressed(mb_left){
			
			//idk it's clicked	
			show_debug_message("clicked item "+ string(iii)+" object: "+ string(ds_list_find_value(global.inventory,iii)))
			}
			}
			
			//loops for each object in spare row
		}
	}//else {show_debug_message("none leftover")}

}else {slotx=-1;sloty=-1}

