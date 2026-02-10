include <BOSL2/std.scad>
include <BOSL2/gears.scad>
include <servo_teeth.scad>
include <bearing.scad>

case_length = 90;
case_width = 55;

mod=1;
helical=0;
clearance=0.2;
max_teeth=40;
gears = 4;
gear_ratio = 6;

ring_thickness = 10;


case(top=true);
left(70)
case(top=false);

back(case_length/2+0.5)
top();

gear_data = planetary_gears(mod=mod, n=gears, max_teeth=max_teeth, sun_carrier=gear_ratio, helical=helical, gear_spin=360/27*$t);


rotate([-90,0,0])
down(case_length/2-17-18)
sun();



module sun(){

up(15)
spur_gear(mod=mod, teeth=gear_data[0][1], profile_shift=gear_data[0][2], helical=helical, herringbone=true, gear_spin=gear_data[0][3],clearance=clearance,thickness=18);


difference(){
cylinder(6, 30/2, 30/2);


for(i=[0:3])
rotate([0,0,90*i+45])
translate([10,0,0])
cylinder(10, 3.5/2, 3.5/2);

}
}

module top(){
    $fn=40;
    
    difference(){
    union(){
    cuboid([case_width,10,case_width], chamfer=2,
    edges=[BACK, LEFT+BOT, RIGHT+BOT],
    anchor=FRONT);
    
    fwd(15)
    rotate([90,0,0]){
    inner_ring();
    //outer_ring();
    }
    
    for(i=[0:1])
    mirror([0,0,i])
    translate([0,24,-27.5/2])
    rotate([90,0,0]){
        3d_mouth_with_hole();
        translate([-8,-3.5,6])
        cube([16,3.5,8]);
    }
    
    fwd(7.1+2+16)
    difference(){
    ycyl(l=25, d=30-0.5, anchor=FRONT);
    ycyl(l=21, d=15, anchor=FRONT);
    }
    
    
    fwd(16)
    intersection(){
    ycyl(l=50, d=30-0.5);
    
    
    
    fwd(4)
    rotate([90,0,0])
    move_copies(gear_data[2][4])
    #up(3.5) cylinder(4, 6/2, 6/2);
    }
    
    }
    
    fwd(4)
    rotate([90,0,0])
    move_copies(gear_data[2][4])
    up(-20) cylinder(50, 2.7/2, 2.7/2);
    
    
    }
}



module case(top=true){


profile_shift = gear_data[1][2];

or = outer_radius(mod=mod, teeth=gear_data[1][1], clearance=clearance, helical=helical, profile_shift=profile_shift, internal=true);

ring_r = or+profile_shift*mod; 



difference(){
    cuboid([case_width,case_length,case_width/2], chamfer=2,
    edges=[FRONT, LEFT+BOT, RIGHT+BOT],
    anchor=TOP);
    
    #fwd(case_length/2-5){
    cuboid([40.2,12.2,40.2], anchor=FRONT);
    cuboid([80, 12.2,16], anchor=FRONT);
    cuboid([16, 12.2,80], anchor=FRONT);
    
    }
    
    fwd(case_length/2-5-12.2)
    ycyl(l=case_length-30, d=43, anchor=FRONT);
    
    fwd(-case_length/2+35)
    ycyl(l=ring_thickness+0.3, d=(ring_r+2.4)*2+0.2, anchor=FRONT, $fn=8);
    
    fwd(case_length/2-5-12.2-43){
    ycyl(l=30+0.5, d=30+1, anchor=FRONT);
    }
    
    fwd(-case_length/2+20-0.25){
    #ycyl(l=10+0.5, d=40+3*2+ball_d+ 0.5, anchor=FRONT, $fn=8);
    }
    
    
    
    
    
    for(i=[0:1])
    mirror([i,0,0]){
    $fn=20;
    
    back(case_length/2-3)
    left(case_width/2-3){
    
    if(top){
        cyl(l=2, d=3.1, anchor=TOP);
        down(1)
        cyl(l=2, d2=3.1, d1=6, anchor=TOP);
    } else {
        cyl(l=2, d=2.7, anchor=TOP);
        down(1)
        cyl(l=2, d=6.2, anchor=TOP, $fn=6);
    }
    
    #down(3)
    back(3)
    left(3)
    cyl(l=50, d=15, anchor=TOP);
    }
    
    left(case_width/2-3){
    if(top){
        cyl(l=2, d=3.1, anchor=TOP);
        down(1)
        cyl(l=2, d2=3.1, d1=6, anchor=TOP);
    } else {
        cyl(l=2, d=2.7, anchor=TOP);
        down(1)
        cyl(l=2, d=6.2, anchor=TOP, $fn=6);
    }
    
    
    #down(3)
    left(3)
    cyl(l=50, d=12, anchor=TOP);
    }
    
    }
    
    cuboid(200, anchor=BOT);
}

translate([0,-case_length/2,-27/2])
rotate([90,0,0])
3d_mouth_with_hole();


if(true){
back(case_length/2-ring_thickness/2-25+0.15)
rotate([90,0,0]){
//ring_gear(mod=mod, teeth=gear_data[1][1], profile_shift=gear_data[1][2], helical=helical, herringbone=true, gear_spin=gear_data[1][3],backing=3,thickness=ring_thickness,clearance=clearance, $fn=8);

//spur_gear(mod=mod, teeth=gear_data[0][1], profile_shift=gear_data[0][2], helical=helical, herringbone=true, gear_spin=gear_data[0][3],clearance=clearance,thickness=18.5);  //sun

//color("red")move_copies(gear_data[2][4]){
//    difference(){
//    spur_gear(mod=mod, teeth=gear_data[2][1], profile_shift=gear_data[2][2], helical=-helical, herringbone=true, gear_spin=gear_data[2][3][$idx],clearance=clearance,thickness=6);
//    
//    translate([0,0,5-2]) cylinder(10, 8.1/2, 8.6/2, true);
//    cylinder(10, 3.5/2, 3.5/2, true);
//    
//    }
//}
}
}
}
