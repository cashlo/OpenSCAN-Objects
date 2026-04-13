include <robot_rail.scad>
include <BOSL2/std.scad>

*rail_with_interface();

rail_height = 45;
rail_width  = 25;


difference(){
up(rail_height+2)
cuboid([rail_width+6,30,20], chamfer=0.5, anchor=BOTTOM);

up(rail_height+24/2)
rotate([0,90,0])
zcyl(10, d=26, chamfer=0.5);

up(rail_height)
cuboid([10,26,26/2], chamfer=0.5, anchor=BOTTOM);

up(rail_height)
cuboid([15,8,26/2-2], chamfer=0.5, anchor=BOTTOM);

up(rail_height+24/2)
xcyl(15, d=8, chamfer=0.5);



}

xcyl(15-0.1, d=8-0.1, chamfer=0.5);

up(20)
bearing_cap();


for(i=[0:1])
mirror([i,0,0])
{


difference(){
hull(){
    up(rail_height+2)
    right(rail_width/2+2)
    cuboid([2,30,20], chamfer=0.5, anchor=LEFT+BOTTOM);

    up(rail_height-rail_width/4+1)
    right(rail_width/4+2)
    rotate([0,45,0])
    right(24/2)

    up(5)
    difference(){
    zcyl(2, d=25, chamfer=0.5, anchor=BOT);
    left(24/2-3)
    cuboid([30,30,30], anchor=RIGHT);
    }
}

#up(rail_height-rail_width/4+1)
    right(rail_width/4+2)
    rotate([0,45,0])
    right(24/2)
    zcyl(20, d=2.8, chamfer=0.5, anchor=BOT);
}


up(rail_height-rail_width/4+1)
right(rail_width/4+2)
rotate([0,45,0])
right(24/2){
%bearing_6282z();
side_kart();
}


%up(rail_height+24/2)
rotate([0,90,0])

bearing_6282z();

}

module side_kart(){
    mirror([0,0,1])
    bearing_cap(screw_d=2.8, false);
    
    
}




module bearing_cap(screw_d=3.3, screw_cap=true){
    down(4+2)
    difference(){
        union(){
            zcyl(2, d=11, chamfer=0.5, anchor=BOT);
            up(2)
            zcyl(4, d=8-0.2, chamfer2=0.5, anchor=BOT);
        }
        zcyl(20, d=screw_d, anchor=BOT);
        if(screw_cap){
            zcyl(3, d=6.3, anchor=BOT);
        }
        
    }

}




module bearing_6282z(){
    difference(){
        zcyl(8, d=24, chamfer=0.5);
        down(1) zcyl(10, d=8);
    }
}