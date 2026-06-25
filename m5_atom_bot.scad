include <BOSL2/std.scad>

module atom_holder(){

    for(m=[0:1])
    mirror([m,0,0])
    up(3+24)
    left(24/2)
    rotate([0,45,0])
    cuboid([2,11,2]);

    difference(){
    union(){
        cuboid([30,19,30], anchor=BOT);
        
        
    }
    for(m=[0:1])
    mirror([0,m,0])
    fwd(6)
    up(10)
    cuboid([31,1,30], anchor=BOT);
    
    
    up(3)
    cuboid([24.3,13.1,30], anchor=BOT);
    
    up(3+3)
    fwd(3)
    cuboid([18,13.1,18], anchor=BOT);
    
    up(3)
    back(3)
    cuboid([24.2,13.1,24.2], anchor=BOT);
    
    
    
    hull(){
        up(4.5+24)
        cuboid([24.3,13.1,30], anchor=BOT);
        up(4.5+24+3)
        cuboid([30,19,30], anchor=BOT);
    }
    
    }
}

module atom(){
    color("grey")
    cuboid([24.0,12.8,24.0], rounding=2, edges="Y", anchor=BOT);
}


atom_holder();

cuboid([29,18,30], anchor=TOP);

for(m=[0:1])
mirror([m,0,0]){
right(10)
down(10)
rotate([0,45,0])
cuboid([10,10,30], anchor=BOT);

down(30)
right(7)
cuboid([12,16,30], anchor=TOP);

down(60)
right(7)
cuboid([12,30,7], anchor=TOP);



}



*up(3.1)
atom();
