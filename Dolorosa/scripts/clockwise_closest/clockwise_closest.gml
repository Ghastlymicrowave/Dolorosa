///@func clockwise_closest(origin,list)
///@arg origin
///@arg list
var out = id
var list = argument[1]
var diff = 400
var i = 0
var ref = argument[0]

repeat(ds_list_size(list)-1){
	var dest = ds_list_find_value(list,i)
	if(ref!=dest){
		if(dest.cpos>ref.cpos){
			if((dest.cpos-ref.cpos)<diff){
				
				out=ds_list_find_value(list,i)
				diff=dest.cpos-ref.cpos
				
			}
		}
	}
	i++
}
return out