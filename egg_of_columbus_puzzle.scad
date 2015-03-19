size=60;
height=5;
cut_width=2;

egg_of_columbus_puzzle(size, height, cut_width);

module egg_of_columbus_puzzle(size, height, cut_width) {
    small_circle_radius = 2-sqrt(2);
difference() {
    egg(size, height, cut_width);
    #cube([5*size,cut_width,3*height],center=true);
    #cube([cut_width,5*size,3*height],center=true);
    #translate([size,0,0])rotate(a=[0,0,45])cube([cut_width,5*size,3*height],center=true);
    #translate([-size,0,0])rotate(a=[0,0,-45])cube([cut_width,5*size,3*height],center=true);  #translate([-size*(1-small_circle_radius)/2,-size*(1-small_circle_radius)/2,0])rotate(a=[0,0,45])cube([cut_width,small_circle_radius*size,3*height],center=true);    #translate([size*(1-small_circle_radius)/2,-size*(1-small_circle_radius)/2,0])rotate(a=[0,0,-45])cube([cut_width,small_circle_radius*size,3*height],center=true);
}
}

module egg(size, height, cut_width) {
    difference() {
        intersection() {
            translate([-size,0,0])cylinder(h=height,r=2*size-cut_width/2, $fn=1000);
            translate([size,0,0])cylinder(h=height,r=2*size-cut_width/2, $fn=1000);
        }
        translate([0,size,0])top_arc_cutter(size, height, cut_width);
        button_arc_cutter(size, height, cut_width);
    }
}


module top_arc_cutter(size, height, cut_width) {
    small_circle_radius = 2-sqrt(2);
    difference() {
        translate([0,0,-1.5]) rotate(a=[0,0,45]) cube([size,size,3*height]);
        cylinder(h=3*height,r=small_circle_radius*size-cut_width/2,center = true, $fn=1000);
    }
}
module button_arc_cutter(size, height, cut_width) {
    difference() {
        translate([0,-size,0])  cube([2*size,2*size,3*height],center = true);
        cylinder(h=3*height,r=size-cut_width/2,center = true, $fn=1000);
    }
}