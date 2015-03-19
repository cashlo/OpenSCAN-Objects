length = 10;
size = 6;
tolerance = 0.15;
bevel_radius = 1;
distance = 2*size + 2;

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
			sphere(r = bevel_radius, $fn=10);
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