///@func qst_update(id,destination,value)
///@arg id
///@arg destination
///@arg value
function qst_update() {
	switch(argument[1]){
	case "title":
	questinfo.questArray[argument[0],0] = argument[2]
	break;
	case "info":
	questinfo.questArray[argument[0],1] = argument[2]
	break;
	case "next":
	questinfo.questArray[argument[0],2] = argument[2]
	break;
	case "complete":
	questinfo.questArray[argument[0],3] = argument[2]
	break;
	case "progress":
	questinfo.questArray[argument[0],4] = argument[2]
	break;
	case "misc1":
	questinfo.questArray[argument[0],5] = argument[2]
	break;
	case "misc2":
	questinfo.questArray[argument[0],6] = argument[2]
	break;
	}


}
