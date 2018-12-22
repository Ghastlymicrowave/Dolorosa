/// @description Insert description here

//draw_rectangle(xoffset,yoffset,ivw1+xoffset,ivh1+yoffset,1)

//draw_rectangle(ivx1*camera_get_view_width(view_camera[0]),ivy1*camera_get_view_height(view_camera[0]),ivw1+ivx1*camera_get_view_width(view_camera[0]),ivh1+ivy1*camera_get_view_height(view_camera[0]),1)

#region (disable in final) Draw item list
var i = 0
repeat(ds_list_size(global.inventory)){
draw_text(400,20*i+10,ds_list_find_value(global.inventory,i))
i++
}
#endregion
draw_text(500,20,"page:"+string(page))
draw_text(500,40,"inventory open:"+string(obj_player.inventoryopen))