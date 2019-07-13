/// @description Insert description here
// You can write your code in this editor

//quest update switch
#region update loop
i=0
repeat(ds_list_size(activeQuests)){
	switch(ds_list_find_value(activeQuests,i)){
		case 1:
		//update completion and conditions go here
		break;

	}
	
i++
}

#endregion
