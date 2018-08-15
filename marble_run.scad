tube_size = 5;
tube_thickness = 1.5;

total_size = tube_size+tube_thickness;



module turn(radius, turn_angle, angle){
    translate([-radius,0,0])
    difference(){
        rotate_extrude(angle=turn_angle)
        translate([radius,0,0])
        difference(){
            circle(total_size);
            circle(tube_size);
            rotate([0,0,angle]) translate([-total_size, 0, 0])square(total_size*2);
        }
        translate([-radius-total_size,0,-total_size]) cube([(radius+total_size)*2,radius+total_size,total_size*2]);
        rotate([0,0,180-turn_angle]) translate([-radius-total_size,0,-total_size]) cube([(radius+total_size)*2,radius+total_size,total_size*2]);
    }
    
    
      
}

module tube(length, start_angle, end_angle, drop){
    drop_angle = 90-atan2(length, drop);
    difference(){
        union(){        
            translate([0, -length, -drop]) rotate([drop_angle,0,0]) rotate([0,90+end_angle,0]) turn(0, drop_angle, 90);
            rotate([drop_angle+90,0,0])
            linear_extrude( sqrt(pow(length,2)+pow(drop,2)) , twist=end_angle-start_angle)
            difference(){
                circle(total_size);
                #circle(tube_size);
                rotate([0,0,start_angle]) translate([-total_size, 0, 0])square(total_size*2);
            }
        }
        translate([-total_size, 0, -total_size*2]) cube([total_size*2,total_size,total_size*2]);
    }
}
rotate([0,90,180]) turn(0, 90, 90);
level_drop = 6;
for (level = [0:3]) {
    translate([0,0,-level_drop*2*level]) rotate([0,0,90*level]) {
        tube(30, 0, 0, level_drop);
        translate([0,-30,-level_drop]) turn(30, 180, 0);
        translate([-60,-30,-level_drop]) rotate([0,0,180]) turn(30, 90, 0);
        translate([-30,0,-level_drop]) rotate([0,0,90]) tube(30, 0, 0, level_drop);
    }

}
translate([0,0,-level_drop*4*2]) rotate([0,90,0]) turn(0, 90, 90);