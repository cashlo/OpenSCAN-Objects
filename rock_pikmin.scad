size = 50;
seed = 5;
faces = 25;
rotations = rands(0, 360, faces*2, seed);
shell_thick = 5;

/*
difference(){
    plant_hole(-0.5);
    faces(shell_thick);
    }
*/

back();

module back(){
intersection(){
    difference(){
        union(){
        translate([-size*2, -size, -size])
        cube(size*2);
        interface();
        }
        faces(shell_thick);
        arms();
        plant_hole();
        
    }
    faces(0);
}

}

module front(){
intersection(){
    difference(){
        translate([0, -size, -size])
        cube(size*2);
        faces(shell_thick);
        arms();
        plant_hole();
        interface(0.2);
    }
    faces(0);
}
}



module interface(offset=0){
difference(){
translate([0, -size, -size])
 cube([1, size*2, size*2]);
    faces(shell_thick/2+offset);
}
}

module arms() {
rotate([0,10,20])
translate([size*0.6,size/5,-size/2+10])
rotate([0,-90,0])
feet(10, 20);

rotate([0,10,-20])
translate([size*0.6,-size/5,-size/2+10])
rotate([0,-90,0])
feet(10, 20);

translate([-size/5,size/2,-size/2])
rotate([0,-20,100])
feet(10, 30);

translate([-size/5,-size/2,-size/2])
rotate([0,-20,-100])
feet(10, 30);
}

$fn=20;
/*

arms();

difference(){
    //translate([0,0,size])
    cube(size*2, true);
    faces();
    plant_hole();
}



*/

module plant_hole(offset=0) {
    
        rotate([0,-30,0])
    translate([0,0,-size*0.3])
    cylinder(size*2, size*0.3, size*0.5, $fn=6);
}


module faces(offset=0) {
    for(i = [0:faces])
    rotate([0, rotations[i*2], rotations[i*2+1]])
    translate([size/2+offset, -size*2, -size*2]) cube(size*4);
    
}

module feet(finger_size, angle) {
    cylinder(size/3, 3, 3);
    rotate([0,90+angle,0]) cylinder(finger_size, 3, 0.5);
    rotate([30,90+angle,0]) cylinder(finger_size*0.8, 3, 0.5);
    rotate([-30,90+angle,0]) cylinder(finger_size*0.8, 3, 0.5);
    sphere(3);
    
    
}