UNIT = 25.4;
$fn=100;

castle();

module castle() {
    spacing = UNIT;
    for (a =[1:8]) translate([0,spacing*a,0]) wall();
    for (a =[1:10]) translate([spacing,spacing*a,0]) fence();
    for (a =[1:2]) translate([spacing*2,spacing*a,0]) gate();
    for (a =[1:6]) translate([spacing*3,spacing*a,0]) roof(UNIT/2);
    translate([spacing*4, 0, 0]) roof(10); //??????
    translate([spacing*5, 0, 0]) tower(UNIT*0.91);
    translate([spacing*6, 0, 0]) tower(UNIT*0.76);
    
}


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

module fence() {
    difference() {
        cube([UNIT/2, UNIT*(3/20), UNIT/4]);
        translate([UNIT*(9/24),0,UNIT*(5/24)]) cube([UNIT/12, UNIT/4, UNIT/24]);
        translate([UNIT*(5/24),0,UNIT*(5/24)]) cube([UNIT/12, UNIT/4, UNIT/24]);
        translate([UNIT*(1/24),0,UNIT*(5/24)]) cube([UNIT/12, UNIT/4, UNIT/24]);
    }
}

module tower(height) {
    difference() {
        opening_height = UNIT*0.17;
        cube([UNIT*(3/10), UNIT*(3/10), height]);
        translate([UNIT*(1/10),0,height-opening_height]) cube([UNIT*(1/10), UNIT*(3/10), opening_height]);
    }
}

module roof(lenght) {
    linear_extrude(lenght) polygon([[0,0],[UNIT/4,0],[UNIT/8,UNIT/8]]);
}