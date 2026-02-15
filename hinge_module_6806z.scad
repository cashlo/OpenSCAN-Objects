include <BOSL2/std.scad>
include <BOSL2/gears.scad>
include <servo_teeth.scad>
include <bearing.scad>

case_length = 55;
case_width = 60;

mod=0.8;
helical=0;
clearance=0.2;
max_teeth=65;
gears = 3;
gear_ratio = 9;

ring_thickness = 10;
bearing_size = 40;

gear_data = planetary_gears(mod=mod, n=gears, max_teeth=max_teeth, sun_carrier=gear_ratio, helical=helical, gear_spin=360/27*$t);

if(true){
case(top=true);

fwd(0.5)
for(i=[0:1])
mirror([0,i,0])
rotate([0,45,0])
translate([0,-27/2,case_width/2+4])
3d_mouth_with_hole();
}

if(true)
difference(){
    arm();
    
    back(case_length/2+1)
    rotate([90,0,0])
    move_copies(gear_data[2][4])
    cyl(50, 2.8/2, 2.8/2);
    
    fwd(case_length/2-5-12.2)
        ycyl(l=0.1, d=200, anchor=BACK);
}

rotate([-90,0,0])
sun();

module sun(){

up(10)
spur_gear(mod=mod, teeth=gear_data[0][1], profile_shift=gear_data[0][2], helical=helical, herringbone=true, gear_spin=gear_data[0][3],clearance=clearance,thickness=20);


difference(){
cylinder(6, 30/2, 30/2);


for(i=[0:3])
rotate([0,0,90*i+45])
translate([10,0,0])
cylinder(10, 3.5/2, 3.5/2);

}
}



module bearing(){

    rotate([90,0,0]){
    inner_ring();
    spacer();
    outer_ring(fn=30);
    }
}


module arm() {
    profile_shift = gear_data[1][2];

    or = outer_radius(mod=mod, teeth=gear_data[1][1], clearance=clearance, helical=helical, profile_shift=profile_shift, internal=true);

    ring_r = or+profile_shift*mod+2; 


    back(case_length/2+1)
    hull()
    {
    ycyl(l=10, d=ring_r*2, anchor=FRONT);
    left(case_width/2+15) cuboid([10,10,20],chamfer=2, anchor=FRONT);
    
    }
    
    fwd(case_length/2+1)
    difference(){
    hull()
    {
    ycyl(l=10, d=55, anchor=BACK);
    left(case_width/2+15) cuboid([10,10,20],chamfer=2, anchor=BACK);
    
    }
    
    ycyl(l=7, d=42, anchor=BACK);
    
    for(i=[0:6:360])
    rotate([0,i,0])
    left(21)
    fwd(0)
    rotate([0,40,0])
    cuboid([8,7,0.8], anchor=BACK);
    
    #
    fwd(7)
    ycyl(l=0.2, d=48, anchor=BACK);
    
    ycyl(l=11, d=38, anchor=BACK);
    
    }
    
    hull()
    {
    back(case_length/2+1) left(case_width/2+15) cuboid([10,10,20],chamfer=2, anchor=FRONT);
    fwd(case_length/2+1) left(case_width/2+15) cuboid([10,10,20],chamfer=2, anchor=BACK);
    
    }
    
    
    back(case_length/2+1)
    rotate([90,0,0])
    move_copies(gear_data[2][4])
    cyl(4, 6/2, 6/2);
    
    fwd(0.5)
    for(i=[0:1])
    mirror([0,i,0])
    rotate([0,-90,0])
    translate([0,-27/2,case_width/2+20])
    3d_mouth_with_hole();

}

module case(top=true){






    difference(){
        cuboid([case_width,case_length,case_width], chamfer=10);
        
        
        for(i=[0:3])
        rotate([0,90*i,0])
        up(12)
        rotate([0,45,0])
        cuboid([case_width,case_length+1,case_width],anchor=BOT+RIGHT);
        
        
        
        
        fwd(case_length/2-5){
        cuboid([40.2,12.2,40.2], anchor=FRONT);
        }

        fwd(case_length/2-5-12.2)
        ycyl(l=case_length-5-12.2, d=43.5, anchor=FRONT);
        
        fwd(case_length/2-42)
        ycyl(l=case_length-5-12.2, d=55, anchor=FRONT);
        
        
        fwd(case_length/2-5-12.2)
        ycyl(l=0.1, d=100, anchor=BACK);
        
        //screw_holes
        fwd(case_length/2-5-12.2+2.5)
        for(i=[0:2])
        mirror([0,1,0])
        rotate([0,-45-90*i,0])
        up(case_width/2+5){
        ycyl(l=50, d=15, anchor=FRONT);
        down(4){
            $fn=10;
            #ycyl(l=50, d=3.1);
            ycyl(l=2, d1=3.1, d2=6, anchor=BACK);
            
            fwd(5)
            down(4)
            cuboid([5.6,2.5,10], anchor=BOT+BACK);
            
        }
        }
        
        
    }
    
    fwd(case_length/2)
    ycyl(l=1, d=32, anchor=BACK);
    
    fwd(case_length/2)
    difference(){
    union(){
    ycyl(l=5, d=30+0.4, anchor=BACK);
    fwd(5)
    ycyl(l=4, d2=30+0.4, d1=30, anchor=BACK);
    
    }
    
    for(i=[0:10:360])
    rotate([0,i,0])
    left(15)
    fwd(1)
    rotate([0,40,0])
    cuboid([6,10,0.8], anchor=BACK);
    
    fwd(1)
    difference(){
    ycyl(l=0.2, d=32, anchor=BACK);
    ycyl(l=0.2, d=32-6, anchor=BACK);
    }
    
    
    }
    
}



if(true){
back(case_length/2-5)
rotate([90,0,0]){
ring_gear(mod=mod, teeth=gear_data[1][1], profile_shift=gear_data[1][2], helical=helical, herringbone=true, gear_spin=gear_data[1][3],backing=3,thickness=ring_thickness,clearance=clearance);

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