/// @description Insert description here

draw_rectangle(20,20,520,520,1)

#region (disable in final) Draw item list
var i = 0
repeat(ds_list_size(global.inventory)){
draw_text(400,20*i+10,ds_list_find_value(global.inventory,i))
i++
}
#endregion
draw_text(500,20,"page:"+string(page))
draw_text(500,40,"inventory open:"+string(obj_player.inventoryopen))