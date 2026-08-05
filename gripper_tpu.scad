include <BOSL2/std.scad>
difference(){
    cuboid([6,26,20]);

    cuboid([2.2,26,11]);
    
    translate([2,0,0])
    cuboid([2.2,26,5.5]);
    
    translate([-1.1,12,0])
    rotate([0,0,45])
    cuboid([0.4, 0.4, 11]);
}




translate([-3,0,-8])
ycyl(26, d=4, $fn=20);