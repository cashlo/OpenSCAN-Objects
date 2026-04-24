include <BOSL2/std.scad>
include <servo_teeth.scad>

motor_shell = 3;
cap_shell = 3;

up(3+cap_shell+0.5)
for(i=[0:1])
mirror([0,i,0])
rotate([0,0,0])
translate([0,-27/2-0.5,0]){
3d_mouth_with_hole();

translate([-8,-3.5,-2])
cube([16,3.5,2]);
}

difference(){
cuboid([42+motor_shell*2+cap_shell*2, 42+motor_shell*2+cap_shell*2, 3+cap_shell], anchor=BOTTOM);

    difference(){
    cuboid([42+motor_shell*2+0.2, 42+motor_shell*2+0.2, 3], anchor=BOTTOM);

    for(i=[0:3])
    zrot(i*90)
    right(10+0.1)
    zrot(45)
    cuboid([42+motor_shell*2, 42+motor_shell*2, 35], anchor=BOTTOM+LEFT+BACK);
            
     }
 
        #for(i=[0:3])
        zrot(i*90){
        
            $fn=10;
            
            fwd(42/2)
            left(42/2)
            zcyl(200, d=3.4, anchor=BOTTOM);
            
            up( 3+cap_shell/2)
            fwd(42/2)
            left(42/2)
            zcyl(4, d=6.5, anchor=BOTTOM);
        }
        
 }