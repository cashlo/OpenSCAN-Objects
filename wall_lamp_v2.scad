lh = 200;
lw = 70;

difference(){
    shape(lh, lw/2);
    translate([0,0,0.5])shape(lh, lw/2-1);
    translate([0,0,-lh/2-5]) cylinder(  10, d1=40.4, d2=40.4);
}

module shape(h, r){
    difference(){
        union(){
            linear_extrude(height = h, center = true, convexity = 10, twist = 180, slices = 100)
            regular_polygon(10, r+20);
            linear_extrude(height = h, center = true, convexity = 10, twist = -180, slices = 100)
            regular_polygon(10, r+20);
        }
    #translate([lh/2+r,0,0]) cube([lh,lh,lh], true);
    }
}

module regular_polygon(order, r=1){
 	angles=[ for (i = [0:order-1]) i*(360/order) ];
 	coords=[ for (th=angles) [r*cos(th), r*sin(th)] ];
 	polygon(coords);
 }