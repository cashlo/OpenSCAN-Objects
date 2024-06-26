use <chamfer.scad>;


//for(i=[0: 4])
//    translate([i*40,0,0])

//slit(0.5+i*0.1);

angle = 15;
diffraction_angle = 90-angle;
tall = 95;
wall = 5;
width = 30;
height = 20;

window_size = 11.2;

//slit_side();

//grating_holder();

$fn=8;


translate([0,-10,0]){
difference(){
    
rotate([-angle,0,0])
spec_zero();
    
translate([-50, -7, -50])
cube([100,100,100]);

translate([-width/2-wall,0,-wall*1.5-1.4-height])
difference(){
    translate([wall/2-0.15,-12-0.3, wall/2-0.15])
        cube([width+wall+0.3,5+0.3,height +wall+0.3]);
    translate([wall, -12-0.3, wall])
        cube([width, 5+0.3, height-0.1]);
}


translate([0,-30.5,-wall-height/2+1-15.1/2])
cube([100, 15.1, 15.1]);
}

translate([-18,-30.45,-14])
rotate([90,0,0])
slit(offset=0.5);

translate([-18,-30.45+16,-14])
rotate([90,0,0])
slit(offset=0.5);

}



translate([-width/2-wall,0,-wall*1.5-1.4-height])
difference(){
    translate([ wall/2,-12, wall/2])
        cube([width+wall,5,height +wall]);
    translate([wall, -12, wall])
        cube([width, 5, height]);
}

intersection(){
translate([-50, -7, -50])
cube([100,100,100]);

rotate([-angle,0,0])
spec_zero();
}

module spec_zero(){
    rotate([angle,0,0])
    translate([-11.5,-1.4,1.1])
    union(){
        pi_zero_standoffs();
        difference(){
            translate([(-width-wall*2+23)/2,-25,-wall])
            chamfered_cube([width+wall*2,tall-5,wall],1);
        
            #pi_zero_standoffs_offsets()
            translate([0,0,-2.5])
            cylinder(5, 2/2, 2/2);
            
            
        }
    }
    
                
                
    intersection(){
        //translate([-40,20,-100])cube([100,35,89]);
    difference(){
        refle_spec();
        
        rotate([10,0,0])
        translate([-window_size/2,36,-100])
        cube([window_size,window_size+1,100]);
        
        rotate([10,0,0])
        translate([-10,20,-10])
        cube([20,30,10]);
        
        // Pixel Fold bump
        // rotate([10,0,0])
        // translate([-30,34,-21])
        // cube([100, 22, 3]);
        
        
    }
    }
}


module m2_stand(height=2.5){
    
    difference(){
        cylinder(height, 3.5/2, 3.5/2);
        cylinder(height+1, 2/2, 2/2);
    }    
}

module pi_camera_standoff_offsets(){
        children();
        translate([21,0,0]) children();
        translate([21,12.5,0]) children();
        translate([0,12.5,0]) children();
}

module pi_camera_standoffs(){
    pi_camera_standoff_offsets()
    m2_stand(2);
    
    difference(){
        translate([-3,-3,0]) cube([27,24,2]);
        translate([-1,-1,-1]) cube([23,20,3]);
    }
}

module pi_zero_standoffs_offsets(){
        children();
        translate([23,0,0]) children();
        translate([23,65-7,0]) children();
        translate([0,65-7,0]) children();
}

module pi_zero_standoffs(){
        pi_zero_standoffs_offsets()
        m2_stand(); 
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


module slit_side(offset=0){
    difference(){
        
        slice_height = height+wall*1.5;
    
        translate([0,-slice_height/2,0])
        cube([width+wall, slice_height, 1]);
        
        translate([wall/2,-offset,0.5])
        rotate([45,0,0]) 
        cube([width, 20, 20]);
        
        translate([wall/2,-offset,-1])
        cube([width, 20, 20]);
        
        
    }
}

module slit(offset=0){
    slit_side(offset/2);
    mirror([0,1,0]) slit_side(offset/2);
}

module refle_spec(){
    grating_holder();
    
    difference(){
    translate([0,65,3])
    rotate([-diffraction_angle,0,0])
    translate([-width/2-wall,-height/2-wall,-tall])
    difference(){
        
        union(){
            chamfered_cube([width+wall*2, height+wall*2, tall], 1);
            
            rotate([90,0,0])
            translate([wall+(width-21)/2,tall-11.5,-height-wall*2-2])
            mirror([0,1,0])
            pi_camera_standoffs();
        }
        
        // screw holes
        #rotate([90,0,0])
        translate([wall+(width-21)/2,tall-11.5,-height-wall*2-2])
        mirror([0,1,0])
        pi_camera_standoff_offsets()
        cylinder(5, 2/2, 2/2);
        
        
        
        
        // Light path
        translate([wall, wall, -wall])
        cube([width, height, tall]);
        
        
    }
    translate([-50,-50,0])
    cube([200,200,100]);
    }
}

module spec(){
    difference(){
            translate([0,0,tall])
            rotate([-diffraction_angle,0,0])
            translate([width/2+wall,65+0.5,1])
            mirror([0,1,0])
            grating_holder();
        
        #translate([wall, wall, -1])
        cube([width, height, tall+10]);
        
    }


    difference(){
        
        chamfered_cube([width+wall*2, height+wall*2, tall], 1);

        
        #translate([wall, wall, -1])
        cube([width, height, tall+10]);
        
        translate([0,0,tall])
        rotate([-diffraction_angle,0,0])
        cube([100, 100, 100]);
        
        
        
        #translate([wall/2-0.5, wall/2-0.5, 2])
        cube([width+wall+1, 60+1, 1+0.6]);
        
    }
}
