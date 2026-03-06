include <BOSL2/std.scad>
include <BOSL2/gears.scad>

magnet_d = 5+0.5;
magnet_z = 2.5*3+0.5;

spacing = 0.8;

holder_z = 25;
screw_size = "M8";


up(2){
difference(){
    union(){
        up(4)
        spur_gear(mod=1, teeth=25, thickness=8, herringbone=true, helical=20, anchor=BOT);
        
        cyl(4, d=20, chamfer1=0.5, anchor=BOT);
    }
    
    cyl(2, d=6, anchor=BOT);
    
    for(i=[0:3])
    rotate([0,0,90*i])
    left(14/2){
    cyl(20, d=3.5);
    up(2) cyl(20, d=6, anchor=BOT);
    }
}
}


% up(0){

difference(){
    back(20.5/2+18.41-10.11)
    difference(){
        back(6.11+24.45/2)
        union(){
            cuboid([24.72, 45.22,4], anchor=BOT+BACK);
        }
        
        
        back(6.11+24.45/2)
        up(0)
        cuboid([14.5, 45.22,1.5], anchor=BOT+BACK);
        

        for(i=[0:1])
        for(j=[0:1])
        mirror([0,i,0])
        mirror([j,0,0])
        translate([20.5/2,20.5/2,0]){
        cyl(20, d=2.5);
        up(2) cyl(2, d=4, anchor=BOTTOM);
        
        }


    };
    
    cyl(12, d=22);
}
}

d = gear_dist(mod=1,25,0,helical=20);

% up(10)
//back(30)
right(d){
rack(mod=1, teeth=23, thickness=8, herringbone=true, helical=20, orient=LEFT, spin=90);

back(50)
right(2.25*1.5+0.1)
difference(){
cuboid([magnet_d, 20,8], anchor=RIGHT+BACK);
fwd(0.5)
cuboid([magnet_d, magnet_z ,magnet_d], anchor=RIGHT+BACK);
}
}

%back(20.5/2+18.41-10.11)
back(6.11+24.45/2)
right(d+2.25*1.5+0.4){
cuboid([4, 45.22,16], anchor=BOT+LEFT+BACK);
cuboid([5, 45.22,4], anchor=BOT+RIGHT+BACK);
back(40)
right(4)
difference(){
cuboid([magnet_d+4*2, 40,18], anchor=BOT+RIGHT+BACK);
translate([-4,-0.5,4])
cuboid([magnet_d+0.5, 40,10+0.5], anchor=BOT+RIGHT+BACK);
}




}
