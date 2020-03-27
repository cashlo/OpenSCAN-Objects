door_width = 16.5;
clip_width = 2.4;
holder_width = 3.6;
corner_r = 10;
border_gap = 1;
border_width = 1;


translate([holder_width+border_gap,door_width+holder_width+border_gap,0]) {
    
    translate([0,0,-1.2])
    linear_extrude(1.2)
    difference(){
        translate([-holder_width,-holder_width,0])
        round_corner(200-holder_width*2-border_gap*2+holder_width*2,
                    100-holder_width*2-border_gap*2+holder_width*2,
                    corner_r-holder_width-border_gap);
        translate([border_width,border_width,0])
        round_corner(200-holder_width*2-border_gap*2-border_width*2,
                    100-holder_width*2-border_gap*2-border_width*2,
                    corner_r-holder_width-border_gap-border_width);
    }
    
    linear_extrude(10)
    difference(){
        round_corner(200-holder_width*2-border_gap*2,
                    100-holder_width*2-border_gap*2,
                    corner_r-holder_width-border_gap);
        translate([border_width,border_width,0])
        round_corner(200-holder_width*2-border_gap*2-border_width*2,
                    100-holder_width*2-border_gap*2-border_width*2,
                    corner_r-holder_width-border_gap-border_width);
    }
 }




difference(){
    translate([0,-clip_width,0]) cube([200,door_width+clip_width*2,20+clip_width]);
    cube([200,door_width,20]);
}

translate([0,door_width,0])
linear_extrude(20+clip_width)
difference(){
    union(){
        round_corner(200,100,corner_r);
        square([200,holder_width]);
        square([holder_width,50]);
        translate([200-holder_width,0,0]) square([holder_width,50]);
    }
    translate([holder_width,holder_width,0])
        round_corner(200-holder_width*2,100-holder_width*2,corner_r-holder_width);
    
}

module round_corner(x, y, r){
    translate([r,r,0]) minkowski() {
        circle(r);
        square([x-r*2,y-r*2]);
    }
}
//cube([100, 200, 20]);