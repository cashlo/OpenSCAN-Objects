ziptie_width = 2.5;
ziptie_thickness = 1;

$fn=50;

difference(){
    difference(){
        cube([38,38,8], true);
        
        translate([38/2-4.5,38/2-3]) cube([ziptie_width+0.4, ziptie_thickness+0.4, 10], true);
        translate([38/2-4.5,-38/2+3]) cube([ziptie_width+0.4, ziptie_thickness+0.4, 10], true);
        translate([-38/2+4.5,38/2-3]) cube([ziptie_width+0.4, ziptie_thickness+0.4, 10], true);
        translate([-38/2+4.5,-38/2+3]) cube([ziptie_width+0.4, ziptie_thickness+0.4, 10], true);
    }
    #cylinder(h=1.84+0.2, d=25.55 + 0.4);
    #translate([0,0,1.84+0.2])cylinder(h=7.98-1.84+0.2, d=31.87 + 0.4);
}

difference(){
    cylinder(h=7.98+0.4, d=31.87 + 0.4 + 4);
    cylinder(h=7.98+0.4, d=31.87 + 0.4);
    
    
}

translate([40,0,0]) difference(){
    cube([38,38,8], true);
    cylinder(h=7.98+0.4, d=31.87 + 0.4 + 4 + 0.2);
    translate([38/2-4.5,38/2-3]) cube([ziptie_width+0.4, ziptie_thickness+0.4, 10], true);
    translate([38/2-4.5,-38/2+3]) cube([ziptie_width+0.4, ziptie_thickness+0.4, 10], true);
    translate([-38/2+4.5,38/2-3]) cube([ziptie_width+0.4, ziptie_thickness+0.4, 10], true);
    translate([-38/2+4.5,-38/2+3]) cube([ziptie_width+0.4, ziptie_thickness+0.4, 10], true);
}