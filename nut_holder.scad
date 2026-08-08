include <BOSL2/std.scad>
include <BOSL2/screws.scad>



n_of_nuts = 3;
distance = 30;
nut_size = "M8";

//translate([-30,0,0])
nut_holder("M6", n_of_nuts);



module nut_holder(nut_size, n_of_nuts){
    nut_spec = nut_info(nut_size);

    nut_width = struct_val(nut_spec, "width");
    nut_thick = struct_val(nut_spec, "thickness");
    
    
    %translate([0,distance/2,0])
    rotate([30,0,90])
    rotate([0,90,0])
    nut(nut_size, anchor=CENTER);

    difference(){
        cuboid([nut_width*1.5,n_of_nuts*distance,nut_width+3], anchor=TOP+FRONT);
        
        // Mounting slot
        translate([3,0,-nut_width])
        cuboid([nut_width*1.5,n_of_nuts*distance,0.6], anchor=TOP+FRONT);
        
        // Mounting holes
        translate([0,10,-nut_width])
        cyl(10, d=3, anchor=TOP);
        
        translate([0,n_of_nuts*distance-10,-nut_width])
        cyl(10, d=3, anchor=TOP);
        

        for(i=[0:n_of_nuts-1])
        translate([0,i*distance + distance/2,0])
        rotate([0,-90,90])
        nut_trap_side(10, nut_size, $slop=0.2, anchor=CENTER);
    }
}





*nut("M10");

*translate([20,0,0])
nut("M8");

*translate([40,0,0])
nut("M6");


