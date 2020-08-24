h = 4.1;
w = 2;

difference(){
    translate([-w,0,-w])cube([4.1+4.1+w+w+w,10,10]);
    #cube([4.1,10,10]);
    #translate([w+4.1,0,-w-w])cube([4.1,10,10]);
}