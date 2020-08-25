if fadeintime>0{
interactState=3
fadeintime--
if fadeintime=0 then interactState=0

draw_sprite_stretched_ext(sp_blackness,0,0,0,3840,2160,c_white,fadeintime/global.fadespeed)
}