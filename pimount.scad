thickness = 2;
wall_thickness = 6.2;

translate([-5,-5,0]){
    cube([49+10,10,thickness]);
    translate([0,0,-wall_thickness]) cube([49+10,thickness,wall_thickness]);
    translate([0,0,-wall_thickness-thickness]) cube([49+10,5+thickness,thickness]);
    }
    
    
cylinder(h=7, d=2.5);
translate([49,0,0]) cylinder(h=7, d=2.5);
    
    
translate([0,0,6.5])
rotate([45,0,0])
{
    cylinder(h=4, d=2.5);
translate([49,0,0]) cylinder(h=4, d=2.5);
    }
