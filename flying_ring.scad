
// Radius of the ring (half of the print bad size)
size = 125; // [50:400]

// Size of the rounded corner, higher is more rouned.You get a circle if = [size], you get a square with rounded corners if = [ring_width]
corner_size = 125; // [10:400]

// Width of the ring
ring_width = 30; // [10:100]

/* [Hidden] */

$fn=100;

tooth_size = 10;

q_ring();

module q_ring() {
difference(){
    half_ring();
    rotate([0,0,-90-120]) cube([corner_size, corner_size, 20]);
}

intersection(){
    half_ring();
    rotate([0,0,-120]) interface();
}
}
module half_ring() {
    difference(){
    for (i = [2:3]){
        rotate([0,0,90*i])
        arm();
    }
    interface();
    }
}

module interface() {
    for (i = [size-ring_width:tooth_size*2:size]){
    translate([i, 0, 0]) rotate([50,0,0]) cube([tooth_size, tooth_size, 20]);
    translate([i+tooth_size, -10, 0]) rotate([-50,0,0]) cube([tooth_size, tooth_size, 20]);    
    }
}

module arm() {
    translate([size,size-corner_size,0])
    rotate([90,0,0])
    linear_extrude((size - corner_size)*2) profile();

    translate([size-corner_size,size-corner_size,0])
    intersection(){
        cube(corner_size);
        rotate_extrude()
        translate([corner_size,0,0]) profile();
    }
}


module profile() {
    scale(ring_width/40)
    translate([-40,0,0])
    polygon([[0,0],[40,0],[37,3],[35,2],[30,3],[10,3]]);
}