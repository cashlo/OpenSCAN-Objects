roller_width = 75;
offset = 0.1;
bearing_size = 22;
bearing_inner_size = 8;
/*
translate([0,0,5])
cylinder(h=10, d1=bearing_inner_size, d2=bearing_inner_size-offset);

difference(){
hull(){
cylinder(h=5, d=bearing_inner_size);


translate([20,0,5/2])
cube([7,20*2+3+5*2,5], true);
}

translate([21,0,5/2])
cube([5,3,5], true);

translate([21,20,5/2])
cube([5,3,5], true);

translate([21,-20,5/2])
cube([5,3,5], true);
}
*/

translate([0,0,15])
roller();

module roller(){
 difference(){
    cylinder(h=roller_width, d=25);
    #cylinder(h=10, d=12);
    #translate([0,0,roller_width-10])
     cylinder(h=10, d=12);
 }
translate([0,0,roller_width])
difference(){
    cylinder(h=10, d=25+5);
    translate([0,0,3])
    cylinder(h=7, d1=bearing_size+offset*2, d2=bearing_size+offset*4);
    cylinder(h=15, d=12);
}

translate([0,0,-10])
difference(){
    cylinder(h=10, d=25+5);
    cylinder(h=7, d1=bearing_size+offset*4, d2=bearing_size+offset*2);
    cylinder(h=15, d=12);
}
}