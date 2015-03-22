size = 100;
thickness = 2;
clearance = 3;
tension = 0.5;
stages = 5;
angle = 52;
$fs = 1;
$fa = 5;

//%cube(size, center = true);

*rotate(0) {
	stage(100, 0);
	rotate([180 * 5 * $t, 0, 45]) rotate(45) {
		stage(90, 1);
		rotate([180 * -7 * $t, 0, 45]) rotate(45) {
			stage(80, 2);
			rotate([180 * -9 * $t, 0, 45]) rotate(45) {
				stage(70, 3);
				rotate([180 * 11 * $t, 0, 45]) rotate(45) {
					stage(60, 4);
				}
			}
		}
	}
}


for(stage = [0: stages - 1]) rotate(stage * 0) translate([0, 0, -(thickness + clearance) * stage]) stage(size + thickness * 2 - (thickness + clearance) * 2 * stage, stage);

module stage(size, stage) difference() {
	union() {
		intersection() {
			sphere(size / sin(angle) / 2);
			cube(size - thickness * 2, center = true);
		}
		if (stage != 0) for(a = [0, 1]) rotate([0, 90, -45 + 180 * a]) translate([0, 0, (size / sin(angle) / 2 - thickness)]) cylinder(r1 = clearance + thickness, r2 = 0, h = clearance + thickness);
	}
	difference() {
		sphere(size / sin(angle) / 2 - thickness);
		if (stage != stages - 1) for(a = [0, 1]) rotate([0, 90, 45 + 180 * a]) translate([0, 0, -(size / sin(angle) / 2 - thickness)]) difference() {
			cylinder(r1 = clearance, r2 = 0, h = clearance);
			translate([0, 0, clearance - thickness + tension]) cylinder(r1 = 0, r2 = clearance, h = clearance);
		}
	}
	for(o = [0:2]) rotate([0, 90 + 90 * o, 90 + 45 * o]) cylinder(r = sqrt(abs(pow(size / sin(angle), 2) - pow(size, 2))) / 2, h = size * 2, center = true);
}
