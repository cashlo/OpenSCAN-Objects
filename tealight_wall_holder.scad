shell();
frame();

module frame(thick=5,width=50,length=70){
    difference(){
        union(){
            cylinder(thick, d=width);
            
            translate([0,-width/2,0])
            cube([length,width,thick]);
            
            translate([length,-width/2,0])
            cube([thick,width,length]);
            
            translate([length,0,length])
            rotate([0,90,0])
            cylinder(thick, d=width);
        }
        
        cylinder(thick/2, d=40);
        
        translate([length,0,width/2])
        rotate([0,90,0])
        cylinder(thick, d=3.1);
        
        translate([length-thick/2,0,width/2])
        rotate([0,90,0])
        cylinder(thick, d=7);
    }
}

module shell(thick=5,width=50,length=70){
    shell_width = width+5;
    shell_thick = thick+5;
    
    difference(){
        union(){
            translate([0,0,-shell_thick])
            cylinder(shell_thick, d=shell_width);
            translate([length+thick-1,0,thick+5/2])
            rotate([90,0,180])
            difference(){
                dish_q(shell_width, length+thick-1);
                dish_q(shell_width-5, length+thick-1);
            }
            
            translate([0,0,-5/2]){
                translate([0,-shell_width/2,0])
                cube([length+thick,shell_width,shell_thick]);
                cylinder(shell_thick, d=shell_width);
            }
        }
        
        translate([0,0,-shell_thick])
        cylinder(shell_thick, d=width);
        
        translate([0,-(width-5)/2,-thick])
        cube([length+thick,width-5,thick]);
        
        translate([0,0,-thick])
        cylinder(thick+5, d=width-5);
        
        frame(5.2,50.2,70.2);    
    }
}
module dish_q(width=50,length=70){
    intersection(){
            translate([-1,-1,-(width+1)/2])
            cube([length+width+2,length+width+2,width+1]);
        
            rotate_extrude()
            translate([-length,0,0])
            union(){
                circle(d=width);
                translate([0,-width/2,0])square([length,width]);
            }
    }    
}