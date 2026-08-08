include <BOSL2/std.scad>
include <BOSL2/screws.scad>

nut_size = "M8";

difference(){
    up(2.5)
    cuboid([50,20,20], anchor=TOP);
    
    up(0.01)
    nt_open(10, nut_size);
    
    up(0.01)
    translate([-15,0,0])
    nt_open(10, nut_size);
 
    up(0.01)
    translate([15,0,0])
    nt_open(10, nut_size);
     
}


module nt_open(length, nut_size, slop=0.2){

    nut_spec = nut_info(nut_size);
    nut_width = struct_val(nut_spec, "width");
    nut_point_width = nut_width*2/sqrt(3);
    
    difference(){
    down(nut_point_width/2+slop){
        rotate([0,-90,0])
        nut_trap_side(nut_width/sqrt(3)+slop*2, nut_size, $slop=slop, anchor=CENTER);
        
        hull(){
            up(nut_point_width/2)
            rotate([0,-90,0])
            nut_trap_side(nut_width/sqrt(3)+0.1*2, nut_size, $slop=slop, anchor=CENTER);
            
            up(nut_point_width)
            rotate([0,-90,0])
            nut_trap_side(20, nut_size, $slop=slop+1, anchor=CENTER);
        }
    }
    
    cuboid([200,200,200], anchor=BOTTOM);
    
    }
    
    
    
    
    
}