size = 30;
width = 3;
dot_size = 5;
clearance = 0.5;

$fn = 40;

interface(size, width, dot_size, 0);
difference(){
    board_piece(size, width, dot_size);
    translate([4*size+width+clearance/2, -5*size-clearance/2, -clearance/2]) rotate([0,0,90])  board_piece(size, width+clearance, dot_size);
    translate([4*size+width+clearance/2, -5*size, -clearance/2]) rotate([0,0,90])  interface(size, width+clearance, dot_size+clearance, clearance);
}
module board_piece(size, width, dot_size) {
for (i = [0:4])
    translate([0, i*size, 0]) cube([5*size+width, width, width]);

for (i = [0:5])
    translate([i*size, 0, 0]) cube([width, 4*size+width, width]);
}

module interface(size, width, dot_size, trim) {
difference(){
    translate([6*size+width/2, size+width/2, 0]) cylinder(  width,   dot_size, dot_size,false);
    
    translate([6*size, size-width*2, 0]) cube([width, width*5, width/2]);
    translate([6*size, size, 0]) cube([width*3, width, width/2]);
}

translate([5*size, size, 0]) cube([size, width, width]);


for (i=[2:3])
    translate([5*size, size*i, 0]) {
        difference(){
            cube([size+width*2, width, width]);
            #translate([size, 0, 0]) cube([width-trim, width, width/2]);
        }
    }   
}