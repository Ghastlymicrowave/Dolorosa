function CreateRoomFromString() {
	//file name
	//x offset
	//y offset

	//requires file to be in "Included Files"

	if argument[0] !=""{//open
		
			show_debug_message(argument[0])
		
			file_text_open_read(argument[0])
				var inputData = file_text_read_string(argument[0]) //reads input as string
			file_text_close(argument[0])
		
			var inputList = ds_list_create() //converts string to list
			ds_list_read(inputList,inputData)
		
		
			SpawnPrefabFromString(ds_list_find_value(inputList,0),argument[1],argument[2])//uses slot 0 of list to create prefab
			//roomW = ds_list_find_value(inputList,1)
			//roomH = ds_list_find_value(inputList,2)
			//set room variables
			ds_list_destroy(inputList)
		}


}
