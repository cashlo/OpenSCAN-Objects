include <BOSL2/std.scad>
include <BOSL2/screws.scad>

magnet_d = 7;
magnet_z = 2.5*2+0.5;

spacing = 0.8;

holder_z = 25;
screw_size = "M8";




holder_size = (magnet_d*2+spacing*3)/3^0.5*2;

//left_half()
% down(10)
difference(){
    cyl(holder_z, d=holder_size, $fn=6, chamfer=0.5, anchor=BOT);
    
    // Magnet space
    for(i=[0:1])
    rotate([0,0,180*i])
    translate([magnet_d/3,magnet_d/2+spacing/2,0.8]){
    #cyl(magnet_z, d=magnet_d, anchor=BOT);
    #cuboid([magnet_d*2, magnet_d,magnet_z], anchor=BOT+RIGHT);
    }
    
    #
    up(magnet_z+spacing*2)
    screw_hole(screw_size, l=holder_z-magnet_z-spacing*2,thread=true,anchor=BOT, bevel2=true);
}

% up(holder_z){
difference(){
    cyl(4, d=20, chamfer=0.5, anchor=BOT);
    
    up(2)
    cyl(2, d=6, anchor=BOT);
    
    for(i=[0:3])
    rotate([0,0,90*i])
    left(14/2){
    cyl(20, d=3.5);
    cyl(2, d=6, anchor=BOT);
    }
}
screw(screw_size, l=holder_z-magnet_z-spacing*2,thread=true,anchor=TOP, bevel2=false);
}

//left_half()
up(holder_z+3){

up(-6)
difference(){
cyl(holder_z+10, d=holder_size+5, $fn=6, chamfer1=0.5, anchor=TOP);
cyl(holder_z+10-0.8, d=holder_size+1, $fn=6, chamfer1=0.5, anchor=TOP);
}

difference(){
    back(20.5/2+18.41-10.11)
    difference(){
        back(6.11+24.45/2)
        union(){
            cuboid([24.72, 45.22,4], anchor=BOT+BACK);
            cuboid([10, 45.22-18,30], anchor=TOP+BACK);
        }
        
        
        back(6.11+24.45/2)
        up(4-1.5)
        cuboid([14.5, 45.22,1.5], anchor=BOT+BACK);
        

        for(i=[0:1])
        for(j=[0:1])
        mirror([0,i,0])
        mirror([j,0,0])
        translate([20.5/2,20.5/2,0]){
        cyl(20, d=2.5);
        down(0) cyl(2, d=4, anchor=BOTTOM);
        
        }


    };
    
    cyl(12, d=22);
}
}