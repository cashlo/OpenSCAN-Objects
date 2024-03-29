wall_thickness = 6.2;
thickness = 2;
height_offset = 60;

right_rotation = 20;
down_rotation  = 20;


module camera_mount(){
rotate([down_rotation,-right_rotation,0])
translate([0,0,thickness]){

    cylinder(h=5, d=1.8);
    translate([21,0,0]) cylinder(h=5, d=1.8);

    translate([0,12.5,0]) {
        cylinder(h=5, d=1.8);
        translate([21,0,0]) cylinder(h=5, d=1.8);    
        }
}

    
    
translate([-5/2,-5/2,0]){
    hull() {
    rotate([down_rotation,-right_rotation,0]) cube([21+5, 12.5+5, 2]);
    cube([21+5, 12.5+5, 2]);
    }
    }
    
}
translate([30,-4,0])
rotate([-90,0,0])
difference(){
cylinder(12.5+6, 26/2, 26/2);
    
cylinder(12.5+6, 24/2, 24/2);
cube([100,100,100]);
}


difference(){
camera_mount();
    
translate([30,-4,0])
rotate([-90,0,0])
    cylinder(12.5+8, 24/2, 24/2);

}