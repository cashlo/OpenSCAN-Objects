include <BOSL2/std.scad>
include <BOSL2/gears.scad>


number_of_teeth = 60;

rail_length = number_of_teeth*PI;
rail_height = 45;
rail_width  = 25;

base_height = 6;
base_width  = 40;

gear_track_width = 5;


circle_teeth = 200;
rail_teeth = 50;
rail_angle = 360*rail_teeth/circle_teeth;

gear_d = gear_dist(mod=1, circle_teeth, 0);
root_r = root_radius(mod=1, circle_teeth, 0);

rail_turning_r = root_r-gear_track_width/2;


rail_with_interface();

module alig_pin(){
    up(rail_height)
    zrot(45)
    hull(){
        cuboid([gear_track_width, gear_track_width, 1], anchor=TOP);
        
        #down(rail_height/4)
        fwd(gear_track_width)
        left(gear_track_width)
        cuboid([gear_track_width, gear_track_width, 1], anchor=TOP);
    }
    


}

module rail_with_interface(){
difference(){
    curved_rail();
    back(base_width/8)
    zcyl(base_height+0.1, d=base_width/2, anchor=BOT, $fn=100);
    
    back(base_width/8)
    zcyl(base_height+10, d=3, anchor=BOT, $fn=20);
    
    alig_pin();
}

left(rail_turning_r)
rotate([0,0,rail_angle])
right(rail_turning_r)
alig_pin();

left(rail_turning_r)
rotate([0,0,rail_angle])
right(rail_turning_r)
back(base_width/8)
difference(){
    zcyl(base_height, d=base_width/2+0.2, chamfer=0.5, anchor=BOT, $fn=100);

    zcyl(base_height,   d=3.2, anchor=BOT, $fn=20);
    zcyl(base_height/2, d=5.5, anchor=BOT, $fn=20);
    

    
    for(i=[0:13:360])
    rotate([0,0,i+90])
    left(base_width/4)
    rotate([0,0,20])
    cuboid([4,0.8,base_height], anchor=BOTTOM+BACK);
}
}



module rail_head_shape(){
    polygon([
        [-rail_width/2,0], [rail_width/2,0], [rail_width/2,-1], 
        [gear_track_width/2,-1-rail_width/2+gear_track_width/2],
        
        [gear_track_width/2,-rail_height],
        [-gear_track_width/2,-rail_height],
        
        [-gear_track_width/2,-1-rail_width/2+gear_track_width/2],
        [-rail_width/2,-1]
        ]);
}


module curved_rail(){

    up(rail_height)
    color("green")
    left(rail_turning_r)
    rotate_extrude(rail_angle, $fn=100)
    right(rail_turning_r)
    rail_head_shape();
    
    difference(){
    left(root_r-gear_track_width/2)
    rotate([0,0,-90+360/circle_teeth/2])
    mirror([1,0,0])
    spur_gear(mod=1,teeth=circle_teeth, thickness=rail_height, hide=circle_teeth-rail_teeth, anchor=BOT);
    
    left(gear_d-gear_track_width/2-1.3)
    zcyl(rail_height, r=rail_turning_r, anchor=BOT, $fn=100);
    }
    
    left(rail_turning_r)
    linear_extrude(base_height)
    ring(r1=rail_turning_r-base_width/2,r2=rail_turning_r+base_width/2, angle=rail_angle, n=100);
}