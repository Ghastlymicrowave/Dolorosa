///@func qst_newQuest( id )
///@desc adds a quest to the active quest list
///@arg quest ID
function qst_newQuest() {
	if ds_list_count(questinfo.activeQuests,argument[0])=0{
	ds_list_add(questinfo.activeQuests,argument[0])}else{
	show_message("error, quest already accepted, running from " + string(object_index)+" "+string(object_get_name(object_index)))	
	}


}
