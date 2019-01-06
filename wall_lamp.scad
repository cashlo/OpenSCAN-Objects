lh = 200;
lw = 70;

difference(){
    cube([70,70,lh], true);
    translate([0,0,0.5])cube([70-1,70-1,lh], true);
    translate([0,0,-lh/2-5]) cylinder(  10, d1=40.4, d2=40.4);
}

//translate([0,0,-lh])
//difference(){
//    cube([lw,lw,2*lh], true);
//    cube([lw-1,lw-1,2*lh+1], true);
//    # translate([0,0,-lh])
//    rotate([50,0,0]) cube([lw*10,lw*10,lw*2], true);
//}
//translate([0,0,-2*lh+lw+39])
//intersection() {
//    cube([lw,lw,2*lh], true);
//    rotate([50,0,0]) cube([lw*10,lw*10,1], true);
//}