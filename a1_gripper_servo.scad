include <BOSL2/std.scad>
include <BOSL2/gears.scad>

plate_z = 50;
plate_y = 8;
plate_x = 53.5;

plate_r = 5.5;

idler_angle = 50;
teeth = 15;

d = gear_dist(mod=1,teeth,teeth,helical=30);
or = outer_radius(mod=1,teeth=teeth,helical=30);

anime = false;

module appear_and_rotate(appear_time = 0, direction = 1){
    if(anime){
        zrot($t*360*direction)
        up(max(0, 10-($t-appear_time)*40)) 
        if($t > appear_time)
        children();
    } else {
        up(appear_time*100+10)children();
    }
}


module plate(){
    difference(){
        left(20)
        cuboid([plate_x+20,plate_y,plate_z], rounding=plate_r, edges="Y");
        
        // Upper left hole
        translate([-plate_x/2+plate_r,plate_y/2-1.5,plate_z/2-plate_r]){
            ycyl(d=6.5, h=20, anchor=BACK);
            ycyl(d=3, h=10);
        };
        
        // Lower left hole
        down(35)
        translate([-plate_x/2+plate_r,plate_y/2-1.5,plate_z/2-plate_r]){
            ycyl(d=6.5, h=10, anchor=BACK);
            ycyl(d=3, h=10);
        };
        
        // Shaft hole
        translate([28,0,4.5])
        down(35)
        translate([-plate_x/2+plate_r,0,plate_z/2-plate_r]){
            ycyl(d=12, h=10);
        };
    }
    
    
    // Servo holder
    fwd(plate_y/2)
    down(4)
    difference(){
        cuboid([25+4, 10, 32+4],anchor=BACK,rounding=plate_r/2, edges="Y");
        
        
        cuboid([25, 11, 32],anchor=BACK);
        
        fwd(8)
        hull(){
            cuboid([25, 11, 32],anchor=BACK);
            fwd(2)
            cuboid([25+4, 11, 32+4],anchor=BACK);
        }
        
        
        down(3)
        cuboid([14, 11, 32],anchor=BACK);
        
        up(3)
        fwd(5)
        cuboid([19, 11, 32],anchor=BACK);
        
        // Servo screw hole
        for(i=[0:1])
        mirror([i,0,0])
        left(10)
        down(20)
        fwd(6.5)
        cyl(d=2, h=10);
        
        for(i=[0:1])
        mirror([i,0,0])
        left(10)
        up(20)
        fwd(2.5)
        cyl(d=2, h=10);
        
        
    }
    
    // Board holder
    left(40)
    fwd(plate_y/2){
    
        for(i=[0:1])
        mirror([i,0,0])
        left(26.5/2)
        up(5)
        fwd(4)
        rotate([0,0,45])
        cuboid([1, 1, 10],anchor=BACK);
    
        difference(){
            
            cuboid([25.2+4, 10, 42.2+4],anchor=BACK,rounding=plate_r/2, edges="Y");
            
            
            
            
            cuboid([25.2, 11, 42.2],anchor=BACK);
            cuboid([16, 11, 50],anchor=BACK);
            
            left(4)
            down(10)
            cuboid([25.2, 11, 15],anchor=BACK);
            
            fwd(8)
            hull(){
                cuboid([25.2, 11, 42.2],anchor=BACK);
                fwd(2)
                cuboid([25.2+4, 11, 42.2+4],anchor=BACK);
            }
            
        }
    
    }
}

fwd(50){
finger_1();
left(30)
finger_2();
}


module finger_2(){
    up(40)
    back(3.5){
    
    difference(){
    left(5/2)
    up(25/2+1)
    back(32.2+2)
    cuboid([25+5, 32.2+4, 2], anchor=BACK);
    
    
    up(18.5)
    back(15)
    mirror([0,0,1])
    servo_horn_screws();
    }
    
    back(32.2+2)
    difference(){
    left(5/2)
    cuboid([25+5, 2, 25], anchor=BACK);
    left(5/2)
    cuboid([19, 2, 19], anchor=BACK);
    
    for(i=[0:1])
    rotate([0,90*i,0])
    translate([10,0,10])
    ycyl(20, d=2);
    
    #translate([10-25,0,10])
    ycyl(20, d=2);
    
    #translate([10-25,0,-10])
    ycyl(20, d=2);
    
    right(18)
    ycyl(20, d=23);
    
    
    }
    
    up(18.5)
    back(15)
    mirror([0,0,1])
    servo_horn();
    
    
    
    difference(){
    union(){
    cuboid([25, 2, 25], anchor=BACK);
    
       hull(){
        cuboid([12, 2, 25], anchor=BACK);
        
        right(5)
        down(40)
        fwd(3.5)
        translate([0, -15, 20])
        cuboid([5, 25+1, 8+1]);
       }
    }
    
    cuboid([25, 2, 14], anchor=BACK);
    
    for(i=[0:3])
    rotate([0,90*i,0])
    translate([10,0,10])
    ycyl(20, d=2);
    
    right(18)
    ycyl(20, d=23);
    
    
    }
    
    
    }
    
    
    
    hull(){
    fwd(15)
    right(10)
    up(1)
    cuboid([5, 25+1, 8+1], rounding=4, edges="X");
    
    right(5)
    translate([0, -15, 20])
    cuboid([5, 25+1, 8+1]);
    }
    

    

}

module servo_horn_screws(){

    cyl(2, d=6, anchor=BOT);

    for(i=[0:3])
    rotate([0,0,90*i])
    left(14/2){
    cyl(20, d=3.5);
    up(2) cyl(20, d=6, anchor=BOT);
    }
}

