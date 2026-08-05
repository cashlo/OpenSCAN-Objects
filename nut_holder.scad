include <BOSL2/std.scad>
include <BOSL2/screws.scad>



n_of_nuts = 5;
distance = 30;
nut_size = "M8";

nut_holder("M8", 5);

translate([30,0,0])
nut_holder("M10", 5);

translate([-30,0,0])
nut_holder("M6", 5);



module nut_holder(nut_size, n_of_nuts){
    nut_spec = nut_info(nut_size);

    nut_width = struct_val(nut_spec, "width");
    nut_thick = struct_val(nut_spec, "thickness");
    
    
    %translate([0,distance/2,0])
    rotate([30,0,0])
    rotate([0,90,0])
    nut(nut_size, anchor=CENTER);

    difference(){
    cuboid([nut_thick*2,(n_of_nuts+1)*distance,nut_width], anchor=TOP+FRONT);

    for(i=[0:n_of_nuts])
    translate([0,i*distance + distance/2,0])
    rotate([0,-90,0])
    nut_trap_side(10, nut_size, $slop=0.1, anchor=CENTER);
    }
}





*nut("M10");

*translate([20,0,0])
nut("M8");

*translate([40,0,0])
nut("M6");


