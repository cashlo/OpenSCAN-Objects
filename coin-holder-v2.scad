
coin_holder();


module revolve_text(radius, chars) {
    PI = 3.14159;
    circumference = 2 * PI * radius;
    chars_len = len(chars);
    font_size = circumference / chars_len;
    step_angle = 360 / chars_len;
    for(i = [0 : chars_len - 1]) {
        rotate(-i * step_angle) 
            translate([0, radius + font_size / 2, 0]) 
                text(
                    chars[i], 
                    font = "Courier New; Style = Bold", 
                    size = font_size, 
                    valign = "center", halign = "center"
                );
    }

}



module coin_holder() {
    distance=32;
    height=17.5;
    width=40;
    mirror_distance=25;
    tolerance=0.3;
    holder=2.7;
    window=17;
    font_size=4.5;
    
    
    difference() {
        translate([0,0,-1]) cylinder(height, distance, distance, $fn=6);
        
        //#translate([0,0,-1]) linear_extrude(0.6) revolve_text(12, "YoYoYoYoYoYoYoYoYoYo");
        
        cylinder(50, 11.3, 11.3, center=true);
        
        translate([0,16,height-2])
            rotate([0,0,-180])
            linear_extrude(50)
            text("€2", font_size, halign="center");
        translate([0,mirror_distance,0])
            coin_slot(25.75, 2.20, 5, window, holder, tolerance); // 2 Euro
        
        rotate([0,0,-60])
            translate([0,16,height-2])
            rotate([0,0,-180])
            linear_extrude(50)
            text("€1", font_size, halign="center");       
        rotate([0,0,-60])
            translate([0,mirror_distance,0])
            coin_slot(23.25, 2.33, 5, window, holder, tolerance); // 1 Euro

        rotate([0,0,-60*2])
            translate([0,16,height-2])
            rotate([0,0,-180])
            linear_extrude(50)
            text("50c", font_size, halign="center");        
        rotate([0,0,-60*2])
            translate([0,mirror_distance,0])
            coin_slot(24.25, 2.38, 5, window, holder, tolerance); // 0.5 Euro
            
        rotate([0,0,-60*3])
            translate([0,16,height-2])
            rotate([0,0,-180])
            linear_extrude(50)
            text("20c", font_size, halign="center");
        rotate([0,0,-60*3])
            translate([0,mirror_distance,0])
            coin_slot(22.25, 2.14, 6, window, holder, tolerance); // 0.2 Euro

            
        rotate([0,0,-60*4])
            translate([0,16,height-2])
            rotate([0,0,-180])
            linear_extrude(50)
            text("10c", font_size, halign="center");
        rotate([0,0,-60*4])
            translate([0,mirror_distance,0])
            coin_slot(19.75, 1.93, 7, window, holder, tolerance); // 0.1 Euro
            
            
        rotate([0,0,-60*5])
            translate([0,16,height-2])
            rotate([0,0,-180])
            linear_extrude(50)
            text("5c", font_size, halign="center");
        rotate([0,0,-60*5])
            translate([0,mirror_distance,0])
            coin_slot(21.25, 1.67, 8, window, holder, tolerance); // 0.05 Euro
        
    }
}

module coin_slot(diameter, height, stack, window, holder, tolerance) {
space=10;
    hull() {
    cylinder(h=height*stack+tolerance, d=diameter+tolerance, center=false);
    cylinder(h=height*stack+tolerance+(diameter+tolerance-window)/2, d=window, center=false);
    }
translate([-(diameter+tolerance)/2,holder,0]) 
    hull() {
    cube([diameter+tolerance, diameter/2-holder, height*stack+tolerance], false);
    translate([(diameter+tolerance-window)/2,0,0]) cube([window, diameter/2-holder, height*stack+tolerance+(diameter+tolerance-window)/2], false);
    }

translate([0,0,-space]) {
    cylinder(h=height*stack+space*2, d=window, center=false);
    translate([-window/2, 0,0]) 
        cube([window, window/2, height*stack+space*2], false);
}

}