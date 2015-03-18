length = 10;
size = 6;
tolerance = 0.3;

burr_piece(size, length, [[0,1,0,0],[0,1,0,1],[0,1,1,1],[0,1,1,1],[0,1,1,1],[0,1,1,1]]);

module burr_piece(size, length, pattern) {
	cude_size = size+tolerance*2;
	difference() {
		cube([length*size,size*2,size*2]);
		translate([size*2-tolerance,-tolerance,-tolerance])
		for(i=[0:5]){
			for(j=[0:3]){
				if(!pattern[i][j]){
					#translate([size*i,size*floor(j/2),size*(j%2)]) cube([cude_size, cude_size, cude_size]);
				}
			}
		}
	}	
}