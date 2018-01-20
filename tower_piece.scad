use <publicDomainGearV1.1.scad>;

translate([00,0,0]) disk(22);
translate([60,0,0]) disk(24);
translate([120,0,0]) disk(26);

module disk(size) {
translate([0,0,10+3]) gear(mm_per_tooth=2, number_of_teeth=20, hole_diameter=0, thickness=6);
translate([0,0,10+6])cylinder(  3,    8,    8);
//# translate([0,0,10]) cylinder(  9.3,    9,    8.2);
difference() {
    cylinder(  10,    size,    size);
    cylinder(  9.3,    9,    8.2);
}
}

module base() {
    
    for (d=[0:60:120]) translate([d,0,0]) {
        translate([0,0,2]) handle();
        cylinder(  2,    30,    30);       
    }
    translate([0,-30,0]) cube([120, 60, 2]);
 }
 
module handle() {
        translate([0,0,3]) gear(mm_per_tooth=2, number_of_teeth=20, hole_diameter=0, thickness=6);
        translate([0,0,6])cylinder(  3,    8,    8);  
}