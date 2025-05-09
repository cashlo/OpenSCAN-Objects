length = 10;
size = 5;
tolerance = 0.075;
bevel_radius = 0.5;
distance = 2*size + 2;

frame_size = 2;

translate([0,0,tolerance/2])
difference(){
frame(size);

#
translate([size*10.5,size*23,0.5])
rotate([0,0,180])
linear_extrude(4){
scale(0.65)
brand();
translate([0,-7,0])
text("コミケ105 月 東Y40a", size=4, font = "BestTen\\-CRT");
translate([0,-14,0])
text("", size=3.5, font = "BestTen\\-CRT");

}
}

module brand(){
translate([0,-1.5,0])
import("x.svg");

translate([10,0,0])
text("@CashTHLo", size=6, font = "BestTen\\-CRT");
}

module frame(size){
    translate([-size/4,-size/4,0]){
    difference(){
    hull(){
        cylinder(frame_size, frame_size, frame_size, $fn=8);
        translate([size*10.5,0,0]) cylinder(frame_size, frame_size, frame_size, $fn=8);
        translate([0,size*25,0]) cylinder(frame_size, frame_size, frame_size, $fn=8);
        translate([size*10.5,size*25,0]) cylinder(frame_size, frame_size, frame_size, $fn=8);
        
    }
    translate([0,0,-0.5])
    cube([size*10.5,size*22,frame_size+1]);
    }
    
    
    for(i=[0:8]){
    translate([0,i*distance+size,0])
    cube([size,0.8,0.5]);
    translate([size*9.5,i*distance+size,0])
    cube([size,0.8,0.5]);
    
    }
    }
}




burr_piece(size, length, tolerance, bevel_radius, [[0,0,1,1],[0,0,1,0],[0,0,1,1],[0,0,1,1],[0,0,1,0],[0,0,1,1]]);
translate([0,distance  ,0])
burr_piece(size, length, tolerance, bevel_radius, [[1,1,1,1],[1,0,1,1],[0,0,1,0],[0,0,1,0],[0,0,1,1],[1,1,1,1]]);
translate([0,distance*2,0])
burr_piece(size, length, tolerance, bevel_radius, [[1,1,1,1],[0,0,1,1],[1,0,1,0],[1,0,1,0],[0,0,1,1],[1,1,1,1]]);
translate([0,distance*3,0])
burr_piece(size, length, tolerance, bevel_radius, [[1,1,1,1],[0,0,1,1],[0,0,1,1],[0,0,1,1],[1,0,1,1],[1,1,1,1]]);
translate([0,distance*4,0])
burr_piece(size, length, tolerance, bevel_radius, [[1,1,1,1],[0,0,1,1],[0,0,1,0],[0,0,1,0],[0,0,1,1],[1,1,1,1]]);
translate([0,distance*5,0])
burr_piece(size, length, tolerance, bevel_radius, [[1,1,1,1],[0,0,1,1],[0,0,1,0],[0,0,1,1],[0,0,1,1],[1,1,1,1]]);
translate([0,distance*6,0])
burr_piece(size, length, tolerance, bevel_radius, [[1,1,1,1],[1,0,1,1],[1,0,0,0],[1,1,0,0],[1,0,1,0],[1,1,1,1]]);
translate([0,distance*7,0])
burr_piece(size, length, tolerance, bevel_radius, [[1,1,1,1],[0,0,1,1],[1,0,1,0],[0,0,1,0],[0,0,1,1],[1,1,1,1]]);
translate([0,distance*8,0])
burr_piece(size, length, tolerance, bevel_radius, [[1,1,1,1],[0,0,1,1],[1,0,1,0],[1,1,0,0],[1,1,1,1],[1,1,1,1]]);

module burr_piece(size, length, tolerance, bevel_radius, pattern) {
	if(bevel_radius){
		minkowski()
		{
			sphere(r = bevel_radius, $fn=20);
			sharp_burr_piece(size, length, tolerance + bevel_radius*2, pattern);
		}
	} else {
		sharp_burr_piece(size, length, tolerance, pattern);
	}
}

module sharp_burr_piece(size, length, tolerance, pattern) {
	cude_size = size+tolerance;
	difference() {
		translate([tolerance/2,tolerance/2,tolerance/2])
		cube([length*size-tolerance,size*2-tolerance,size*2-tolerance]);
		translate([size*2-tolerance/2,-tolerance/2,-tolerance/2])
		for(i=[0:length-5]){
			for(j=[0:3]){
				if(!pattern[i][j]){
					translate([size*i,size*floor(j/2),size*(j%2)]) cube([cude_size, cude_size, cude_size]);
				}
			}
		}
	}	
}
