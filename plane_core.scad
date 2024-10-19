
use <Naca4.scad>


!rotate([-90,0,-90]){
wing(100,20,10,300,0.7);

translate([300,0,0])    
wing(50,0,0,50,1);

translate([300,0,0])
rotate([-90,0,0])    
wing(50,0,0,50,1,0009);    
}


module wing(width=100, sweep_angle=5, dihedral_angle=5, length=100, tip_scale=1, naca=2412){
    hull(){
        scale(width/100) airfoil(naca);
        #translate([length*tan(sweep_angle),length*tan(dihedral_angle),length])
        scale(tip_scale)
        scale(width/100) airfoil(naca);
    }
}



length = 90;

difference(){
    cube([25,2,25], true);
    
    translate([0,0,-8])
    cube([8,10,4],true);

    translate([10,0,10])
    rotate([90,0,0])
    cylinder(10,0.7,0.7, true);

    translate([-10,0,10])
    rotate([90,0,0])
    cylinder(10,0.7,0.7, true);

    translate([10,0,-10])
    rotate([90,0,0])
    cylinder(10,0.7,0.7, true);

    translate([-10,0,-10])
    rotate([90,0,0])
    cylinder(10,0.7,0.7, true);
}

translate([0,-length/2+1,-25/2+1/2])
difference(){
    cube([25,length,2], true);

    translate([8.5,0,0]) servo_mount();
    translate([-8.5,0,0]) servo_mount();
    translate([0,-30,0]) servo_mount();
    
    translate([8.5,20,0.5]) hex_mount();
    translate([-8.5,20,0.5]) hex_mount();
    
    #translate([8.5,-30,0.5]) hex_mount();
    translate([-8.5,-30,0.5]) hex_mount();
    
    
    
}

module hex_mount(){
    cylinder(1, 4.5/2, 4.5/2, true, $fn=6);
    cylinder(10, 1, 1, true, $fn=20);
}



translate([5,0,0]) camera_support();
translate([-5,0,0]) camera_support();

module camera_support(){
    intersection(){
    translate([0,0,-13])
    rotate([180+30,0,0])
    cube([2, 30, 20], true);
    translate([0,-15,0]) cube([2, 30, 25], true);
    }
}

module servo_mount(){
        #cube([8.5,18,10], true);
    
        translate([0,9+2,0])
        cylinder(10,1,1, true);
    
        translate([0,-9-2,0])
        cylinder(10,1,1, true);
    
}