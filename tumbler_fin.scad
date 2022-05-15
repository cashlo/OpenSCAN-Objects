jar_width = 94;
wall = 4;
tube_height = 100;


intersection(){
#cylinder(h=tube_height, r=jar_width/2, center=true, $fn=100);


translate([jar_width*5/6,0,0])
rotate([30,0,0])
scale([1,0.7,1])
rotate([0,0,-60])
cylinder(h=tube_height/2, r=jar_width/2, center=true, $fn=3);
}

