$fn = 20;



difference() {
    cylinder(  5,    14,    14);
    cylinder(  5,    4,    4);
    for(a=[1:4])rotate([0,0,90*a+45]) translate([8,0,0])
    {
        cylinder(  5,    1.5,    1.5);
        translate([0,-1.5,0]) cube([1.5,3,5]);
        translate([1.5,0,0]) cylinder(  5,    1.5,    1.5);
    }
    
    for(a=[1:4])rotate([0,0,90*a]) translate([10,0,0]) cylinder(  5,    3.5,    3.5);
    translate([10 ,-20/6,0]) cube([5,20/3,5]);
}


translate([9 ,-10,0])
difference() {
union() {
cube([80,20,10]);
translate([80,0,0]) linear_extrude(10)
polygon([[0,0],[16, 10],[0,20]]);
#translate([40,0,10]) rotate([0,45,0]) cube([14,20,14]);
}
translate([80,3,0]) cylinder(  10,    1.5,    1.5);
translate([80,3+14,0]) cylinder(  10,    1.5,    1.5);
translate([80+12,3+7,0]) cylinder(  10,    1.5,    1.5,        false);

translate([0,20/3,0]) cube([40,20/3,10]);
translate([40,20/3,0]) cube([40,20/3,5]);

translate([80,20/3,0]) rotate([0,0,30]) cube([70,20/3,5]);

translate([0,0,5]) rotate([0,-10,0]) cube([30,20,10]);
}