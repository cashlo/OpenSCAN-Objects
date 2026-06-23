include <BOSL2/std.scad>
include <BOSL2/gears.scad>

include <OneWayClutch.scad>

plate_z = 50;
plate_y = 2;
plate_x = 53.5;

plate_r = 5.5;

teeth = 25;

module one_way_gear(mod=1, teeth=20, thickness=5,
    helical=30, herringbone=true, shaft_diam=4.0){

rr = root_radius(mod=mod, teeth, helical=helical);


spur_gear(
    mod=mod, teeth=teeth, thickness=thickness,shaft_diam=rr*2,
    helical=helical, herringbone=true
);

down(thickness/2)
oneway_clutch(outer_diameter=rr*2, key_size=shaft_diam, clutch_width=thickness, wall_thickness=1, belt_thickness=0);


}



difference(){
    cuboid([plate_x,plate_y,plate_z], rounding=plate_r, edges="Y");
    
    // Upper left hole
    translate([-plate_x/2+plate_r,0,plate_z/2-plate_r]){
        ycyl(d=5.5, h=10, anchor=BACK);
        ycyl(d=2.5, h=10);
    };
    
    // Lower left hole
    down(35)
    translate([-plate_x/2+plate_r,0,plate_z/2-plate_r]){
        ycyl(d=5.5, h=10, anchor=BACK);
        ycyl(d=2.5, h=10);
    };
    
    // Shaft hole
    translate([28,0,4.5])
    down(35)
    translate([-plate_x/2+plate_r,0,plate_z/2-plate_r]){
        ycyl(d=6, h=10);
    };
}

d = gear_dist(mod=1,teeth,teeth,helical=30);


translate([28,0,4.5])
down(35)
translate([-plate_x/2+plate_r,0,plate_z/2-plate_r])
rotate([90,0,0]){

up(4.5+40){

difference(){
one_way_gear(
    mod=1, teeth=teeth, thickness=5, shaft_diam=0,
    helical=30, herringbone=true, slices=10
);

#down(2.5)
rotate([0,0,20])
cyl(d=4.0, h=4, anchor=BOT);


#
rotate([0,0,-55])
down(1)
right(2.5){
xcyl(d=3.0, h=10, anchor=LEFT);
xcyl(d=5.0, h=0.4, anchor=LEFT);
}
}

up(1.5)
cyl(d=10, h=1, anchor=BOT);

stick();
}



up(4.5+20)
left(d){
spur_gear(
    mod=1, teeth=teeth, thickness=5, shaft_diam=8.4,
    helical=-30, herringbone=true, slices=5
);


difference(){
mirror([1,0,0])
stick();

cyl(d=10, h=10, anchor=BOT);
}
}

left(d){
difference()
{
union(){
    cyl(d=10, h=plate_y, anchor=BOT);
    cyl(d=8, h=8, anchor=BOT, $fn=20);
    up(7.3)
    cyl(d1=8.5,d2=8, h=2, anchor=BOT, $fn=20);
}
up(8)
cuboid([1,10,10]);
}
}



}

module stick(){
difference(){
rotate([-20,0,0])
translate([5,-42,2])
cuboid([5,85,5]);

translate([5,-80, 0])
rotate([90,0,0])
#cuboid([5,85,5]);

for(i=[0:10])
translate([0,-80+i*2,0])
rotate([90,0,45])
#cuboid([5,85,5]);
}
}
