use <chamfer.scad>;

camera_angle = 45;

diffraction_angle = 45;
tall = 115;
wall = 5;
width = 30;
height = 15;



spec_zero_re();


module spec_zero_re(){
    difference(){
        translate([wall/2, wall/2, 87]) cube([width+wall, height+wall, 3]);
        translate([wall, wall, 87]) cube([width, height, 3]);
    }


    intersection(){
        pi_spec();
        cube([100, 100, 87]);
    }



    translate([0,0,10])
    difference(){
        pi_spec();
        cube([100, 100, 87]);
        
        difference(){
            translate([wall/2-0.2, wall/2-0.2, 87]) cube([width+wall+0.4, height+wall+0.4, 3+0.2]);
            translate([wall, wall, 87]) cube([width, height, 3]);
        }
    }
}

module pi_spec(){
    spec();
    
    translate([9.5,0,tall])
    rotate([-45,0,0])
    translate([0,27.5,7])
    mirror([0,1,0])
    pi_camera_standoffs();

    rotate([90,0,0])
    translate([wall+(width-23)/2,25,-height-wall*2-2])
    pi_zero_standoffs();
}



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
        translate([-width+23-wall/2,-8,-7]) cube([width+wall*2,(height+wall*2)/sin(45)-0.5,9]);
        #translate([-1,-1,0]) cube([23,20,9]);
        translate([5,6.5,-20]) cube([11.2, 12.2, 30]);
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
        
        
        
        #translate([wall/2-0.5, wall/2-0.5, 2])
        cube([width+wall+1, 60+1, 1+0.6]);
        
    }
}
