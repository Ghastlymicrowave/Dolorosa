


ivw=display_get_gui_width()//		/wscale
ivh=display_get_gui_height()//		/hscale
//      regular * scale = updated
//      (screenSize * screenPercent)/regular = scale


image_xscale=ivw/sprite_get_width(sprite_index)
image_yscale=ivh/sprite_get_height(sprite_index)

depth=-500









if obj_player.inventoryopen=1{
	
	
switch side {
	case 0:
	case 1:
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[0,0],ivh*uiPresets[0,1],uiPresets[0,2]*ivw/sprite_get_width(sprite_index),uiPresets[0,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[1,0],ivh*uiPresets[1,1],uiPresets[1,2]*ivw/sprite_get_width(sprite_index),uiPresets[1,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
	break;
	case 2:
	break;
}
	
	
	
	
	
	
	var ivx=display_get_gui_width()*uiPresets[0,0]
	var ivy=display_get_gui_height()*uiPresets[0,1]
	var panelW=display_get_gui_width()*uiPresets[0,2]//		/wscale
	var panelH=display_get_gui_height()*uiPresets[0,3]//	/hscale
	
	draw_sprite(sp_badCircle,0,ivx,0)
	draw_sprite(sp_badCircle,0,ivw*uiPresets[0,0],0)
	
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
	var switchToOther = keyboard_check_pressed(ord("R"))
	var v1 =keyboard_check(ord("S")) - keyboard_check(ord("W"))
	var h1 =keyboard_check(ord("D")) - keyboard_check(ord("A"))
	
	if switchToOther=1{
	side=!side	
	}
	
	
	if (abs(v1)xor(abs(h1))) {if heldtime <20 {heldtime++;heldwaittime=8} }else heldtime=0
	
	if heldtime=20{
		heldwaittime--
		if heldwaittime=0{
		v=v1
		h=h1
		heldwaittime=8//ads a delay for holding down keys
		} 
	}
	
	if side=0||side=1{
	
	if (h>0 && slotx<objectsPerRow-1)||(h<0&&slotx>0) then slotx+=h
	if (v>0)||(v<0&&sloty>0) { sloty+=v
		
		
		
		} //&&sloty<MaxRowsPerPage-1
	gotopageheight=(page*panelH+page)
	followpageheight+= (gotopageheight-followpageheight)/2
	//show_debug_message(
	show_debug_message(followpageheight)
	//show_debug_message(yoffset)

var ii=0//don't delete this line
for (var i = 0; i<floor(ivDivided);i++){//for each full row
	//loops for each full row
	show_debug_message("its doin a")
	//if i > MaxRowsPerPage-1 then break;
	
	for (var ii=0; ii<objectsPerRow;ii++){
		var xx = ivx+ii*panelW/objectsPerRow+((ii+1)*panelW/objectsPerRow)/panelW+panelW/objectsPerRow/2
		var yy = ivy+i*panelH/MaxRowsPerPage+((i+1)*panelH/MaxRowsPerPage)/panelH+panelH/MaxRowsPerPage/2 -followpageheight
		//instance_create_depth(xx,yy,-5000,obj_inventoryItem)	
		//			this needs to be reformatted to take the information from a 2d array contaning the object's ID and all the information about it
		
			if obj_player.inventoryopen=1 && (obj_cursor.keyboardMenus=1|| obj_cursor.keyboardMenus=2) && (sloty=i&&slotx=ii)&&side=0{
			//show_debug_message(string(slotx)+string(ii)+string(sloty)+string(i)+"MOVED")
			obj_cursor.keyboardx=ConvertGUItoReal(xx,0)
			obj_cursor.keyboardy=ConvertGUItoReal(yy,1)
			lastslotx=slotx
			lastsloty=sloty
			}//else show_debug_message(string(slotx)+string(ii)+string(sloty)+string(i))
		
		var spr = sp_placeholderItem
		
		//if point_in_rectangle(xx,yy,x,y,x+sprite_width,y+sprite_height){
		draw_sprite(spr,depth-1,xx,yy)
		draw_rectangle(xx-panelW/objectsPerRow/2,yy-panelH/MaxRowsPerPage/2,xx+panelW/objectsPerRow/2,yy+panelH/MaxRowsPerPage/2,5)
	
		if collision_rectangle(xx-panelW/objectsPerRow/2,yy-panelH/MaxRowsPerPage/2,xx+panelW/objectsPerRow/2,yy+panelH/MaxRowsPerPage/2,obj_cursor,1,1)&&mouse_check_button_pressed(mb_left)&&side=0{
		//idk it's clicked	
		show_debug_message("clicked item "+ string(ii+i*objectsPerRow)+" object: "+ string(ds_list_find_value(global.inventory,ii+i*objectsPerRow)))
		}
		//}
	}

	}
	//show_debug_message(string(i)+"full rows")
	if floor(ivDivided)!=ivDivided{
		
		show_debug_message("its doin b")
		for (var iii=floor(i*objectsPerRow); iii<ivSize;iii++){ //iii = 0+floor(i*objectsPerRow)
			//show_debug_message(string(iii)+"leftover")
			
			var xx = ivx+(iii-round(i*objectsPerRow))*panelW/objectsPerRow+(panelW/objectsPerRow)/panelW+panelW/objectsPerRow/2
			var yy = ivy+i*panelH/MaxRowsPerPage+((i+1)*panelH/MaxRowsPerPage)/panelH+panelH/MaxRowsPerPage/2 -followpageheight
			//instance_create_depth(xx,yy,-1,obj_inventoryItem)	
			//show_debug_message(string(iii)+" 3,2 "+string(ii))
			if obj_player.inventoryopen=1 && (obj_cursor.keyboardMenus=1||obj_cursor.keyboardMenus=2)&&(sloty=i&&slotx=iii-floor(i*objectsPerRow))&&side=0{
				
				//show_debug_message(string(slotx)+":"+string(iii-floor(i*objectsPerRow))+","+string(sloty)+":"+string(i))
			obj_cursor.keyboardx=ConvertGUItoReal(xx,0)
			obj_cursor.keyboardy=ConvertGUItoReal(yy,1)
			lastslotx=slotx
			lastsloty=sloty
			
			}//else show_debug_message(string(slotx)+":"+string(iii-floor(i*objectsPerRow))+","+string(sloty)+":"+string(i))
			
			var spr = sp_placeholderItem
			
			//if point_in_rectangle(xx,yy,x,y,x+sprite_width,y+sprite_height){
			draw_sprite(spr,depth-1,xx,yy)
			draw_rectangle(xx-panelW/objectsPerRow/2,yy-panelH/MaxRowsPerPage/2,xx+panelW/objectsPerRow/2,yy+panelH/MaxRowsPerPage/2,5)
		
			if collision_rectangle(xx-panelW/objectsPerRow/2,yy-panelH/MaxRowsPerPage/2,xx+panelW/objectsPerRow/2,yy+panelH/MaxRowsPerPage/2,obj_cursor,1,1)&&mouse_check_button_pressed(mb_left)&&side=0{
			
			show_debug_message("clicked item "+ string(iii)+" object: "+ string(ds_list_find_value(global.inventory,iii)))
			
			if ds_list_find_index(global.currentEquips,ds_list_find_value(global.inventory,iii)){
				ds_list_add(global.currentEquips,ds_list_find_value(global.inventory,iii))
			}
			}
			//}
			
		}
	}



//side 1, equips


	var ivx=display_get_gui_width()*uiPresets[1,0]
	var ivy=display_get_gui_height()*uiPresets[1,1]
	var panelW=display_get_gui_width()*uiPresets[1,2]//		/wscale
	var panelH=display_get_gui_height()*uiPresets[1,3]//	/hscale


for (var i = 0; i<maxEquips;i++){
	var xx = (i+1)*panelW/(maxEquips+1)+ivx
	var yy = ivy+panelH/2
	
	//look into the array of items based on the item in the list
	
	if i < ds_list_size(global.currentEquips){
		
		//switch based on the item's info
		var spr = sp_placeholderItem
		
	draw_rectangle(xx-sprite_get_width(spr)/2,yy-sprite_get_height(spr)/2,xx+sprite_get_width(spr)/2,yy+sprite_get_height(spr)/2,5)	
		
		var x1 = ConvertGUItoReal( xx-sprite_get_width(spr)/2,0)
		var x2 = ConvertGUItoReal( xx+sprite_get_width(spr)/2,0)
		var y1 = ConvertGUItoReal( yy-sprite_get_height(spr)/2,1)
		var y2 = ConvertGUItoReal( yy+sprite_get_height(spr)/2,1)
		
		if collision_rectangle(x1,y1,x2,y2,obj_cursor,1,1)&&mouse_check_button_pressed(mb_left)&&side=0{
			
			show_debug_message("clicked item "+ string(i)+" object: "+ string(ds_list_find_value(global.currentEquips,i)))
			ds_list_delete(global.currentEquips,i)
			}
		
	}else{
	
	var spr = sp_thing
	
	

	}
	
	
	draw_sprite(spr,0,xx,yy)
}






}
}else {slotx=-1;sloty=-1}
