if fadeintime>0{
gamepaused=1
fadeintime--
if fadeintime=0 then gamepaused=0

draw_sprite_stretched_ext(sp_blackness,0,0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),c_white,fadeintime/global.fadespeed)
}