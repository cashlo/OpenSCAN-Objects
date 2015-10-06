
coin_holder();

module coin_holder() {
    distance=27;
    width=40;
    mirror_distance=12.5;
    tolerance=0.3;
    
    difference() {
        translate([-distance/2-1,-width/2,-2])
            cube([distance*3+2, width, 15], false);
        
        #translate([0,mirror_distance,0]) coin_slot(25.75, 2.20, 5, 18, 3, tolerance); // 2 Euro
        translate([distance,mirror_distance,0]) coin_slot(23.25, 2.33, 5, 18, 3, tolerance); // 1 Euro
        translate([distance*2,mirror_distance,0]) coin_slot(24.25, 2.38, 5, 18, 3, tolerance); // 0.5 Euro
        mirror([0,1,0]) {
            translate([0,mirror_distance,0]) coin_slot(22.25, 2.14, 5, 18, 3, tolerance); // 0.2 Euro
            translate([distance,mirror_distance,0]) coin_slot(19.75, 1.93, 5, 18, 3, tolerance); // 0.1 Euro
            translate([distance*2,mirror_distance,0]) coin_slot(21.25, 1.67, 5, 18, 3, tolerance); // 0.05 Euro
        }
    }
}

module coin_slot(diameter, height, stack, window, holder, tolerance) {
space=10;
cylinder(h=height*stack+tolerance, d=diameter+tolerance, center=false);
translate([-(diameter+tolerance)/2,holder,0]) 
    cube([diameter, diameter/2-holder, height*stack+tolerance], false);

translate([0,0,-space]) {
    cylinder(h=height*stack+space*2, d=window, center=false);
    translate([-window/2, 0,0]) 
        cube([window, window/2, height*stack+space*2], false);
}

}