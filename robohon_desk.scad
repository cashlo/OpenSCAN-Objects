module desk(){
    difference(){
        translate([-2,-2,-1])cube([71+4, 55+4, 2]);
        cube([71, 55, 2]);
    }
    translate([-2,-2,0]) cube([71+4,2,80]);
    translate([-15-2,-55-4,80]) cube([71+4+30, 55+4, 2]);

    translate([-2,-55-4,-1]) cube([2, 55+4, 80+1]);
    translate([71,-55-4,-1]) cube([2, 55+4, 80+1]);
    
    translate([0,55,1])
    rotate([45,0,0])
    translate([-2,-55,0])
    cube([2,55,80]);
    
    translate([0,55,1])
    rotate([45,0,0])
    translate([71,-55,0])
    cube([2,55,80]);
}

difference(){
    desk();
    translate([0,-2,0])
    rotate([atan2(55,80),0,0])
    translate([-50,-100,-5])
    cube([200,100,200]);
    
    #translate([-50,-100,-200-1])
    cube([200,200,200]);
    
    
}