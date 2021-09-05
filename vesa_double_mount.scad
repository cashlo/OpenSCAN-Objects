thickness = 3;
padding = 8;
offset = 20;
vesa_screw_size = 5;

$fn=100;

linear_extrude(thickness)
union(){
difference(){
    hull(){
        circle(padding);
        translate([100+offset, 0, 0]) circle(padding);
        translate([100+offset, 100, 0]) circle(padding);
        translate([0, 100, 0]) circle(padding);
    }
    circle(d=vesa_screw_size);
    translate([100, 0, 0]) circle(d=vesa_screw_size);
    translate([100, 100, 0]) circle(d=vesa_screw_size);
    translate([0, 100, 0]) circle(d=vesa_screw_size);
}
translate([100+offset, 50-80/2, 0]) square([50, 80]);
}

translate([100+offset+50,50,0])cylinder(d=80, h=3);
difference(){
    translate([100+offset+50,50,0])cylinder(d=80, h=10);
    translate([100+offset+50,50,0])cylinder(d=67.5, h=10+1);
    
}

difference(){
    translate([100+offset+50,50,3])cylinder(d=80, h=3+4);
    translate([100+offset+50,50,0])cylinder(d=56.5, h=10+1);
    translate([100+offset+50,50,5])
    rotate([0,0,45])
    cube([100,16,10+1], true);
    translate([100+offset+50,50,5])
    rotate([0,0,-45])
    cube([100,16,10+1], true);
    
    for(i = [0,90,180,270]){
    translate([100+offset+50,50,3])
    rotate([0,0,i])
    translate([0,-8,0])
    cube([100,30,4]);
    }
    
}


difference(){
    union(){
    translate([100+offset+50,50,4+3-0.5/2])
    rotate([0,0,0])
    cube([75,3,0.5], true);
    translate([100+offset+50,50,4+3-0.5/2])
    rotate([0,0,90])
    cube([75,3,0.5], true);
    }
    translate([100+offset+50,50,0])cylinder(d=56.5, h=10);
    
}

difference(){
    hull(){
        #translate([100+padding+offset/2,50,3/2])
        cube([offset,100+padding*2,3], true);
        translate([100+offset+50,50,0])cylinder(d=80, h=10);
    }
    
    translate([100+offset+50,50,3])cylinder(d=80, h=3+4);
    
}