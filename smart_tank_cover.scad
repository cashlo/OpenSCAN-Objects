include <BOSL2/std.scad>
include <BOSL2/bottlecaps.scad>

d_out = 131;
d_in  = 126;

d_camera = 7.3;

board_x = 18.1;
board_y = 22;
board_wall = 1.2;


difference(){
    union(){
        cylinder(2, d=d_out);
        cylinder(4, d=d_in);
    }
    
    cylinder(5, d=d_camera);
    
    
    back(10){
    up(1)
    cuboid(
        [d_out,
        10.2,
        2],
        anchor=BOTTOM
    );
    #
    left(d_in/2)
    up(1.5)
    cuboid(
        [10.2,
        10.2,
        2],
        anchor=TOP
    );
    
    up(1)
    cuboid(
        [d_out,
        8,
        4],
        anchor=BOTTOM
    );
    
    
    }
}

rotate([180,0,0])
difference(){
generic_bottle_neck(
    id=70,
    neck_d=75,
    thread_od=76.2,
    height=12
);

#
translate([0,30,0])
cuboid(
        [12,
        20,
        8],
        anchor=BOTTOM
    );
}

*translate([0,0,-130])
generic_bottle_cap(
    neck_od=75,
    thread_od=76.2,
    height=12
);



translate([0,board_y/2-3.5,0])
difference(){
    cuboid(
        [board_x+board_wall*2,
        board_y+board_wall*2,
        15],
        anchor=TOP
    );

    cuboid(
        [board_x,
        board_y,
        20],
        anchor=TOP
    );
    
    
    #
    translate([0,-10,0])
    cuboid(
        [10,
        board_y,
        20],
        anchor=TOP
    );
    
    #
    translate([10,9.5,0])
    cuboid(
        [board_x,
        1.5,
        20],
        anchor=TOP
    );
    
    
}
