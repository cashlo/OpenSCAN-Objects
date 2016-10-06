bar_r = 11;
grip_r = 17;
grip_l = 95;
//$fn = 200;

grip();

module finger(size) {
    rotate_extrude(convexity = 10)
    translate([55, 0, 0])
    circle(r = size);
}

module grip() {
//    minkowski()
 //   {
        difference(){
            cylinder(  grip_l,   grip_r, grip_r);
            cylinder(  grip_l,   bar_r+2, bar_r+2);
            for (f =[20:24:70]) translate([25, 0, f]) rotate([40,0,0]) finger(15);
            translate([25, 0, 92]) rotate([40,0,0]) finger(15);
            translate([0, 83, 10]) rotate([0,90,0]) finger(15);
//            translate([0, 3, 7]) finger(10);
        };
 //       sphere(r = 2);
 //   };
}

