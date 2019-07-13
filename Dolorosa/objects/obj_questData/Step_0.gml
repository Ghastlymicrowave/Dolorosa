/// @description Insert description here
// You can write your code in this editor

//quest update switch
#region update loop
i=0
repeat(ds_list_size(activeQuests)){
	switch(ds_list_find_value(activeQuests,i)){
		case 0:
		//update completion and conditions go here
		
		if colletingQuests[0]>=1 {//add to tally
			
			colletingQuests[0]=0
			
			if /*Wherever the quest progress is tracked*/ i >= 1{
			questArray[0,3]=1//quest completed
			//give reward
			//change to nextquest
			}
			
		}
		
		break;

	}
	
i++
}

#endregion
