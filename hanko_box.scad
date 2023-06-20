ink_pad = 62.5;
hanko_lenght = 60.5;
hanko_width = 17.5;
wall = 2;


difference(){
    
    // Shell
    union(){
        cylinder(hanko_width+wall*3, ink_pad/2+wall, ink_pad/2+wall);
        translate([-ink_pad/2-wall,0,0])
        cube([ink_pad+wall*2, ink_pad/2+wall+hanko_width+wall, hanko_width+wall*3]);
    }
    
    // Ink pad space
    translate([0,0,wall])
    cylinder(hanko_width+wall*3, ink_pad/2, ink_pad/2);
    translate([-ink_pad/2,0,wall+hanko_width/2])
    cube([ink_pad, ink_pad/2+wall+hanko_width, hanko_width+wall]);
    
    
    // Hanko space
    translate([0,ink_pad/2+wall+hanko_width/2,wall+hanko_width/2])
    rotate([0,90,0])
    cylinder(ink_pad, hanko_width/2, hanko_width/2, center=true);
    
    // Cover space
    translate([0,0,wall+hanko_width])
    cylinder(wall, ink_pad/2+wall/2, ink_pad/2+wall/2);
    
    translate([-ink_pad/2-wall/2,0,wall+hanko_width])
    cube([ink_pad+wall, ink_pad/2+wall+hanko_width, wall]);
    
    #translate([-ink_pad/2-wall/2,ink_pad/2+wall+hanko_width,wall+hanko_width])
    cube([ink_pad+wall, wall, wall*2]);
    
    
    
}

translate([ink_pad+wall*3,0,-wall-hanko_width]){

    translate([0,0,wall+hanko_width])
    cylinder(wall-0.2, ink_pad/2+wall/2-0.2, ink_pad/2+wall/2-0.2);
    
    difference(){
    translate([-ink_pad/2-wall/2+0.1,0,wall+hanko_width])
    cube([ink_pad+wall-0.2, ink_pad/2+wall+hanko_width+wall, wall-0.2]);
    
        #translate([-ink_pad/2-wall/2+0.1+ink_pad/2,ink_pad/2+hanko_width/2,wall+hanko_width+wall/2])
        cylinder(10,10,10);
    
    }
    
}