include <BOSL2/std.scad>
include <BOSL2/gears.scad>

magnet_d = 5+0.5;
magnet_z = 2.5*3+0.5;

spacing = 0.8;

holder_z = 25;
screw_size = "M8";


fork_x = 100;
fork_z = 70;
fork_r = 5;


%up(2){
difference(){
    union(){
        cyl(6, d=20, chamfer1=0.5, anchor=BOT);
        up(3) cyl(6, d=40, chamfer=0.5, anchor=BOT);
        fwd(7) left(15) up(3) cyl(fork_z, d=fork_r*2, anchor=BOT);
        fwd(-7) left(15) up(3) cyl(fork_z, d=fork_r*2, anchor=BOT);
        
        
        intersection(){
        union(){
        fwd(7) left(15) up(3+5) cyl(5, d2=fork_r*2, d1=fork_r*2+5*2, anchor=BOT);
        fwd(-7) left(15) up(3+5) cyl(5, d2=fork_r*2, d1=fork_r*2+5*2, anchor=BOT);
        }
        cyl(50, d=40, chamfer1=0.5, anchor=BOT);
        
        }
        
        
        
        up(fork_z+3) fwd(7) left(15) sphere(r=fork_r);
        up(fork_z+3) fwd(-7) left(15) sphere(r=fork_r);
        
    }
    
    rotate([0,0,65])
    up(6) ycyl(200, d=0.4, anchor=BOT);
    
    rotate([0,0,-65])
    up(6) ycyl(200, d=0.4, anchor=BOT);
    
    cyl(2, d=6, anchor=BOT);
    
    for(i=[0:3])
    rotate([0,0,90*i])
    left(14/2){
    cyl(20, d=3.5);
    up(3) cyl(20, d=6, anchor=BOT);
    }
}
}


up(0){

    for(i=[0:1])
    left(15)
    mirror([i,0,0]){

    left(fork_x/2)
    back(20.5/2+18.41-10.11)
    back(6.11+24.45/2)
    cuboid([fork_r, 45.22, 20], anchor=BOT+BACK);

    fwd(7)
    left(fork_x/2){
        cyl(fork_z, d=fork_r*2, anchor=BOT);
        up(fork_z) sphere(r=fork_r);
    }

    fwd(-7)
    left(fork_x/2){
        cyl(fork_z, d=fork_r*2, anchor=BOT);
        up(fork_z) sphere(r=fork_r);
    }

}



difference(){
    back(20.5/2+18.41-10.11)
    difference(){
        back(6.11+24.45/2)
        union(){
            left(15) cuboid([fork_x+fork_r*2, 45.22,4], anchor=BOT+BACK);

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
