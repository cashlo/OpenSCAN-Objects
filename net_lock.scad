net_size = 1.5*2;
h_net_size  = 1.4*2;
finger_size = 0.8;
for(j=[0:10]) for(i=[0:10]){
    translate([0,i*net_size,j*h_net_size]) {
        cube([1,finger_size,finger_size]);
        translate([0,-0.2,0]) cube([0.5,finger_size,finger_size]);
    }
}

translate([1,-0.5,-0.5])
cube([40,32,30]);
