include <BOSL2/std.scad>
include <BOSL2/gears.scad>

plate_z = 50;
plate_y = 2;
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
        up(appear_time*40+10)children();
    }
}


module plate(){
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
            ycyl(d=or*2+2, h=10);
        };
    }
}


module stick(){

    translate([0,-50, 25])
    cuboid([5,110,10], anchor=BOT);
    
    translate([-0.5,-105, 25])
    cuboid([6,1,10], anchor=BOT);
    
    
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

left(40)
rotate([90,0,0])
down(plate_y/2)
{
m5_atom_stack_holder();
% up(2) m5_atom_stack();
}

plate();




translate([28,0,4.5])
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
cyl(d=4.0, h=4, anchor=BOT);



rotate([0,0,-55])
down(2)
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
