size = [143.8,69.5,8.5];
border = [4,4,4];
margin = [2,2,2];

bar_size = 2;
v_bars = 5;
h_bars = 6;

lock_hole_radius = 3.5;
lock_ring_size = 2;

joints = 2;
joint_hole_radius = 1;
joint_ring_size = 2;

lock_rings = 2;
total_size = size + margin + border*2;
window_size = size + margin;
clearance = 0.2;

module half_prison() {
    difference(){
        cube(total_size);
        translate([border.x, border.y, 0]) cube(window_size);
        translate([0,0,total_size.z/2])cube(total_size);
    }

    for(i=[0:v_bars]){
        translate([0, window_size.y*i/v_bars-bar_size/2+border.y, 0]) cube([total_size.x, bar_size, bar_size]);
    }

    for(i=[0:h_bars]){
        translate([window_size.x*i/h_bars-bar_size/2+border.x, 0, 0]) cube([bar_size, total_size.y, bar_size]);
    }
}

module lock_ring() {
    difference() {
        cylinder(lock_ring_size, lock_hole_radius+lock_ring_size, lock_hole_radius+lock_ring_size);
        cylinder(lock_ring_size, lock_hole_radius, lock_hole_radius);
    }
    translate([lock_hole_radius,0,0]) cube([lock_ring_size, (lock_ring_size+lock_hole_radius)*2, lock_ring_size]);
}


module joint_ring() {
    difference() {
        cylinder(joint_ring_size, joint_hole_radius+joint_ring_size, joint_hole_radius+joint_ring_size);
        cylinder(joint_ring_size, joint_hole_radius, lock_hole_radius);
    }
    translate([joint_hole_radius,0,0]) cube([joint_ring_size, (joint_ring_size+joint_hole_radius)*2, joint_ring_size]);
}

half_prison();

translate([total_size.x/2,0,0]) cube([clearance,100,clearance], true);

translate([-lock_rings*(lock_ring_size+clearance)+clearance/2,0,0])
for(i=[0:lock_rings-1]){
    translate([total_size.x/2+i*(lock_ring_size+clearance)*2,-lock_ring_size-lock_hole_radius,total_size.z/2])
    rotate([-20,0,0])
    rotate([0,90,0])
    lock_ring();
}

for(j=[1:joints]){
    translate([total_size.x/(joints+1)*j-lock_rings*(joint_ring_size+clearance)+clearance/2,0,0])
    for(i=[0:lock_rings-1]){
        translate([i*(joint_ring_size+clearance)*2,total_size.y+joint_hole_radius+joint_ring_size,total_size.z/2])
        rotate([20,0,0])
        rotate([0,90,180])
        joint_ring();
    }
}
