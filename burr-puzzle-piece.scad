length = 10;
size = 6;

burr_piece(size, length, [0,1,0,0,1,0]);

module burr_piece(size, length, pattern) {
difference() {
	cube([length*size,size*2,size*2]);
	translate([size*2,0,0])
	for(i=[0:5]){
		if(!pattern[i]){
			translate([size*i,0,0]) cube([size, size, size]);
		}
	}
}	
}