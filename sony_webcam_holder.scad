$fn=30;

translate([-5,-5+250,-3])
cube([60,3, 60]);

translate([-5,-5,-3])
cube([60,250, 3]);

translate([-5,-5,-3])
rotate([10,0,0])
cube([60,70, 3]);

rotate([10,0,0]){
translate([0,30,0])
post();

translate([50,30,0])
post();
}

module v_post(){
translate([30,0,0])
post();

translate([30,50,0])
post();
}

module post() {
cylinder(3, 3/2, 3/2);
translate([0,0,3])
cylinder(2, 6/2, 6/2);
}

