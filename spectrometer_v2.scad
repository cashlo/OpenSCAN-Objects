use <chamfer.scad>;

camera_angle = 45;

diffraction_angle = 45;
tall = 100;
wall = 5;
width = 30;
height = 15;


translate([9.5,0,tall])
rotate([-45,0,0])
translate([0,8.5,0])
pi_camera_standoffs();

rotate([90,0,0])
translate([wall+(width-23)/2,30,0])
pi_zero_standoffs();

spec();

module dvd() {
    difference() {
        cylinder(1, 120/2+0.3, 120/2+0.3, $fn=100);
        cylinder(2, 15/2-0.3, 15/2-0.3, $fn=40);
        
    }
}

module grating_holder() {
    
    difference(){
        translate([-width/2-wall,0,-1])
        cube([width+wall*2, 65, 2]);
        
        translate([0,3,0])
        #dvd();
    }
}




module m2_stand(height=2.5){
    $fn=20;
    difference(){
        cylinder(height, 3.5/2, 3.5/2);
        cylinder(height+1, 2/2, 2/2);
    }    
}

module pi_camera_standoffs(){
        m2_stand();
        translate([21,0,0]) m2_stand(2);
        translate([21,12.5,0]) m2_stand(2);
        translate([0,12.5,0]) m2_stand(2);
    
    difference(){
        translate([-width+23-wall/2,-8,0]) cube([width+wall*2,(height+wall*2)/sin(45)-0.5,2]);
        translate([-1,-1,-1]) cube([23,20,3]);
    }
    
    #
    difference(){
        
        translate([5,6.5,0]) cube([11.2, 12.2, 10]);
    }
}

module pi_zero_standoffs(){
        m2_stand();
        translate([23,0,0]) m2_stand();
        translate([23,65-7,0]) m2_stand();
        translate([0,65-7,0]) m2_stand();    
}

module spec(){
    difference(){
        
        chamfered_cube([width+wall*2, height+wall*2, tall], 1);

        
        translate([wall, wall, -1])
        cube([width, height, tall+10]);
        
        translate([0,0,tall])
        rotate([-diffraction_angle,0,0])
        cube([100, 100, 100]);
        
        
        
        translate([wall/2-0.5, -61+height+wall*1.5+0.5, 2])
        cube([width+wall+1, 60+1, 1+0.6]);
        
    }
}
