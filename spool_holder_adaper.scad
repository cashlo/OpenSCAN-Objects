$fn=10;

difference(){
translate([-4,-4,0])
cube([4+2.8+4, 98, 40]);

cube([2.8, 20, 40]);

translate([0,70,0])cube([2.8, 20, 40]);
translate([-4,70,0])cube([2.8+4, 20, 40-25]);
    
}

difference() {
translate([2.8+4,-4,40-5])
cube([28, 98, 5]);
    
#
translate([2.8+4+2,-4,40+0.5])
rotate([-90,0,0])
cylinder(120, 1.5);    
    
translate([2.8+4+2+20,-4,40+0.5])
rotate([-90,0,0])
cylinder(120, 1.5);    
}