module servo_horn(){

    difference(){
    union(){
        cyl(6, d=22, chamfer1=0.5, anchor=BOT);
        //up(3) cyl(6, d=35, chamfer=0.5, anchor=BOT);
        
    }
    
    
    
    
    servo_horn_screws();

    
}
}

module finger_1(){

    hull(){
    fwd(15)
    rotate([0,20,0])
    cuboid([5, 25+1, 8+1], rounding=4, edges="X");
    
    translate([10, -15, 20])
    cuboid([5, 25+1, 8+1]);
    }
    
    difference(){
    up(40)
    rotate([90,0,0])
    hull(){
    servo_horn();
    
    rotate([-90,0,0])
    translate([10, -15, -20])
    cuboid([5, 25+1, 8+1]);
    }
    
    up(40)
    rotate([90,0,0])
    servo_horn_screws();
    }
}


module stick(){
    
    translate([0,0, 25])
    cuboid([14,60,12], anchor=BOT+BACK);
    
    hull(){
        translate([0,-60, 25])
        cuboid([14,1,12], anchor=BOT+BACK);
        
        translate([-10,-110, 25+5])
        cuboid([5,0.2,7], anchor=BOT+BACK);
    }
    
    hull(){
        translate([-10,-110, 25+5])
        cuboid([5,0.2,7], anchor=BOT+BACK);

        translate([-11,-111, 25+5])
        cuboid([5,0.2,7], anchor=BOT+BACK);
    
    }
    
    
    
    
    
    
    //left_half()
    difference(){
    translate([0,0,2])
    cyl(d=14, h=35, anchor=BOT);
    
    cyl(d=8.4, h=20, anchor=BOT,$fn=30);
    
    up(14.5)
    cyl(d=10, h=5, anchor=BOT,$fn=30);
    

    translate([5,-80, 0])
    rotate([90,0,0])
    cuboid([5,85,5]);

    for(i=[0:10])
    translate([0,-80+i*2,0])
    rotate([90,0,45])
    cuboid([5,85,5]);
    }
}

module gear_shaft(h=8){
    difference()
    {
    union(){
        cyl(d=10, h=plate_y, anchor=BOT);
        cyl(d=8, h=h, anchor=BOT, $fn=20);
        up(h-0.7)
        cyl(d1=8.5,d2=8, h=2, anchor=BOT, $fn=20);
    }
    up(h)
    cuboid([1,10,h+2]);
    }
}

module feetech_STS3215(){
    color("grey")
    cuboid([45.23, 24.73, 32], rounding=2, edges="Z", anchor=BOT);
    
    color("grey")
    down(2)
    cuboid([45.23, 14, 35], anchor=BOT);
    
    color("grey")
    down(2)
    cuboid([45.23, 18.3, 32], anchor=BOT);
    
    color("silver")
    down(2)
    right(3)
    cyl(d=20, h=36.2, anchor=BOT+LEFT);
}


module m5_atom_stack(){
    color("grey")
    cuboid([24.0,31.6,24.0], rounding=2, edges="Y", anchor=BOT);
}

module m5_atom_stack_holder(){
    difference(){
        cuboid([30,38,14], anchor=BOT);
        up(2)
        cuboid([24.4,32,12], anchor=BOT);
        
        hull(){
        up(12)
        cuboid([24.4,32,14], anchor=BOT);
        
        up(14)
        cuboid([30,38,14], anchor=BOT);
        }
        
        
        
        up(2+12)
        ycyl(d=20, h=20, anchor=BACK);
    }
}


plate();

*feetech_STS3215();




*translate([28,0,4.5])
down(35)
translate([-plate_x/2+plate_r,0,plate_z/2-plate_r])
rotate([90,0,0]){


color("red")
up(4.5)
appear_and_rotate(0) {
difference()
{
    spur_gear(
        mod=1, teeth=teeth, thickness=7, shaft_diam=0,
        helical=30, herringbone=true, slices=10
    );

    #down(3.5)
    rotate([0,0,20])
    cyl(d=4.0, h=10, anchor=BOT);



    rotate([0,0,-55])
    down(1)
    right(2.5){
    xcyl(d=3.0, h=10, anchor=LEFT);
    xcyl(d=5.0, h=0.4, anchor=LEFT);
    }
}
}

a1 = 360/teeth/2+idler_angle*4;
a2 = a1-360/teeth/2;
a3 = -a2+360/teeth/2;

color("green")
up(4.5)
right(d*sin(idler_angle))
back(d*cos(idler_angle))
appear_and_rotate(0.2, -1)
zrot(a1)
spur_gear(
    mod=1, teeth=teeth, thickness=5, shaft_diam=8.4,
    helical=-30, herringbone=true, slices=5
);

right(d*sin(idler_angle))
back(d*cos(idler_angle))
gear_shaft();


color("blue")
up(4.5)

back(d*cos(idler_angle)*2)
appear_and_rotate(0.4, 1)
{
zrot(a2) spur_gear(
    mod=1, teeth=teeth, thickness=5, shaft_diam=8.4,
    helical=30, herringbone=true, slices=5
);

stick();
}

back(d*cos(idler_angle)*2) gear_shaft(h=20);


color("purple")
up(4.5)
left(d)
back(d*cos(idler_angle)*2)
appear_and_rotate(0.6, -1){
zrot(a3) spur_gear(
    mod=1, teeth=teeth, thickness=5, shaft_diam=8.4,
    helical=-30, herringbone=true, slices=5
);

mirror([1,0,0])
stick();
}

left(d)
back(d*cos(idler_angle)*2)
gear_shaft(h=20);

}
