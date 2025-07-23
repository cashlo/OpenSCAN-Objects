difference(){
    
    union(){
    cylinder(0.5, 40/2-0.5, 40/2);
    translate([0,0,0.5])
    cylinder(3-1, 40/2, 40/2);
    translate([0,0,2.5])
    cylinder(0.5, 40/2, 40/2-0.5);
    
    }
    
    
    translate([-5,0,0])
    rotate([0,-15,0])
    translate([120/2,0,1])
    dvd();
    
    
    #cube([5,5,10],true);
    
    
    #
    translate([10,0,1.5])
    cube([30,4,0.4],true);
    
    #
    translate([0,0,6])
    rotate([0,-15,0])
    cube([6,50,6], true);
}

color("black")
translate([5,0,2.8])
linear_extrude(0.2)
rotate([0,0,-90])
offset(0.2)
text("DVD", halign="center", size=9, font="DotGothic16:style=Regular");


color("black")
translate([-12,0,2.8])
linear_extrude(0.2)
rotate([0,0,-90])
offset(0.2)
text("分光器", halign="center", size=6.5, font="DotGothic16:style=Regular");

qr();

module qr(){
color("black")
linear_extrude(0.2)
mirror([0,1,0])
scale(0.33)
import("frame.svg", center=true);
}


module dvd() {
    difference() {
        cylinder(1, 120/2+0.3, 120/2+0.3, $fn=100);
        cylinder(2, 15/2-0.3, 15/2-0.3, $fn=40);
        
    }
}
