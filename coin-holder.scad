
coin_holder();

module coin_holder() {
    difference() {
        cube([30, 40, 15], true);
        translate([0,14,0]) coin_slot(25.75, 2.20, 5, 18, 3, 0.2);
        mirror([0,1,0]) 
        #translate([0,14,0]) coin_slot(22.25, 2.14, 5, 18, 3, 0.2);
        
    }
}

module coin_slot(diameter, height, stack, window, holder, tolerance) {
space=10;
cylinder(h=height*stack+tolerance, d=diameter+tolerance, center=true);
translate([-(diameter+tolerance)/2,holder,-height*stack/2]) 
    cube([diameter, diameter/2-holder, height*stack], false);
cylinder(h=height*stack+space*2, d=window, center=true);
translate([-window/2, 0,-(height*stack/2+space)]) 
    cube([window, window/2, height*stack+space*2], false);

}