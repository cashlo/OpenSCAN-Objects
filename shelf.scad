leg_size = 10 - 0.3;

leg3();


rotate([90,0,90])
leg3();

translate([250-20,0,0])
rotate([90,0,90])
leg3();

translate([0,-1,142])
rotate([90,0,90])
leg2();

translate([-5-0.15,0,120+leg_size])
plate();



module leg3(){
    cube([leg_size, 132, leg_size]);
    
    translate([80+0.15,0,0])
    cube([leg_size, 132, leg_size]);
    
    translate([-10,120,0])
    cube([110, leg_size, leg_size]);
}


module leg(){
    cube([100, leg_size, leg_size]);
    
    
    translate([0,36,0])
    rotate([0,0,-45])
    cube([50, leg_size, leg_size]);
    
    translate([0,124,0])
    mirror([0,1,0])
    rotate([0,0,-45])
    cube([50, leg_size, leg_size]);
    
    difference(){
        cube([leg_size, 190, leg_size]);
        
        translate([leg_size,-8+190,0])
        rotate([0,0,45])
        cube([leg_size, leg_size, leg_size]);
        
        translate([0,140,0])
        difference(){
            cube([leg_size/2, 250, leg_size]);
            
            translate([0,-8,0])
            rotate([0,0,45])
            cube([leg_size, leg_size, leg_size]);
        }
    }
    
    difference(){
        translate([5,150+leg_size+5.3,0])
        cube([leg_size/2+1, leg_size, leg_size]);
    
        translate([10+1,150+leg_size+5.3,0])
        rotate([0,0,10])
        cube([leg_size/2+1, leg_size+2, leg_size]);
    }
    
    translate([5,150,0])
    cube([80+leg_size+0.15, leg_size, leg_size]);
    
    translate([80+0.15,150+leg_size,0])
    cube([leg_size, 5, leg_size]);
    
    
    
}

module leg2(){
    
    translate([0,124,0])
    mirror([0,1,0])
    rotate([0,0,-45])
    cube([50, leg_size, leg_size]);
    
    difference(){
        cube([leg_size, 190, leg_size]);
        
        #translate([0,-8,0])
        rotate([0,0,45])
        cube([leg_size, leg_size, leg_size]);
        
        #difference(){
            translate([leg_size/2,0,0])
            cube([leg_size/2, 50, leg_size]);
            #
            translate([leg_size,50-8,0])
            rotate([0,0,45])
            cube([leg_size, leg_size, leg_size]);
        }
        
        #translate([leg_size,-8+190,0])
        rotate([0,0,45])
        cube([leg_size, leg_size, leg_size]);
        
        translate([0,140,0])
        difference(){
            cube([leg_size/2, 250, leg_size]);
            #
            translate([0,-8,0])
            rotate([0,0,45])
            cube([leg_size, leg_size, leg_size]);
        }
    }
    
        
    difference(){
        translate([5,150+leg_size+5.3,0])
        cube([leg_size/2+1, leg_size, leg_size]);
    
        translate([10+1,150+leg_size+5.3,0])
        rotate([0,0,10])
        cube([leg_size/2+1, leg_size+2, leg_size]);
    }
    
    translate([5,150,0])
    cube([80+leg_size+0.15, leg_size, leg_size]);
    
    translate([80+0.15,150+leg_size,0])
    cube([leg_size, 5, leg_size]);
    
    
    
}

module plate(){
    difference(){
    cube([250,150,5]);
        
    translate([5,0,0])
    cube([10,10,100]);
        
    translate([250-5-10,0,0])
    cube([10,10,100]);
        
    translate([5,80,0])
    cube([10,10,100]);
        
    translate([250-5-10,80,0])
    cube([10,10,100]);
    }
}