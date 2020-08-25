///@func qst_check(id,destination)
///@arg id
///@arg destination
function qst_check() {
	switch(argument[1]){
	case "title":
	return questinfo.questArray[argument[0],0]
	break;
	case "info":
	return questinfo.questArray[argument[0],1]
	break;
	case "next":
	return questinfo.questArray[argument[0],2]
	break;
	case "complete":
	return questinfo.questArray[argument[0],3]
	break;
	case "progress":
	return questinfo.questArray[argument[0],4]
	break;
	case "misc1":
	return questinfo.questArray[argument[0],5]
	break;
	case "misc2":
	return questinfo.questArray[argument[0],6]
	break;
	}


}
