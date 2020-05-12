//creates a string which would be a prefab file name of a included txt file

//includes a base name alongside a number

//typical formats include stuff like :
//			GenericPrefab_ , 1  which is compliled to "GenericPrefab_1"

return (string(argument[0])+string(argument[1]))