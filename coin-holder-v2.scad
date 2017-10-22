
coin_holder();



module coin_holder() {
    distance=34;
    height=17.5;
    width=40;
    mirror_distance=26;
    tolerance=0.3;
    holder=3;
    window=17;
    
    
    difference() {
        translate([0,0,-1]) cylinder(height, distance, distance, $fn=6);
        
        cylinder(50, 12, 12, center=true);
        
        translate([0,17,height-2])
            rotate([0,0,-180])
            linear_extrude(50)
            text("€2", 4, halign="center");
        translate([0,mirror_distance,0])
            coin_slot(25.75, 2.20, 5, window, holder, tolerance); // 2 Euro
        
        rotate([0,0,-60])
            translate([0,17,height-2])
            rotate([0,0,-180])
            linear_extrude(50)
            text("€1", 4, halign="center");       
        rotate([0,0,-60])
            translate([0,mirror_distance,0])
            coin_slot(23.25, 2.33, 5, window, holder, tolerance); // 1 Euro

        rotate([0,0,-60*2])
            translate([0,17,height-2])
            rotate([0,0,-180])
            linear_extrude(50)
            text("50c", 3, halign="center");        
        rotate([0,0,-60*2])
            translate([0,mirror_distance,0])
            coin_slot(24.25, 2.38, 5, window, holder, tolerance); // 0.5 Euro
            
        rotate([0,0,-60*3])
            translate([0,17,height-2])
            rotate([0,0,-180])
            linear_extrude(50)
            text("20c", 4, halign="center");
        rotate([0,0,-60*3])
            translate([0,mirror_distance,0])
            coin_slot(22.25, 2.14, 6, window, holder, tolerance); // 0.2 Euro

            
        rotate([0,0,-60*4])
            translate([0,17,height-2])
            rotate([0,0,-180])
            linear_extrude(50)
            text("10c", 4, halign="center");
        rotate([0,0,-60*4])
            translate([0,mirror_distance,0])
            coin_slot(19.75, 1.93, 7, window, holder, tolerance); // 0.1 Euro
            
            
        rotate([0,0,-60*5])
            translate([0,17,height-2])
            rotate([0,0,-180])
            linear_extrude(50)
            text("5c", 4, halign="center");
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