


ivw=display_get_gui_width()//		/wscale
ivh=display_get_gui_height()//		/hscale
//      regular * scale = updated
//      (screenSize * screenPercent)/regular = scale


image_xscale=ivw/sprite_get_width(sprite_index)
image_yscale=ivh/sprite_get_height(sprite_index)

depth=-500









if obj_player.interactState=1{
	
	
	
	var w = ivw

	
		
	
	 if (abs(horizdistance*ivw-horizmove)>1)||onetick=1{//draw all
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[0,0]-horizmove,ivh*uiPresets[0,1],uiPresets[0,2]*ivw/sprite_get_width(sprite_index),uiPresets[0,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[1,0]-horizmove,ivh*uiPresets[1,1],uiPresets[1,2]*ivw/sprite_get_width(sprite_index),uiPresets[1,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[2,0]-horizmove+w,ivh*uiPresets[2,1],uiPresets[2,2]*ivw/sprite_get_width(sprite_index),uiPresets[2,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[2,4]-horizmove+w,ivh*uiPresets[2,5],uiPresets[2,6]*ivw/sprite_get_width(sprite_index),uiPresets[2,7]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[3,0]-horizmove+w*2,ivh*uiPresets[3,1],uiPresets[3,2]*ivw/sprite_get_width(sprite_index),uiPresets[3,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
		onetick=0
		}else{
		 
		 switch obj_inventoryControl.side {
	case 0:
	case 1:
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[0,0]-horizmove,ivh*uiPresets[0,1],uiPresets[0,2]*ivw/sprite_get_width(sprite_index),uiPresets[0,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[1,0]-horizmove,ivh*uiPresets[1,1],uiPresets[1,2]*ivw/sprite_get_width(sprite_index),uiPresets[1,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
	break;
	case 2:
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[2,0]-horizmove+w,ivh*uiPresets[2,1],uiPresets[2,2]*ivw/sprite_get_width(sprite_index),uiPresets[2,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[2,4]-horizmove+w,ivh*uiPresets[2,5],uiPresets[2,6]*ivw/sprite_get_width(sprite_index),uiPresets[2,7]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
	break;
	case 3:
		draw_sprite_ext(sprite_index,0,ivw*uiPresets[3,0]-horizmove+w*2,ivh*uiPresets[3,1],uiPresets[3,2]*ivw/sprite_get_width(sprite_index),uiPresets[3,3]*ivh/sprite_get_height(sprite_index),0,c_white,image_alpha)
	break;
}
	 }
	
	
	if obj_inventoryControl.side=0||obj_inventoryControl.side=1{  //convert this page int to an array of ints, one for any page with other scrolls
		page= floor(obj_inventoryControl.sloty/MaxRowsPerPage)
	}else page = 0
	

	
	horizmove += (horizdistance*ivw-horizmove)/4
	//show_debug_message(string(slotx)+" "+string(side)+" "+ string(horizmove))
	
	var ivx=display_get_gui_width()*uiPresets[0,0]+horizmove
	var ivy=display_get_gui_height()*uiPresets[0,1]
	var panelW=display_get_gui_width()*uiPresets[0,2]//		/wscale
	var panelH=display_get_gui_height()*uiPresets[0,3]//	/hscale
	
	draw_sprite(sp_badCircle,0,ivx,0)
	draw_sprite(sp_badCircle,0,ivw*uiPresets[0,0],0)
	
	var ivSize=ds_list_size(global.inventory)
	var ivDivided=ivSize/objectsPerRow
	
	
	
	
	
	
	
	if obj_inventoryControl.side=0||obj_inventoryControl.side=1||abs(horizmove-horizdistance*ivw)>1{
	//&&sloty<MaxRowsPerPage-1
	gotopageheight=(page*panelH+page)
	followpageheight+= (gotopageheight-followpageheight)/2
	//show_debug_message(
	//show_debug_message(followpageheight)
	//show_debug_message(yoffset)

#region side 0, charms iv

//var ii=0//don't delete this line
for (var i = 0; i<ivDivided;i++){//for each full row
	//show_debug_message("its doin b")
		for (var iii=floor(i*objectsPerRow); iii<ivSize&&iii<floor(i*objectsPerRow)+objectsPerRow;iii++){ //iii = starting id of row
			//show_debug_message(string(iii)+"leftover")
			
			var xx = ivx+(iii-round(i*objectsPerRow))*panelW/objectsPerRow+(panelW/objectsPerRow)/panelW+panelW/objectsPerRow/2
			var yy = ivy+i*panelH/MaxRowsPerPage+((i+1)*panelH/MaxRowsPerPage)/panelH+panelH/MaxRowsPerPage/2 -followpageheight
			//instance_create_depth(xx,yy,-1,obj_inventoryItem)	
			//show_debug_message(string(iii)+" 3,2 "+string(ii))
			if obj_player.interactState=1 && (obj_cursor.keyboardMenus=1||obj_cursor.keyboardMenus=2)&&(obj_inventoryControl.sloty=i&&obj_inventoryControl.slotx=iii-floor(i*objectsPerRow))&&obj_inventoryControl.side=0{
				//show_debug_message("fat")
				//show_debug_message(string(slotx)+":"+string(iii-floor(i*objectsPerRow))+","+string(sloty)+":"+string(i))
			obj_cursor.keyboardx=xx
			obj_cursor.keyboardy=yy
			obj_inventoryControl.lastslotx=obj_inventoryControl.slotx
			obj_inventoryControl.lastsloty=obj_inventoryControl.sloty
			obj_cursor.boxWidth = panelW/objectsPerRow 
			obj_cursor.boxHeight = panelH/MaxRowsPerPage
			}//else show_debug_message(string(slotx)+":"+string(iii-floor(i*objectsPerRow))+","+string(sloty)+":"+string(i))
			
			var spr = sp_placeholderItem
			
			//if point_in_rectangle(xx,yy,x,y,x+sprite_width,y+sprite_height){
			draw_sprite(spr,depth-1,xx,yy)
			
			var x1 = xx-panelW/objectsPerRow/2
			var y1 = yy-panelH/MaxRowsPerPage/2
			var x2 = xx+panelW/objectsPerRow/2
			var y2 = yy+panelH/MaxRowsPerPage/2
			draw_rectangle(x1,y1,x2,y2,10)
			//draw_sprite(sp_badCircle,0,ConvertRealtoGUI(obj_cursor.x,0),ConvertRealtoGUI(obj_cursor.y,1))
			if point_in_rectangle(ConvertRealtoGUI(obj_cursor.x,0),ConvertRealtoGUI(obj_cursor.y,1),x1,y1,x2,y2){
			
			if mouse_check_button_pressed(mb_left)&&obj_inventoryControl.side=0{
			
			show_debug_message("clicked item "+ string(iii)+" object: "+ string(ds_list_find_value(global.inventory,iii)))
			
			if  (ds_list_size(global.currentEquips)>0&&ds_list_find_index(global.currentEquips,ds_list_find_value(global.inventory,iii))==-1)||(ds_list_size(global.currentEquips)==0){
				ds_list_add(global.currentEquips,ds_list_find_value(global.inventory,iii))
				items_equip(ds_list_find_value(global.inventory,iii))
			}
			}else if obj_inventoryControl.side!=0 && obj_cursor.keyboardInUse==0{
			obj_inventoryControl.side=0	
			}
			
		}
	}

}

#endregion


#region side 1, equips


	var ivx=display_get_gui_width()*uiPresets[1,0]+horizmove
	var ivy=display_get_gui_height()*uiPresets[1,1]
	var panelW=display_get_gui_width()*uiPresets[1,2]//		/wscale
	var panelH=display_get_gui_height()*uiPresets[1,3]//	/hscale


for (var i = 0; i<maxEquips;i++){
	var xx = (i+1)*panelW/(maxEquips+1)+ivx
	var yy = ivy+panelH/2
	
	if obj_player.interactState=1 && (obj_cursor.keyboardMenus=1||obj_cursor.keyboardMenus=2)&&(obj_inventoryControl.slotx=i)&&obj_inventoryControl.side=1{
				//show_debug_message(ConvertGUItoReal(xx,0))
				//show_debug_message(string(slotx)+":"+string(iii-floor(i*objectsPerRow))+","+string(sloty)+":"+string(i))
			obj_cursor.keyboardx=xx
			obj_cursor.keyboardy=yy
			obj_inventoryControl.lastslotx=obj_inventoryControl.slotx
			obj_inventoryControl.lastsloty=obj_inventoryControl.sloty
			obj_cursor.boxWidth = panelW/maxEquips
			obj_cursor.boxHeight = panelW/maxEquips
			}
	
	//look into the array of items based on the item in the list
	
	if i < ds_list_size(global.currentEquips){
		
		//switch based on the item's info
		var spr = sp_placeholderItem
		
	draw_rectangle(xx-sprite_get_width(spr)/2,yy-sprite_get_height(spr)/2,xx+sprite_get_width(spr)/2,yy+sprite_get_height(spr)/2,5)	
		
		var x1 = ConvertGUItoReal( xx-sprite_get_width(spr)/2,0)
		var x2 = ConvertGUItoReal( xx+sprite_get_width(spr)/2,0)
		var y1 = ConvertGUItoReal( yy-sprite_get_height(spr)/2,1)
		var y2 = ConvertGUItoReal( yy+sprite_get_height(spr)/2,1)
		
		if collision_rectangle(x1,y1,x2,y2,obj_cursor,1,1){
			
			
			if mouse_check_button_pressed(mb_left)&&obj_inventoryControl.side=1{
			show_debug_message("clicked item "+ string(i)+" object: "+ string(ds_list_find_value(global.currentEquips,i)))
			items_unequip(ds_list_find_value(global.currentEquips,i))
			ds_list_delete(global.currentEquips,i)
			}else if obj_inventoryControl.side != 1 && obj_cursor.keyboardInUse==0{
			obj_inventoryControl.side = 1	
			}
		}
	}else{
	
	var spr = sp_thing
	
	

	}
	
	
	draw_sprite(spr,0,xx,yy)
}
}
#endregion
	
	
	
//something happening earlier stopping code from getting here
#region side 2, map
if obj_inventoryControl.side == 2||abs(horizmove-horizdistance*ivw)>1{


	var ivx=display_get_gui_width()*uiPresets[2,4]+horizmove-w //+ horizdistance*ivw
	var ivy=display_get_gui_height()*uiPresets[2,5]
	var panelW=display_get_gui_width()*uiPresets[2,6]//		/wscale
	var panelH=display_get_gui_height()*uiPresets[2,7]//	/hscale

	var ivx1=display_get_gui_width()*uiPresets[2,0]+horizmove-w //+ horizdistance*ivw
	var ivy1=display_get_gui_height()*uiPresets[2,1]
	var panelW1=display_get_gui_width()*uiPresets[2,2]//		/wscale
	var panelH1=display_get_gui_height()*uiPresets[2,3]//	/hscale

for (var i = 0; i<ds_list_size(global.currentMapLocations);i++){

	var xx = ivx+panelW/2
	var yy = ivy+(i+1)*panelH/(ds_list_size(global.currentMapLocations)+1)
	
	
	if obj_player.interactState=1 && (obj_cursor.keyboardMenus=1||obj_cursor.keyboardMenus=2)&&(obj_inventoryControl.sloty==i)&&obj_inventoryControl.side=2{
				
			obj_cursor.keyboardx=xx
			obj_cursor.keyboardy=yy
			obj_inventoryControl.lastslotx=obj_inventoryControl.slotx
			obj_inventoryControl.lastsloty=obj_inventoryControl.sloty
			obj_cursor.boxWidth = panelW
			obj_cursor.boxHeight = panelH/ds_list_size(global.currentMapLocations)
			}

	var spr = sp_placeholderItem
	var str = "placeholder"
	switch i {
	case 0: 
	
	case 1:
	case 2:
	case 3:
	case 4:
	default: spr = sp_placeholderItem
			 str = "placeholder"
	break;
	}

	draw_sprite(spr,0,ivx1+panelW1*locationSlot[ds_list_find_value(global.currentMapLocations,i),0],ivy1+panelH1*locationSlot[ds_list_find_value(global.currentMapLocations,i),1])
	
	draw_sprite(spr,0,xx,yy)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text_ext_transformed(xx,yy-sprite_get_height(spr)/4,str,1,sprite_get_width(spr),4,4,0)
	//show_debug_message(string(xx)+":"+string(yy))
	if i < ds_list_size(global.currentMapLocations){
		
		//switch based on the item's info
		
		
	draw_rectangle(xx-sprite_get_width(spr)/2,yy-sprite_get_height(spr)/2,xx+sprite_get_width(spr)/2,yy+sprite_get_height(spr)/2,5)	
		
		var x1 = ConvertGUItoReal( xx-sprite_get_width(spr)/2,0)
		var x2 = ConvertGUItoReal( xx+sprite_get_width(spr)/2,0)
		var y1 = ConvertGUItoReal( yy-sprite_get_height(spr)/2,1)
		var y2 = ConvertGUItoReal( yy+sprite_get_height(spr)/2,1)
		
		if collision_rectangle(x1,y1,x2,y2,obj_cursor,1,1){
			
			
			if mouse_check_button_pressed(mb_left)&&obj_inventoryControl.side=2{
			show_debug_message("clicked item "+ string(i))
			//clicked
			}
		}
	}else{
	
	var spr = sp_thing
	
	

	}
	
	//show_debug_message("drawing")
	
}

}


#endregion


}//else {obj_inventoryControl.slotx=-1;obj_inventoryControl.sloty=-1}//if inventory open ^^
