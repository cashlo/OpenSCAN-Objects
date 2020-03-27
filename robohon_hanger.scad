width = 71;
depth = 38;
height = 103;
shell = 0.8;
foot_depth = 11;
side_padding = 11/2;

cube([width,depth-foot_depth,8]);
cube([side_padding,depth-foot_depth,height]);
translate([width-side_padding,0,0])
cube([side_padding,depth-foot_depth,height]);


translate([width-side_padding,-shell,height])
rotate([0,10,0])
difference(){
    union(){
        cube([side_padding+shell,6,5]);
        translate([(side_padding+shell)/2,0,5])
        rotate([-90,0,0])
        cylinder(6,d=side_padding+shell);
    }
    translate([(side_padding+shell)/2,0,5])
    rotate([-90,0,0])
    cylinder(6,d=4);
}

translate([side_padding,-shell,height])
rotate([0,-10,0])
translate([-side_padding-shell,0,0])
difference(){
    union(){
        cube([side_padding+shell,6,5]);
        translate([(side_padding+shell)/2,0,5])
        rotate([-90,0,0])
        cylinder(6,d=side_padding+shell);
    }
    translate([(side_padding+shell)/2,0,5])
    rotate([-90,0,0])
    cylinder(6,d=4);
}

difference(){
    translate([-shell,-shell,-shell]) cube([width+shell*2,depth+shell*2,height+shell]);
    cube([width,depth,height+1]);
    translate([side_padding,-shell,height-20])
    #cube([width-side_padding*2,shell,20]);
}