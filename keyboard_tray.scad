arm_length = 70;
arm_width = 30;
arm_thickness = 15;

fillet_r = 2;

desk_thickness = 25 + 0.3 + fillet_r*2;

keyboard_angle = 5;
keyboard_length = 152+80;

lip_size = 5;

minkowski(){
    sphere(fillet_r, $fn=8);
    difference(){
        translate([0,arm_length-keyboard_length-lip_size,0])
        cube([arm_width, keyboard_length+lip_size, arm_thickness*2 + desk_thickness]);
        translate([0,0,arm_thickness])
        cube([arm_width, arm_length, desk_thickness]);
        
        #
        translate([0,arm_length,0])
        rotate([keyboard_angle,0,0])
        translate([0,0,0])
        cube([arm_width, arm_width, arm_thickness*2 + desk_thickness]);
        
        
        #translate([0,arm_length,arm_thickness*2 + desk_thickness])
        rotate([keyboard_angle,0,0])
        translate([0,-keyboard_length,0])
        keyboard_form();
    }
}

module keyboard_form() {
    cube([arm_width, keyboard_length, desk_thickness]);
    
    translate([0,-arm_thickness-arm_length,-desk_thickness-arm_thickness*2])
    cube([arm_width, keyboard_length, desk_thickness+arm_thickness]);
    
    translate([0,-arm_thickness-lip_size,-desk_thickness-arm_thickness*2])
    cube([arm_width, arm_thickness, desk_thickness+arm_thickness*2+lip_size]);
    
    translate([0,-arm_thickness,lip_size])
    cube([arm_width, arm_thickness,arm_thickness*2]);
    
    
    
}