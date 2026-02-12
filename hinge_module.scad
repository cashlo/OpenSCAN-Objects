include <BOSL2/std.scad>
include <BOSL2/gears.scad>
include <servo_teeth.scad>
include <bearing.scad>

case_length = 50;
case_width = 55;

mod=1;
helical=0;
clearance=0.2;
max_teeth=40;
gears = 3;
gear_ratio = 6;

ring_thickness = 10;

gear_data = planetary_gears(mod=mod, n=gears, max_teeth=max_teeth, sun_ring=gear_ratio, helical=helical, gear_spin=360/27*$t);

case(top=true);

for(i=[0:1])
mirror([0,i,0])
rotate([0,45,0])
translate([0,-27/2,case_width/2+4])
3d_mouth_with_hole();

back(case_length/2+15)
bearing();

back(-case_length/2-5)
bearing();

module bearing(){

    rotate([90,0,0]){
    inner_ring();
    spacer();
    outer_ring();
    }
}

module case(top=true){


    profile_shift = gear_data[1][2];

    or = outer_radius(mod=mod, teeth=gear_data[1][1], clearance=clearance, helical=helical, profile_shift=profile_shift, internal=true);

    ring_r = or+profile_shift*mod; 



    difference(){
        cuboid([case_width,case_length,case_width], chamfer=10);
        
        
        for(i=[0:3])
        rotate([0,90*i,0])
        up(10)
        rotate([0,45,0])
        cuboid([case_width,case_length+1,case_width],anchor=BOT+RIGHT);
        
        
        
        
        #fwd(case_length/2-5){
        cuboid([40.2,12.2,40.2], anchor=FRONT);
        }

        fwd(case_length/2-5-12.2)
        ycyl(l=case_length-30, d=43, anchor=FRONT);
    }
}



if(true){
back(case_length/2+5)
rotate([90,0,0]){
ring_gear(mod=mod, teeth=gear_data[1][1], profile_shift=gear_data[1][2], helical=helical, herringbone=true, gear_spin=gear_data[1][3],backing=3,thickness=ring_thickness,clearance=clearance);

spur_gear(mod=mod, teeth=gear_data[0][1], profile_shift=gear_data[0][2], helical=helical, herringbone=true, gear_spin=gear_data[0][3],clearance=clearance,thickness=18.5);  //sun

color("red")move_copies(gear_data[2][4]){
    difference(){
    spur_gear(mod=mod, teeth=gear_data[2][1], profile_shift=gear_data[2][2], helical=-helical, herringbone=true, gear_spin=gear_data[2][3][$idx],clearance=clearance,thickness=6);
    
    translate([0,0,5-2]) cylinder(10, 8.1/2, 8.6/2, true);
    cylinder(10, 3.5/2, 3.5/2, true);
    
    }
}
}
}