module chamfered_cube(size, chamfer) {
    difference() {
        cube(size);
        
        chamfer_cross(size, chamfer);
        
        translate([0,size[1],size[2]])
        chamfer_cross(size, chamfer);
        
        translate([size[0],0,size[2]])
        chamfer_cross(size, chamfer);
        
        translate([size[0],size[1], 0])
        chamfer_cross(size, chamfer);
        
        
        
    }
}

module chamfer_cross(size, chamfer){
    for(z=[0:3]) for(y=[0:3])
            rotate([0,90*y,90*z])
            translate([max(size)/2,0,0])
            rotate([45,0,0])
            cube([max(size),chamfer,chamfer], true);
}
