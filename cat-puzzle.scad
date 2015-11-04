radius = 55;
cylinder(  3,   radius, radius,true);
for(i=[0:10]) {
    
    height = rands(0,150,1)[0];
    width = rands(5,20,1)[0];
    tx = rands(15-radius,radius-15,1)[0];
    maxy = sqrt(pow(radius-15, 2) - pow(tx, 2));
    ty = rands(-maxy,maxy,1)[0];
    
    translate([tx,ty,0]) cube([10,10,height]);
}