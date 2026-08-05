difference(){
    cube([65, 8, 8], true);
    
    translate([0,2,0])
    cube([24, 8, 9], true);
    
    
    
    for(i=[0:1])
    mirror([i,0,0])
    translate([15,0,-10])
    cylinder(20, d=1.9);
    
    for(i=[0:1])
    mirror([i,0,0])
    translate([58/2,10,0])
    rotate([90,0,0])
    cylinder(20, d=1.9);
    
    
}