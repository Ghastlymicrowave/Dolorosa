//draw_healthbar(20,20,520,40,stamina,c_white,c_red,c_green,0,1,1)

draw_text(500,30,"scrollhp"+string(scrollhp))
draw_text(500,50,"hp"+string(hp))

if staminaTimer=0{
drawStamina+= (stamina-drawStamina)/(maxstamina/10)}


//drawhp+= max(abs((hp-drawhp)/(maxhp/10)),1)*sign((hp-drawhp)/(maxhp/10))

drawhp+= (hp-drawhp)/(maxhp/10)
drawscrollhp+= (scrollhp-drawscrollhp)/(maxhp/10)

drawStaminacurrent+= (stamina-drawStaminacurrent)/(maxstamina/40)
//draw_sprite_part(sp_bar,0,0,0,20,10,20+drawStamina*4,20)
//draw_sprite_part_ext(sp_bar,0,0,0,maxstamina*scalefactor,20,stamina*scalefactor+400,20,-scalefactor,1,c_white,1)


/*
healthbarframetick++
if healthbarframetick >= sprite_get_speed(sp_bar1)/room_speed then {healthbarframe++;healthbarframetick=0}
if healthbarframe==sprite_get_number(sp_bar1)then healthbarframe=0
*/
var FullScale=3
#region healthbar
drawParalellogram(68*FullScale,10*FullScale,(maxhp*scalefactor/2+4)*FullScale,20*FullScale,-1,c_white)
drawParalellogram(70*FullScale,10*FullScale,maxhp*scalefactor/2*FullScale,20*FullScale,-1,c_black)
drawParalellogram(70*FullScale,10*FullScale,max(drawscrollhp*scalefactor/2,0)*FullScale,20*FullScale,-1,staminaUseColor)
drawParalellogram(70*FullScale,10*FullScale,max(drawhp*scalefactor/2,0)*FullScale,20*FullScale,-1,healthbarcolor)
#endregion

#region stamina bar
drawParalellogram(68*FullScale,50*FullScale,(maxstamina*scalefactor/2+4)*FullScale,20*FullScale,-1,c_white)
drawParalellogram(70*FullScale,50*FullScale,maxstamina*scalefactor/2*FullScale,20*FullScale,-1,c_black)
drawParalellogram(70*FullScale,50*FullScale,max(drawStamina*scalefactor/2,0)*FullScale,20*FullScale,-1,staminaUseColor) //the color of the moving bar
drawParalellogram(70*FullScale,50*FullScale,max(drawStaminacurrent*scalefactor/2,0)*FullScale,20*FullScale,-1,staminabarcolor) // color of the slowly moving bar
#endregion




//draw_sprite_part_ext(sp_bar1,healthbarframe,0,0,maxstamina*scalefactor,64,maxstamina*scalefactor+20,20,-1,1,c_white,1)
//draw_sprite_part_ext(sp_bar1,healthbarframe,0,0,drawStamina*scalefactor,64,drawStamina*scalefactor+20,20,-1,1,c_orange,1)
//draw_sprite_part_ext(sp_bar1,healthbarframe,0,0,stamina*scalefactor,64,stamina*scalefactor+20,20,-1,1,healthbarcolor,1)
//draw_sprite_stretched(sp_bar,0,20,20,maxstamina*4+20,30)
//draw_sprite_stretched_ext(sp_bar,0,20,20,drawStamina*4+20,30,c_red,1)
//draw_sprite_stretched_ext(sp_bar,0,20,20,stamina*4+20,30,c_yellow,1)



draw_text(300,10,"lastdir:" + string(lastdir))
draw_text(300,30,"hinput:" + string(hinput))
draw_text(300,50,"vinput:" + string(vinput))
draw_text(300,70,"angledif:" + string(angledif))
draw_text(300,90,"speed:" + string(speed))
draw_text(300,110,"stamina:"+string(stamina))
draw_text(300,130,"staminaTime:"+string(staminaTimer))
draw_text(300,150,"staminaExaust:"+string(staminaExaust))
draw_text(300,170,"dodgetime:"+string(dodgetime))
draw_text(300,190,"standby:"+string(standbytime))
draw_text(300,210,"spd:"+string(spd))
draw_text(300,230,"maxspd:"+string(maxspd))
draw_text(300,250,"warmup:"+string(atkwarmuptime))
draw_text(300,270,"atk:"+string(atk))
draw_text(300,290,"combo:"+string(combo))
draw_text(300,310,"atktimeheld:"+string(atktimeheld))
draw_text(300,330,"iframes:"+string(iframes))
//argument 0 is x
//argument 1 is y
//argument 2 is width 
//argument 3 is height
//argument 4 is slope
//argument 5 is color
