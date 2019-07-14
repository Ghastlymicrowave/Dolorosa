/// @description Insert description here
// You can write your code in this editor
#region templates
/* Item Quests
*/
/* Enemies Killed Quest
*/
#endregion

#region update loop
i=0
repeat(ds_list_size(activeQuests)){
	var questID = ds_list_find_value(activeQuests,i)
	switch(questID){
		case 0:
		var listindex =0
		repeat(ds_list_size(enemyinfo.deaths)){
			if ds_list_find_value(enemyinfo.deaths,listindex)="obj_Enemy1"{
				ds_list_delete(enemyinfo.deaths,listindex)//delete from list
				playerinfo.playerinfodata[0]+=1 //att to player total
				
				if questArray[0,3]!=1{//completion status
					questArray[0,4]++
					if questArray[0,4]>=1{questArray[0,3]=1}//complete quest
				}
				
			} else listindex++
		}
		
		break;
		case 1:
			
		
		
		break;
	}
	
i++
}

#endregion
