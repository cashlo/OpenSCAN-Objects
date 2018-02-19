size = 50;

translate([0,-size,0]) half_cube(size);
rotate([90,0,0]) translate([0,-size,0]) half_cube(size);
rotate([180,0,0]) translate([0,-size,0]) half_cube(size);
rotate([-90,0,0]) translate([0,-size,0]) half_cube(size);

rotate([90,90,0]) translate([0,-size,0]) half_cube(size);
rotate([90,180,0]) translate([0,-size,0]) half_cube(size);
rotate([180,90,0]) translate([0,-size,0]) half_cube(size);
rotate([180,180,0]) translate([0,-size,0]) half_cube(size);


module half_cube(size) {
    translate([0,size,0]) rotate([90,0,0]) cube_piece(size);
    translate([0,0,size]) rotate([0,90,0]) cube_piece(size);
    rotate([0,0,0]) cube_piece(size);
}
module cube_piece(size) {
polyhedron(
    [
        [0,0,0],
        [size,0,0],
        [0,size,0],
        [size,size,0],
        [size/2,size/2,size/2]
    ],
    [
        [0,2,3,1],
        [0,1,4],
        [1,3,4],
        [3,2,4],
        [2,0,4],
    ],
    1
);
}