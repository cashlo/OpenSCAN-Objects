rotate([0, -9, 0]) holder();
translate([25+4, 0, 0]) rotate([0, -9, 0])  holder();
translate([(25+4)*2, 0, 0]) rotate([0, -9, 0])  holder();
translate([-5, -5, 0]) cube([98,60+6+10,5]);
module holder() {
    difference(){
        cube([25+6,60+6,60+3]);
        translate([3, 3, 3]) cube([25,60,60]);
    }
}