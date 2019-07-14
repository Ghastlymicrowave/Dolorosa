///@func qst_items(id,obj,amt)
///@arg id quest ID
///@arg obj string for object killed
///@arg amt amount needed to kill

#region update items
qst_update(argument[0],"progress",ds_list_count(global.inventory,argument[1]))
#endregion

#region check 
if(qst_check(argument[0],"progress")>=argument[2]){qst_update(argument[0],"complete",1)}
#endregion