$fn=1000;
r = 140;

//translate([0,0,105+1+3])
//rotate([90,0,0])
//LED_half_square_ring();
translate([0,0,20]) cover();
//base();
corner_r = 30;

module LED_ring(){
    difference(){
        cylinder(h=12, r=r+1, center=true);
        cylinder(h=10, r=r-1, center=true);
        cylinder(h=13, r=r-1.5, center=true);
    }
}

module LED_half_square_ring(){
    intersection() {
        translate([150,0,0]) cube([300, 300, 300], true);
        translate([0,0,-6]) difference(){
            linear_extrude(12) rounded_square((r+1-corner_r)*2, corner_r);
            translate([0,0,1])linear_extrude(10) rounded_square((r+1-corner_r)*2, corner_r-2);
            translate([0,0,-1])linear_extrude(14) rounded_square((r+1-corner_r)*2, corner_r-2.5);
        }
    }
    difference(){
        LED_ring();
        translate([150,0,0]) cube([300, 300, 300], true);
    }
}


module rounded_square(size, r) {
    size = size/2;
        hull() {
            translate([size,size,0])  circle(r);
            translate([-size,size,0]) circle(r);
            translate([size,-size,0])  circle(r);
            translate([-size,-size,0]) circle(r);
        }
}


module base(){
    difference(){
        cylinder(h=20, d=105+5);
        
        translate([0,0,105+1+3])
        rotate([90,0,0])
        cylinder(h=12+0.3, r=105+1+0.15, center=true);
        
        translate([0,0,17]) cylinder(h=25, d=105+5-1.5*2);
        translate([0,0,3]) cylinder(h=25, d=105+5-3*2);
        translate([0,-50,20/2])rotate([90,0,0])cylinder(h=20, d=10.1+0.3);
        translate([0,50,20/2])rotate([90,0,0]){
            
            //cube([5.3+0.3,2.3+0.3,20], true);
            //translate([0,(2.3+0.3)/2,-10])cylinder(h=20, r=2+0.15);
        }
    }
}

module cover() {
    
    difference(){
        union(){
            cylinder(h=7, d=105+5);
            translate([0,0,-3+0.2]) cylinder(h=5, d=105+5-(1.5+0.1)*2);
        }
        translate([0,0,-4]) cylinder(h=8, d=105+5-3*2);
        //translate([0,0,5.01-1])cylinder(h=1, d1=105-5, d2=105+5);
        
        translate([0,0,105+1+3-20])
        rotate([90,0,0])
        difference(){
            cylinder(h=12+0.3, r=105+1+5, center=true);
            cylinder(h=13, r=105-1.5-0.15, center=true);
        }
        
        translate([0,0,-10])
        cube([200,12+0.3,24], true);
    }

}