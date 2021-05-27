wall_thickness = 6.2;
thickness = 2;
height_offset = 66;

right_rotation = 20;
down_rotation  = 20;

rotate([down_rotation,-right_rotation,0])
translate([0,0,thickness]){

    cylinder(h=5, d=1.8);
    translate([12.5,0,0]) cylinder(h=5, d=1.8);

    translate([0,21,0]) {
        cylinder(h=5, d=1.8);
        translate([12.5,0,0]) cylinder(h=5, d=1.8);    
        }
}

    
    
translate([-5/2,-5/2,0]){
    hull() {
    rotate([down_rotation,-right_rotation,0]) cube([12.5+5, 21+5, 2]);
    cube([12.5+5, 21+5, 2]);
    }
    translate([0, 21+5, 0]) cube([12.5+5, height_offset, 2]);
    translate([0,21+5+height_offset-thickness,thickness]) #cube([12.5+5,thickness,wall_thickness]);
    translate([0,21+height_offset-thickness,wall_thickness+thickness]) cube([12.5+5,5+thickness,thickness]);
    }