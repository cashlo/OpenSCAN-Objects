cube([40, 60, 5]);
translate([0,60,0])
rotate([-20,0,0])
translate([0,-5,0])
cube([40, 5, 10]);

cube([40, 5, 60]);

translate([0,15,0])
rotate([45,0,0])
cube([40, 5, 20]);

translate([0,0,60])
hook();

translate([40-5,0,60])
hook();

translate([0,0,60-36])
hook();

translate([40-5,0,60-36])
hook();

module hook() {
rotate([180,0,0]){
cube([5, 5, 5]);
translate([0,2,0])
cube([5, 5, 10]);
}
 }