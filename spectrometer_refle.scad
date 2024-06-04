use <chamfer.scad>;


for(i=[0: 4])
    translate([i*40,0,0])

slit(0.5+i*0.1);

diffraction_angle = 90-10;
tall = 150;
wall = 5;
width = 30;
height = 15;

//slit_side();

//grating_holder();

/*
difference(){
    refle_spec();
    
    rotate([10,0,0])
    translate([-5,40,-100])
    cube([10,10,100]);
    
    #rotate([10,0,0])
    translate([-10,20,-10])
    cube([20,30,10]);
    
    // Pixel Fold bump
    #rotate([10,0,0])
    translate([-30,34,-21])
    cube([100, 22, 3]);
    
    
}
*/

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
    translate([width/2+wall/2,15,0])
    difference(){
    cylinder(1, 10, 10);
    
    #
    translate([8,-1,0])
    mirror([1,0,0])
    linear_extrude(0.5)
    text(str(offset, "mm"), 4);
    }
}

module refle_spec(){
    grating_holder();
    
    difference(){
    translate([0,65,3])
    rotate([-diffraction_angle,0,0])
    translate([-width/2-wall,-height/2-wall,-tall])
    difference(){
        
        chamfered_cube([width+wall*2, height+wall*2, tall], 1);

        
        translate([wall, wall, -wall])
        cube([width, height, tall]);
        
        
        
        translate([wall/2-0.5, wall/2-0.5, 2])
        cube([width+wall+1, 60+1, 1+0.6]);
        
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