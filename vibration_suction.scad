include <BOSL2/std.scad>
include <BOSL2/screws.scad>

cyl(2, d=250, anchor=TOP);
back(30)
difference(){
cuboid([40,10,7], anchor=BOTTOM);
up(4) left(16)
ycyl(20, d=3);

up(4) right(16)
ycyl(20, d=3);


}
