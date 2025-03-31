road_height = 5.9;
road_width  = 37;

wire_width = 0.9;

plug_distance = 8.7;
liner_distance = 19;





module add_interface(x_offset, r, angle){
    translate([0,plug_distance/2,0])
    rotate([0,0,90])
    plug();

    translate([-1.7,-liner_distance/2-1+0.4,0])
    cube([1.7,0.8,2.4]);
    
    difference(){
        children();
        
        translate([0,-plug_distance/2,0])
        rotate([0,0,-90])
        #plug_hole();
        
        translate([0,liner_distance/2-0.4,0])
        #cube([2,2,2.5]);
        
        translate([0,r,0])
        rotate([0,0,angle])
        translate([x_offset,-r,0])
        rotate([0,0,180]){
        translate([0,-plug_distance/2,0])
        rotate([0,0,-90])
        #plug_hole();
            
        translate([0,liner_distance/2-0.4,0])
        #cube([2,2,2.5]);
        }
    }
    
    translate([0,r,0])
    rotate([0,0,angle])
    translate([x_offset,-r,0])
    rotate([0,0,180])
    {
    translate([0,plug_distance/2,0])
    rotate([0,0,90])
    plug();
        
    translate([-1.7,-liner_distance/2-1+0.4,0])
    cube([1.7,0.8,2.4]);
    }

}

add_interface(0, 140, 30)

translate([0,140,0])
rotate([0,0,-90])
rotate_extrude(angle=30, $fn=200)
translate([140,0,0])
difference(){
    translate([-road_width/2,0,0])
    square([road_width,road_height]);

    #translate([0,road_height-1-0.4,0])
    square([1,1]);

}



module plug_hole(){
    translate([-4.7/2,0,0])
    difference(){
    cube([4.7,8.2,2.5]);
        
    translate([0.1,6.3,-0.5])
    cylinder(3, 0.5, 0.5, $fn=10);
    
    translate([4.6,6.3,-0.5])
    cylinder(3, 0.5, 0.5, $fn=10);
    }
}

module plug(){
    translate([-4.3/2,0,0])
    difference(){
        cube([4.3,8.2,2.4]);
        translate([(4.3-1)/2,8.2-5,-0.5])
        cube([1,8.2,2.4+1]);
        
        translate([0,6.3,-0.5])
        cylinder(3, 0.7, 0.7, $fn=10);
        
        translate([4.3,6.3,-0.5])
        cylinder(3, 0.7, 0.7, $fn=10);
    }
}

