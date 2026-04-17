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
rail_teeth = 40;
rail_angle = 360*rail_teeth/circle_teeth;

gear_d = gear_dist(mod=1, circle_teeth, 0);
root_r = root_radius(mod=1, circle_teeth, 0);

rail_turning_r = root_r-gear_track_width/2;

curved_rail();



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