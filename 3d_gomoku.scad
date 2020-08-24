size = 7;
space = 15;
stick_size = 3;
hole_size = stick_size + 0.15;
gap_size = 5;

$fn=100;

module base(){
    difference(){
        cube([(space+hole_size)*size-space+hole_size*2, (space+hole_size)*size-space+hole_size*2, 10]);

        for (i=[0:size]){
            for (j=[0:size]){
                translate([i*(space+hole_size)+hole_size,j*(space+hole_size)+hole_size,2]) cube([hole_size,hole_size,10]);
            }
        }
    }
}

module stick() {
    cube([8+(space+stick_size)*(size+1)-stick_size*1.5,stick_size,stick_size]);
    for (i=[1:size]){
        translate([8+(space+stick_size)*i-stick_size*1.5,-stick_size/2,0])
        difference(){
            cube([stick_size,stick_size/2,stick_size]);
            
            translate([stick_size-0.5,-stick_size/2,stick_size])
            rotate([0,45,0])
            #cube([stick_size,stick_size,stick_size]);
            
            translate([stick_size-0.5,-stick_size/2,0])
            rotate([0,45,0])
            #cube([stick_size,stick_size,stick_size]);
            
        }
        
        translate([8+(space+stick_size)*i-stick_size*1.5,stick_size,0])
        difference(){
            cube([stick_size,stick_size/2,stick_size]);
            
            translate([stick_size-0.5,-0,stick_size])
            rotate([0,45,0])
            #cube([stick_size,stick_size,stick_size]);
            
            translate([stick_size-0.5,-0,0])
            rotate([0,45,0])
            #cube([stick_size,stick_size,stick_size]);
            
            
            
        }
    }
}

module ball() {
    difference(){
        diameter = space+stick_size-gap_size;
        sphere(d=diameter);
        
        translate([-diameter/2,-hole_size/2,-hole_size/2])
        cube([diameter, hole_size, diameter]);
        
        #translate([-diameter+hole_size/2,-hole_size,-hole_size/2])
        cube([diameter, hole_size*2, hole_size+0.1]);
        
        //
        translate([-diameter/2+1,0,1])
        rotate([0,45,0])
        cube([hole_size, hole_size*2, hole_size], center=true);
        
        
        
    }
}

stick();
//translate([8+space+stick_size*1.5,stick_size/2,stick_size/2]) ball();
//ball();
