//draw_healthbar(20,20,520,40,stamina,c_white,c_red,c_green,0,1,1)
if staminaTimer=0{
drawStamina+= (stamina-drawStamina)/(maxstamina/10)}
draw_sprite_stretched(sp_bar,0,20,20,maxstamina*4,30)
draw_sprite_stretched_ext(sp_bar,0,20,20,drawStamina*4,30,c_red,1)
draw_sprite_stretched_ext(sp_bar,0,20,20,stamina*4,30,c_yellow,1)



draw_text(10,10,"lastdir:" + string(lastdir))
draw_text(10,30,"hinput:" + string(hinput))
draw_text(10,50,"vinput:" + string(vinput))
draw_text(10,70,"angledif:" + string(angledif))
draw_text(10,90,"speed:" + string(speed))
draw_text(10,110,"stamina:"+string(stamina))
draw_text(10,130,"staminaTime:"+string(staminaTimer))
draw_text(10,150,"staminaExaust:"+string(staminaExaust))