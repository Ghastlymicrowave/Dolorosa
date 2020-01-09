///@func qst_kills(id,obj,amt)
///@arg id quest ID
///@arg obj string for object killed
///@arg amt amount needed to kill

#region update kills
qst_update_add(argument[0],"progress",ds_list_count(enemyinfo.deaths,argument[1]))
#endregion

#region check 
if(qst_check(argument[0],"progress")>=argument[2]){
	qst_update(argument[0],"complete",1)
	//replace the active quest
	var pos = ds_list_find_index(questinfo.activeQuests,argument[0])
	if questinfo.questArray[argument[0],2]!=0{
	ds_list_replace(questinfo,pos, questinfo.questArray[argument[0],2])
	}else ds_list_delete(argument[0],pos)
	}
#endregion

