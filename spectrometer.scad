use <chamfer.scad>;


//for(i=[1: 5])
//    translate([i*35,0,0])
//slit(i*0.1);

diffraction_angle = 90-45;
tall = 100;
wall = 5;
width = 30;
height = 15;

//slit_side();

//grating_holder();
spec();

module dvd() {
    difference() {
        cylinder(1, 120/2+0.3, 120/2+0.3, $fn=100);
        cylinder(2, 15/2-0.3, 15/2-0.3, $fn=40);
        
    }
}

module grating_holder() {
    
    difference(){
        
        hull(){
        translate([-width/2-wall,0,-1])
        cube([width+wall*2, 65, 2]);
            
            translate([-width/2-wall,20,-30])
        cube([width+wall*2, 10, 10]);
        }
        
        translate([0,3,0])
        #dvd();
    }
}


module slit_side(offset=0){
    difference(){
    
        translate([-15,-15,0])
        cube([30, 30, 1]);
        
        translate([-10,-offset,0])
        rotate([45,0,0]) 
        cube([20, 20, 20]);
        
        translate([-10,-offset,-1])
        cube([20, 20, 20]);
        
        
    }
}

module slit(offset=0){
    slit_side(offset/2);
    mirror([0,1,0]) slit_side(offset/2);
    
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