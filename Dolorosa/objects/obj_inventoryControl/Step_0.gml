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
	
	//debug changed variables
	if slot != slotx{
	slot = slotx
	show_debug_message("changed to "+string(slotx))
	}
	if slot1 != sloty{
	slot1 = sloty
	show_debug_message("changed to "+string(sloty))
	}
	
	var lastSide= side
	
	
	switch side {
	case -1://options
		slotx = clamp(slotx+h,0,ds_list_size(obj_textChoices.options)-1)
	break;
	
	case 0:
	obj_inventory.horizdistance=0
	if (slotx==obj_inventory.objectsPerRow-1&& h>0){
		side=1
		slotx=0
		lastslotx= slotx
		lastsloty= sloty
		obj_inventory.onetick=1
		show_debug_message("goto1from0")
		break;
		}
	if (h>0 && slotx<obj_inventory.objectsPerRow-1)||(h<0&&slotx>0) {slotx+=h}
	if (v>0)||(v<0&&sloty>0) { sloty+=v} 
	break;
	
	case 1:
	obj_inventory.horizdistance=0
		if (slotx==0&&h<0){
			side=0
			slotx=obj_inventory.objectsPerRow-1
			lastslotx= slotx
			lastsloty= sloty
			obj_inventory.onetick=1
			break;
		}
		if (slotx==obj_inventory.maxEquips-1&&h>0){
			side=2
			sloty=0
			slotx=0
			lastslotx= slotx
			lastsloty= sloty
			obj_inventory.onetick=1
			break;
		}
	if (h>0 && slotx<obj_inventory.maxEquips-1)||(h<0&&slotx>0) {slotx+=h}
	break;
	
	case 2:
	obj_inventory.horizdistance=1
//show_debug_message(slotx)
		if (h<0){
			side=1
			slotx=obj_inventory.maxEquips-1
			sloty=0
			lastslotx= slotx
			lastsloty= sloty
			obj_inventory.onetick=1
			break;
		}
		if (h>0){
			side=3
			slotx=0
			sloty=0
			lastslotx= slotx
			lastsloty= sloty
			obj_inventory.onetick=1
			break;
		}
		if (v>0)||(v<0&&sloty>0) { sloty+=v} 
	break;
	
	case 3:
	obj_inventory.horizdistance=2
		if (h<0&&slotx=0){
			side=2
			slotx=obj_inventory.maxEquips-1
			sloty=0
			lastslotx= slotx
			lastsloty= sloty
			obj_inventory.onetick=1
			break;
		}
	
	}
	
	if side!=lastSide{
	show_debug_message("Changed side "+string(lastSide)+" to "+string(side))	
	}
	
	#endregion