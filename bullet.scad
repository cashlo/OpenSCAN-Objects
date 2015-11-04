translate([0,0,5]) sphere(r = 3, ,$fn=50);
minkowski(){
    cylinder(  10,   2, 2,true,$fn=50);
    sphere(r = 1,$fn=50);
}