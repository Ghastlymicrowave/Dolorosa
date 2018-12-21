/// @description Insert description here

#region (disable in final) Draw item list
var i = 0
repeat(ds_list_size(global.inventory)){
draw_text(400,20*i+10,ds_list_find_value(global.inventory,i))
i++
}
#endregion