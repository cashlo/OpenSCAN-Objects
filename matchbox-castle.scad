UNIT = 25.4;
$fn=100;
    
fence();

module wall() {
    difference() {
        cube([UNIT/2, UNIT/4, UNIT/4]);
        translate([UNIT/8,0,UNIT/8]) cube([UNIT/12, UNIT/4, UNIT/8]);
        translate([UNIT*(7/24),0,UNIT/8]) cube([UNIT/12, UNIT/4, UNIT/8]);
    }
}

module gate() {
    difference() {
        cube([UNIT/2, UNIT/4, UNIT/2]);
        translate([UNIT/8,0,0]) cube([UNIT/4, UNIT/4, UNIT/5]);
        translate([UNIT/4,UNIT/4,UNIT/5]) rotate([90,0,0])cylinder(UNIT/4, UNIT/8, UNIT/8);
    }
}

