linear_extrude(10){

square([4, 30]);
square([24+4, 4]);
translate([24+4,0,0])
square([4, 30]);
}


translate([28,20,0])
rotate([0,0,-20])cube([30,10,10]);