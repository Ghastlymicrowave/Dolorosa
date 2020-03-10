


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
		 
		 switch side {
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
	
	
	#region control
	if slotx=-1{slotx=0;sloty=0;lastslotx=0;lastsloty=0}
	
	if slotx!=lastslotx {
		//show_debug_message(string(slotx)+":"+string(lastslotx))
	slotx=lastslotx
	}
	if sloty!=lastsloty {
		//show_debug_message(string(sloty)+":"+string(lastsloty))
	sloty=lastsloty
	}
	page= floor(sloty/MaxRowsPerPage) 
	
	var v =keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"))
	var h =keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"))
	//var switchToOther = keyboard_check_pressed(ord("R"))
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
	
	if slot != slotx{
	slot = slotx
	show_debug_message("changed to "+string(slotx))
	}
	
	switch side {
		
	case 0:
	horizdistance=0
	if (slotx==objectsPerRow-1&& h>0){
		side=1
		slotx=0
		lastslotx= slotx
		lastsloty= sloty
		onetick=1
		show_debug_message("goto1from0")
		break;
		}
	if (h>0 && slotx<objectsPerRow-1)||(h<0&&slotx>0) {slotx+=h}
	if (v>0)||(v<0&&sloty>0) { sloty+=v} 
	break;
	
	case 1:
	horizdistance=0
		if (slotx==0&&h<0){
			side=0
			slotx=objectsPerRow-1
			lastslotx= slotx
			lastsloty= sloty
			onetick=1
			show_debug_message("goto0from1")
			break;
		}
		if (slotx==maxEquips-1&&h>0){
			side=2
			sloty=0
			lastslotx= slotx
			lastsloty= sloty
			onetick=1
			show_debug_message("goto2from1")
			break;
		}
	if (h>0 && slotx<maxEquips-1)||(h<0&&slotx>0) {slotx+=h}
	break;
	
	case 2:
	horizdistance=1
//show_debug_message(slotx)
		if (h<0){
			side=1
			slotx=maxEquips-1
			lastslotx= slotx
			lastsloty= sloty
			onetick=1
			show_debug_message("goto1from2")
			break;
		}
		if (h>0){
			side=3
			slotx=0
			lastslotx= slotx
			lastsloty= sloty
			onetick=1
			show_debug_message("goto3from2")
			break;
		}
		if (v>0)||(v<0&&sloty>0) { sloty+=v} 
	break;
	
	case 3:
	horizdistance=2
		if (h<0&&slotx=0){
			side=2
			slotx=maxEquips-1
			lastslotx= slotx
			lastsloty= sloty
			onetick=1
			show_debug_message("goto2from3")
			break;
		}
	
	}
	#endregion
	

	
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
	
	
	
	
	
	
	
	if side=0||side=1||abs(horizmove-horizdistance*ivw)>1{
	//&&sloty<MaxRowsPerPage-1
	gotopageheight=(page*panelH+page)
	followpageheight+= (gotopageheight-followpageheight)/2
	//show_debug_message(
	//show_debug_message(followpageheight)
	//show_debug_message(yoffset)

#region old row code
/*
var ii=0//don't delete this line
for (var i = 0; i<ivDivided;i++){//for each full row
	//loops for each full row
	//show_debug_message("its doin a")
	//if i > MaxRowsPerPage-1 then break;
	show_debug_message("i : "+string(i) + " "+string(floor(ivDivided)) +"|"+ string(ivDivided))
	for (var ii=0; ii<objectsPerRow;ii++){
		var pos = ii+i*objectsPerRow
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
		
		var x1 = ConvertGUItoReal(xx-panelW/objectsPerRow/2,0)
		var y1 = ConvertGUItoReal(yy-panelH/MaxRowsPerPage/2,1)
		var x2 = ConvertGUItoReal(xx+panelW/objectsPerRow/2,0)
		var y2 = ConvertGUItoReal(yy+panelH/MaxRowsPerPage/2,1)
		draw_rectangle(xx-panelW/objectsPerRow/2,yy-panelH/MaxRowsPerPage/2,xx+panelW/objectsPerRow/2,yy+panelH/MaxRowsPerPage/2,5)
	
		if collision_rectangle(x1,y1,x2,y2,obj_cursor,1,1)&&mouse_check_button_pressed(mb_left)&&side=0{
		//idk it's clicked	
		show_debug_message("clicked item "+ string(pos)+" object: "+ string(ds_list_find_value(global.inventory,pos)))
		if (ds_list_size(global.currentEquips)>0&&ds_list_find_index(global.currentEquips,ds_list_find_value(global.inventory,pos))!=-1)||(ds_list_size(global.currentEquips)==0){
				ds_list_add(global.currentEquips,ds_list_find_value(global.inventory,ii+i*objectsPerRow))
			}
		}
		//}
	}

}

#endregion
	//show_debug_message(string(i)+"full rows")
	
	#region alternate for not full rows
	if floor(ivDivided)!=ivDivided{
		
		//show_debug_message("its doin b")
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
			
			if  (ds_list_size(global.currentEquips)>0&&ds_list_find_index(global.currentEquips,ds_list_find_value(global.inventory,iii))!=-1)||(ds_list_size(global.currentEquips)==0){
				ds_list_add(global.currentEquips,ds_list_find_value(global.inventory,iii))
			}
			}
			//}
			
		}
	}*/
#endregion


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
			if obj_player.interactState=1 && (obj_cursor.keyboardMenus=1||obj_cursor.keyboardMenus=2)&&(sloty=i&&slotx=iii-floor(i*objectsPerRow))&&side=0{
				//show_debug_message("fat")
				//show_debug_message(string(slotx)+":"+string(iii-floor(i*objectsPerRow))+","+string(sloty)+":"+string(i))
			obj_cursor.keyboardx=xx
			obj_cursor.keyboardy=yy
			lastslotx=slotx
			lastsloty=sloty
			
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
			
			if mouse_check_button_pressed(mb_left)&&side=0{
			
			show_debug_message("clicked item "+ string(iii)+" object: "+ string(ds_list_find_value(global.inventory,iii)))
			
			if  (ds_list_size(global.currentEquips)>0&&ds_list_find_index(global.currentEquips,ds_list_find_value(global.inventory,iii))==-1)||(ds_list_size(global.currentEquips)==0){
				ds_list_add(global.currentEquips,ds_list_find_value(global.inventory,iii))
			}
			}else if side!=0 && obj_cursor.keyboardInUse==0{
			side=0	
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
	
	if obj_player.interactState=1 && (obj_cursor.keyboardMenus=1||obj_cursor.keyboardMenus=2)&&(slotx=i)&&side=1{
				//show_debug_message(ConvertGUItoReal(xx,0))
				//show_debug_message(string(slotx)+":"+string(iii-floor(i*objectsPerRow))+","+string(sloty)+":"+string(i))
			obj_cursor.keyboardx=xx
			obj_cursor.keyboardy=yy
			lastslotx=slotx
			lastsloty=sloty
			
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
			
			
			if mouse_check_button_pressed(mb_left)&&side=1{
			show_debug_message("clicked item "+ string(i)+" object: "+ string(ds_list_find_value(global.currentEquips,i)))
			ds_list_delete(global.currentEquips,i)
			}else if side != 1 && obj_cursor.keyboardInUse==0{
			side = 1	
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
if side == 2||abs(horizmove-horizdistance*ivw)>1{


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
	
	
	if obj_player.interactState=1 && (obj_cursor.keyboardMenus=1||obj_cursor.keyboardMenus=2)&&(sloty==i)&&side=2{
				
			obj_cursor.keyboardx=xx
			obj_cursor.keyboardy=yy
			lastslotx=slotx
			lastsloty=sloty
			
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
			
			
			if mouse_check_button_pressed(mb_left)&&side=2{
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


}else {slotx=-1;sloty=-1}//if inventory open ^^
