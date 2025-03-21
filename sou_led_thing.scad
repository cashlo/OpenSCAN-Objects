

ear_offset = 72;
ear_rotation = 10;

eye_offset = 45;

track_width = 5;

thickness = 3;
light_screen_thickness = 0.4;


difference(){
linear_extrude(thickness)
offset(9, $fn=30)
cat_base();

#translate([0,0,light_screen_thickness])
linear_extrude(thickness*2)
    translate([0,-25,0])
    cat_face();
    
translate([0,0,light_screen_thickness])    
linear_extrude(thickness*2)
mirror([1,0,0]){

    paw_set();


    
    sou_parts();
};
}

module paw_set(){
    translate([-25,-70,0])
    difference(){
    offset(3)
    cat_paw();
    cat_paw();
    }
    
    translate([25,-70,0])
    difference(){
    offset(3)
    cat_paw();
    cat_paw();
    }
    
    
    translate([-25-5,-105,0])
    rotate([0,0,10])
    difference(){
    offset(3)
    cat_paw();
    cat_paw();
    }
    
    translate([25-2,-105,0])
    rotate([0,0,-10])
    difference(){
    offset(3)
    cat_paw();
    cat_paw();
    }

}


module sou_parts(){
    
    
    translate([17,-48,0])
    square([25,track_width]);
    
    translate([-22-20,-48,0])
    square([25,track_width]);
    
    
    translate([-7,-112,0])
    rotate([0,0,-5])
    square([track_width,65]);
    
    translate([-38,-147,0])
    rotate([0,0,-40])
    square([track_width,50]);
    
    
    translate([-5,-115,0])
    rotate([0,0,-120])
    square([track_width,50]);
    
    
    
    
    
}


module cat_paw(){
    scale([1.5,1,1])
    circle(6);
   
    translate([0,3,0])
    scale([1,1.5,1])
    circle(4);
    
    translate([-3,2,0])
    rotate([0,0,20])
    scale([1,1.5,1])
    circle(4);
    
    translate([3,2,0])
    rotate([0,0,-20])
    scale([1,1.5,1])
    circle(4);
}

module cat_face(){
    translate([-eye_offset/2,0,0])
    scale([1,1.5,1])
    circle(5);
    
    translate([eye_offset/2,0,0])
    scale([1,1.5,1])
    circle(5);
    
    offset(1)
    translate([0,-10,0])
    scale([1,0.7,1])
    rotate([0,0,-30+180])
    circle(10, $fn=3);
    
    translate([-1,-20,0])
    rotate([0,0,-10])
    square([15,track_width]);

    translate([1,-20,0])
    rotate([0,0,10])
    translate([-15,0,0])
    square([15,track_width]);

}

module cat_base(){

translate([-ear_offset/2,0,0])
rotate([0,0,ear_rotation])
scale([0.9,1.2,1])
rotate([0,0,-30])
circle(20, $fn=3);

translate([ear_offset/2,0,0])
rotate([0,0,-ear_rotation])
scale([0.9,1.2,1])
rotate([0,0,-30])
circle(20, $fn=3);

hull(){
    translate([-50,-24.5,0])
    square([100,10]);

    translate([0,-95,0])
    scale([1,0.9,1])
    rotate([0,0,-5])
    circle(63);
    
    translate([0,-115,0])
    scale([1,0.7,1])
    circle(58);
}

/*
translate([5,-180,0])
scale([1,0.7,1])
difference(){
    circle(51);
    circle(50);
    
    rotate([0,0,110])
    square([100,100]);
}
*/
}
