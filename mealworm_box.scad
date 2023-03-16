width = 150;
depth = 50;
height = 40;
wall = 2;
margin = 0.2;

$fn=200;

//translate([0,0,10])
//cylinder_box();

translate([0,0,60])
cylinder_box_2();

//#base_plate();
//cylinder_cover();

//translate([wall+margin,wall+margin,wall+margin])
//bottom();


module bottom() {
    cube([
        width-wall*2-margin*2,
        depth-wall*2-margin*2,
        wall
    ]);
    
}

module box() {
    difference(){
        cube([width,depth,height]);
        
        translate([wall,wall,wall])
        cube([width-wall*2,depth-wall*2,height-wall+1]);
        
        translate([wall*2,wall*2,-wall])
        cube([width-wall*4,depth-wall*4,height-wall+1]);
        
    }
}

module cylinder_box_2() {
    difference(){
        cylinder(height, width/2, width/2);
        
        translate([0,0,wall])
        cylinder(height, width/2-wall, width/2-wall);
        
        translate([0,0,-wall])
        cylinder(height, width/2-wall*2, width/2-wall*2);
        
        
        for(r=[0:5:360]){
            rotate([0,0,r])
            translate([0,0,height*2/3])
            cube([width*2,0.5,12], true);
        }
    }
    
    translate([0,0,-wall*3])
    difference(){
        union(){
            translate([0,0,wall*2])
            cylinder(wall, width/2-wall-margin, width/2);
            cylinder(wall*2, width/2-wall-margin, width/2-wall-margin);
        }
        
        translate([0,0,-wall])
        cylinder(height, width/2-wall*2, width/2-wall*2);
        
         for(r=[0:5:360]){
            rotate([0,0,r])
            translate([0,0,wall*2.5])
            cube([width*2,3,wall], true);
        }
    }
    
}

module cylinder_box() {
    difference(){
        cylinder(height, width/2, width/2);
        
        translate([0,0,wall])
        cylinder(height, width/2-wall, width/2-wall);
        
        translate([0,0,-wall])
        cylinder(height, width/2-wall*2, width/2-wall*2);
        
    }
}

module cylinder_bottom() {
    cylinder(wall, width/2-margin-wall, width/2-margin-wall);
}


module cylinder_cover() {
    cylinder(wall*2, width/2-margin-wall, width/2-margin-wall);
    cylinder(wall, width/2+wall, width/2+wall);
    
}

module base_plate() {
    difference(){
    for (d=[0:360/6:360]) {
        echo(d)
        rotate([0,0,d])
        translate([width/2,0,5/2])
        cube([wall*2,wall*2,5], true);
    }
    translate([0,0,wall+2])
    cylinder(height, width/2+margin, width/2+margin);
    }
    difference(){
        intersection(){
            cylinder(wall+10, width/2+5+10, width/2+5+10);
            translate([0,0,-wall/4])
            cylinder(wall+20, width/2+5, width/2+5+20);
        }
        translate([0,0,wall/2])
        cylinder(wall+10, width/2+5, width/2+5+10);
    }
    
}