///@func clockwise_closest(origin,list)
///@arg origin
///@arg list
var out = id
var list = argument[1]
var diff = 360
var i = 0
var ref = argument[0]

repeat(ds_list_size(list)-1){
	var dest = ds_list_find_value(list,i)
	if(ref!=dest){
		if(angle_difference(ref.cpos,dest.cpos)<diff&&angle_difference(ref.cpos,dest.cpos)>0){
				
			out=dest
			diff=angle_difference(ref.cpos,dest.cpos)
				
		}
	}
	i++
}
return out