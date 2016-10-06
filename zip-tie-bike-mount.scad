use <gopro_mounts_mooncactus.scad>;

$fn=100;
gopro_connector("triple");

translate([0, 23, 0])

difference(){
    union() {
        cylinder(14.7, 15, 15, true);
        cylinder(30.7, 14, 14, true);
        translate([0, 0, 16]) cylinder(2, 15, 15, true);
        translate([0, 0, -16]) cylinder(2, 15, 15, true);
    }
    cylinder(50, 11, 11, true);
    # translate([0, 10, 0]) cube([22,22,50], true);
}
