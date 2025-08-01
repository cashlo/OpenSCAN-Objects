color("black")
difference(){
    
    union(){
    cylinder(0.5, 40/2-0.5, 40/2);
    translate([0,0,0.5])
    cylinder(3-1, 40/2, 40/2);
    translate([0,0,2.5])
    cylinder(0.5, 40/2, 40/2-0.5);
    
    }
}

color("white")
linear_extrude(0.2)
offset(0.5, $fn=10)
square([25, 25], true);

color("black")
linear_extrude(0.2)
mirror([0,1,0])
scale(0.3)
import("frameh.svg", center=true);

color("gold")
translate([0,0,2.8])
logo();

module qr(){

color("white")
linear_extrude(0.2)
offset(0.5, $fn=10)
square([25, 25], true);

color("black")
linear_extrude(0.2)
mirror([0,1,0])
scale(0.3)
import("frameh.svg", center=true);
}

module logo(){
color("black")
linear_extrude(0.2)
offset(0.05)
scale(0.22)
import("logo2.svg", center=true);
}