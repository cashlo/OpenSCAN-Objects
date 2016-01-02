
    lamp_shade();


module lamp_shade(){
translate([0,0,-25])difference() {
    cylinder(h=50, d2=43, d1=140,center = true);
    cylinder(h=50, d2=41, d1=138,center = true);
};

translate([0,0,40]) difference() {
    cylinder(h=180, d=140,center = true,$fa=0.05);
    cylinder(h=181, d=139,center = true,$fa=0.05);
    translate([0,0,-200])cube(400);
    rotate([0,0,90]) translate([0,0,-200])cube(400);
    rotate([0,0,135]) translate([0,0,-200])cube(400);
};

translate([0,0,-50]) difference() {
    cylinder(h=1, d=139.5);
    cylinder(h=1, d=70);
        translate([0,0,-200])cube(400);
    rotate([0,0,90]) translate([0,0,-200])cube(400);
    rotate([0,0,135]) translate([0,0,-200])cube(400);
};
}