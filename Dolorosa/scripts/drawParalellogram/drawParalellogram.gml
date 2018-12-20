//argument 0 is x
//argument 1 is y
//argument 2 is width 
//argument 3 is height
//argument 4 is slope
//argument 5 is color
draw_set_color(argument[5])
i = 0
dx=argument[0]
dy=argument[1]
sl=argument[4]
w=argument[2]
repeat(argument[3]){
draw_line(dx+i*sl,dy+i,dx+w+sl*i,dy+i)
i++
}
draw_set_color(c_white)