///@func "ds_list_count(id,item)"
///@arg id
///@arg value
var i = 0
var ret = 0
repeat(ds_list_size(argument[0])){
	if(ds_list_find_value(argument[0],i)=argument[1]){
		ret++
	}
i++
}
return ret