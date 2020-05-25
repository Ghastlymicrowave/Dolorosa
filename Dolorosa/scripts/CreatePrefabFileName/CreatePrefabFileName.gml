///@func CreatePrefabFileName(standardName, number, optionalExt)
///@desc 
///@arg starndardName
///@arg number
///@arg optinalExt

//creates a string which would be a prefab file name of a included txt file

//includes a base name alongside a number

//typical formats include stuff like :
//			GenericPrefab_ , 1  which is compliled to "GenericPrefab_1"

var ext = ""

if argument_count > 2 {
	ext = argument[2]	
}

return (string(argument[0])+string(argument[1])+ext)