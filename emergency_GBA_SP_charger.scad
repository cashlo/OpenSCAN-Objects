difference(){
    cube([11.2,5.3,10], true);
    cube([9.4,2.3,10], true);
    translate([0,-1.9,0]) cube([3.3,2,10], true);
    #translate([3.1,1.3,0]) cube([0.8,0.3,10], true);
    translate([-3.1,1.3,0]) cube([0.8,0.3,10], true);
}
 translate([0,0,10]) difference(){
    cube([11.2,5.3,10], true);
    cube([3,3,10], true);
}
