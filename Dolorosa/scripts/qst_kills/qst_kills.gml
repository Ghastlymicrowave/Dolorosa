///@func qst_kills(id,obj,amt)
///@arg id quest ID
///@arg obj string for object killed
///@arg amt amount needed to kill

#region update kills
qst_update_add(argument[0],"progress",ds_list_count(enemyinfo.deaths,argument[1]))
#endregion

#region check 
if(qst_check(argument[0],"progress")>=argument[2]){qst_update(argument[0],"complete",1)}
#endregion