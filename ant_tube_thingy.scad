r = 35.5/2-0.2;

$fn=100;

difference(){
    cylinder(10, r, r);
    cylinder(11, r-1.5, r-1.5);
    cube([50, 10, 10], true);
}

translate([0,0,10])
difference(){
    cylinder(1.5, r+2, r+2);
    #cylinder(
            2,
            5.5/2,
            6/2
    );
}