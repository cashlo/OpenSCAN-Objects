lenght = 50;

translate([0,0,lenght])rotate([0,90,0]) side(false);
side();


module side(left_corner = true){
    difference(){
        cube([lenght,3,15]);
        #
        translate([-5,3/2,16])
        rotate([-90,0,-90])
        linear_extrude(lenght+10)
        polygon([[-0.3,0],[0.3,0],[0.08,12],[-0.08,12]]);
        
        
        
        #rotate([0,-60,0]) cube([30,30,30]);
        if(left_corner){
            #translate([lenght-10,0,0]) rotate([0,30,0]) cube([30,30,30]);
        }
    }
}