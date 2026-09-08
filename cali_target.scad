include <BOSL2/std.scad>

cuboid([30, 30, 5],anchor=BOTTOM);
cuboid([5, 30, 30],anchor=BOTTOM);
hull(){
up(20)
cuboid([10, 30, 5],anchor=TOP);
up(15)
cuboid([5, 30, 5],anchor=TOP);

}
