
padding = 10;

difference(){
translate([-padding,-padding,5])
cube([90.5+padding*2, 3+padding*2, 10]);
    
#
translate([70,0,0])    
cube([20.5, 3, 40]);
cube([20.5, 3, 40]);
    
translate([-50,3,10+5-3])
cube([200, 3, 3]);
}