$fn=50;
thickness=0.8;

difference(){
    cube([6.6,12,thickness], true);
    cube([2.5,8.3-2.5,thickness+0.1],true);
    translate([0,(8.3-2.5)/2,0])
    cylinder(h=thickness+0.1,d=2.5, center = true);
    translate([0,-(8.3-2.5)/2,0])
    cylinder(h=thickness+0.1,d=2.5, center = true);
}
difference(){
union(){
    translate([0,12/2+thickness/2,3.5-thickness/2]){
        cube([6.6,thickness,7], true);
        translate([0,0,3])
        rotate([90,0,0])
        cylinder(h=thickness,d=6.6,center = true);
    }

    translate([0,-12/2-thickness/2,3.5-thickness/2]){
        cube([6.6,thickness,7], true);
        translate([0,0,3])
        rotate([90,0,0])
        cylinder(h=thickness,d=6.6,center = true);
    }
}

translate([0,0,6])
rotate([90,0,0])
cylinder(h=20,d=3,center = true);
}