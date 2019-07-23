if keyboard_check(ord("Y")){
	
	
draw_text(200,400,questArray[ds_list_find_value(activeQuests,0),0])   // QuestTitle
draw_text(200,420,questArray[ds_list_find_value(activeQuests,0),1])
draw_text(200,440,questArray[ds_list_find_value(activeQuests,0),2])
draw_text(200,460,questArray[ds_list_find_value(activeQuests,0),3])
draw_text(200,480,questArray[ds_list_find_value(activeQuests,0),4])
draw_text(200,500,questArray[ds_list_find_value(activeQuests,0),5])
draw_text(200,520,questArray[ds_list_find_value(activeQuests,0),6])
//// QuestInfo
//questArray[0,2] =  0 // Nextquest, if none = 0
//questArray[0,3] =  0 // Completion status (0 or 1)
//questArray[0,4] =  0 // Progress
//questArray[0,5] =  0 // Misc1
//questArray[0,6] =  0 // Misc2	
	
	
	
}