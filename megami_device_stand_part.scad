$fn=50;

length_cells = 8;
clearance = 0.05;

difference(){
    cube([1+(9.5+1)*length_cells,8,6]);
    
    for (c=[0:length_cells]) {
        translate([1+(9.5+1)*c,1,0])
        cube([9.5, 6, 2.5]);
        
        translate([1+(9.5+1)*c,1,3.5])
        cube([9.5, 6, 2.5]);
    }
}
translate([-4,0,0])
cube([4,1,3]);

translate([-4,7,0])
cube([4,1,3]);

translate([-1,3,0])
cube([1,2,3]);

translate([-4,4,0])
difference(){
    cylinder(3, 4, 4);
    cylinder(3, 2.5+clearance, 2.5+clearance);
    //translate([-4,0,0]) cube([2,0.2,4]);
}

translate([1+(9.5+1)*length_cells,4,3])
rotate([0,90,0])
cylinder(8, 5.8/2, 5.8/2);

translate([1+(9.5+1)*length_cells+8,4,0])
cylinder(0.3, 4, 4);

