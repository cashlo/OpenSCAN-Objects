$fn=100;

difference(){
    translate([0,-5,0])
    cube([15,15,5]);
linear_extrude(7)
cut_line(15, radius=1.8, width=0.1, arc_angle = 210);
}

module cut_line(lenght, width = 1, radius = 10, arc_angle = 120) {
    if(lenght>0) {
        translate([
        sin(arc_angle/2)*radius,
        cos(arc_angle/2)*radius,
        0])
        arc(arc_angle, radius, width);
     
        translate([sin(arc_angle/2)*radius*2,0,0])
        mirror([0,1,0])
        cut_line(lenght-sin(arc_angle/2)*radius*2, width, radius, arc_angle);
    }    
}

module arc(angle, radius, width) {
    arc180(angle/2, radius, width);
    mirror([1,0,0]) arc180(angle/2, radius, width);
}

module arc180(angle, radius, width) {
    difference(){
        circle(radius+width/2);
        circle(radius-width/2);
        
        translate([radius*1.5,0,0])
        square(radius*3,center = true);
        
        rotate([0,0,180-angle])
        translate([radius*1.5,0,0])
        square(radius*3,center = true);        
        
    }
}