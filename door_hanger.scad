$fn=100;

door_thickness=40;
door_mount_length=40;
height=80;
width=30;
thickness=1.6;
hook_size=20;
number_of_hooks=2;


translate([0,door_thickness+thickness,0]) cube([door_mount_length, thickness, width]);
cube([thickness, door_thickness+thickness*2, width]);

for(i=[0:number_of_hooks-1]) translate ([i*height,0,0]) {
    cube([height, thickness, width]);

    difference() {
        translate([height,-hook_size,0]) cylinder(  width,    hook_size+thickness,    hook_size+thickness);
        translate([height,-hook_size,-1]) cylinder(  width+2,    hook_size,    hook_size);
        translate([height-(hook_size*2+thickness),-hook_size*2-thickness,-1]) cube([hook_size*2+thickness, hook_size*2+thickness, width+2]);
    }

    difference() {
        translate([height,-hook_size*2,width/2]) rotate([90,0,0]) cylinder(  thickness,    width/2,    width/2);
        translate([height,-hook_size*2-thickness-1,0]) cube([width, thickness+2, width]);
    }
}