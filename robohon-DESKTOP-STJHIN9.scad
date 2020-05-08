use <MCAD/involute_gears.scad>


$fn=100;

d = 22.5;
h = 12;

translate([-0.4,-4,h])
rotate([-90,0,0])
linear_extrude(8)
polygon([[-4,0],[-10,0],[-10,10]]);

translate([7.5,0,3])
rotate([90,0,0])
cylinder(h=3, d=1,center=true);

difference(){
    cylinder(h=h, d=d);
    translate([19,0,-1])
    cube([22,22,h], true);
    
    translate([0,0,-0.5])
    cylinder(h=14, d=d-2);
    
    translate([12,0,5])
    rotate([90,0,0])
    cylinder(h=22, d=8, center=true);
    
    translate([0,0,1.5])
    rotate([90,0,0])
    cylinder(h=30, d=1.5, center=true);
    
    translate([2,9,7]){
        rotate([0,-45-90,0])
        cube([0.1,3,10]);

        rotate([0,-45,0])
        cube([0.1,3,10]);
    }
}



translate([7.5,-7,0]) cube([0.5,14,5]);


difference(){
    intersection(){
        cylinder(h=h, d=22);
        translate([12,0,5])
        rotate([90,0,0])
        difference(){
            cylinder(h=22, d=9, center=true);
            cylinder(h=22, d=8, center=true);
        }
    }
    translate([19,0,-1])
        cube([22,22,h], true);
}
difference(){
    translate([0,0,h-2]){
        translate([-10,-4,0]) cube([10,8,2]);
        cylinder(h=8+2, d=7);
        cylinder(h=7+2, d=8);
    }
    translate([0,0,h-2]) cylinder(h=4+2, d=5);
    translate([0,0,h-2]) cylinder(h=10, d=2);
    translate([0,0,h+8-3+0.01]) gear(number_of_teeth=18,circular_pitch=50,bore_diameter=0,hub_diameter=0,rim_thickness=3);
    
}