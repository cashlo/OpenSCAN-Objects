board_size = [59+0.6, 89.5+0.6];
display_size = [50, 75.5];
board_z = 1.6;

boarder = 4;

//translate([7,board_size[1]-20, 10-3-board_z])
//rotate([0,-90,0])
//button();
//
//translate([7,board_size[1]-40, 10-3-board_z])
//rotate([0,-90,0])
//button();

module button(r = 3, h=boarder+9, hinge_y = 2, hinge_r = 1){
    $fn=20;
    {
    cylinder(h, r, r);

    translate([r-hinge_r,0,h-2-boarder/2])
    rotate([90,0,0])
    cylinder(r*2+hinge_y, hinge_r, hinge_r, center=true);
    
    rotate([0,90,0])
    cylinder(r, r, r);
    }
}

case_with_holes();

module case_with_holes(){
difference(){
case(10);

#translate([7,board_size[1]-20, 10-3-board_z])
rotate([0,-90,0])
button(r=3.1, hinge_r=1.2);

translate([7,board_size[1]-40, 10-3-board_z]){
rotate([0,-90,0])
button(r=3.1, hinge_r=1.2);
}

// typec hole
#translate([board_size[0]/2,board_size[1]+boarder+1.5,10+board_z-4])
hull(){
$fn=20;
rotate([90,0,0]){
translate([-6/2,-0.5,0])
cylinder(20, 5/2, 5/2);

translate([6/2,-0.5,0])
cylinder(20, 5/2, 5/2);
}

}



// Button holes
translate([-boarder,board_size[1]-20-3.1, 0])
cube([boarder, 3.1*2, 6]);

translate([-boarder,board_size[1]-40-3.1, 0])
cube([boarder, 3.1*2, 6]);

#translate([-boarder/2-1.2,board_size[1]-20-3.1-1, 0])
cube([1.2*2, 3.1*2+2, 6.7]);

translate([-boarder/2-1.2,board_size[1]-40-3.1-1, 0])
cube([1.2*2, 3.1*2+2, 6.7]);



#
translate([-boarder/3,-boarder/3,-1])
cylinder(10, 1.9/2, 1.9/2, $fn=10);

#translate([boarder/3+board_size[0],-boarder/3,-1])
cylinder(10, 1.9/2, 1.9/2, $fn=10);

#
translate([-boarder/3,boarder/3+board_size[1],-1])
cylinder(10, 1.9/2, 1.9/2, $fn=10);

#translate([boarder/3+board_size[0],boarder/3+board_size[1],-1])
cylinder(10, 1.9/2, 1.9/2, $fn=10);
}
}

translate([0,0,0])
back_cover();

module back_cover(){


difference(){
    linear_extrude(1)
    offset(boarder)
    square(board_size);
    
    #
    translate([-boarder/3,-boarder/3,-1])
    cylinder(10, 2.2/2, 2.2/2, $fn=10);
    
    #translate([boarder/3+board_size[0],-boarder/3,-1])
    cylinder(10, 2.2/2, 2.2/2, $fn=10);
    
    #
    translate([-boarder/3,boarder/3+board_size[1],-1])
    cylinder(10, 2.2/2, 2.2/2, $fn=10);
    
    #translate([boarder/3+board_size[0],boarder/3+board_size[1],-1])
    cylinder(10, 2.2/2, 2.2/2, $fn=10);
    
    
    
    
}

linear_extrude(2)
offset(-0.2)
square(board_size);

difference(){
    translate([-boarder,board_size[1]-20-3.1+0.1, 0])
    cube([boarder, 3.1*2-0.2, 6]);

    #translate([7,board_size[1]-20, 10-3-board_z+0.2])
    rotate([0,-90,0])
    #button(r=3.1, hinge_r=1.2);
}

difference(){
    translate([-boarder,board_size[1]-40-3.1+0.1, 0])
    cube([boarder, 3.1*2-0.2, 6]);

    #translate([7,board_size[1]-40, 10-3-board_z+0.2])
    rotate([0,-90,0])
    button(r=3.1, hinge_r=1.2);
    
   }

}

module case(thickness = 15){
translate([board_size[0]/2,board_size[1]+boarder+1.5,thickness+3.1])
difference(){
cylinder(2.5, 3, 3);
cylinder(3,   1, 1, $fn = 10);

}
translate([0,0,board_z+2+thickness])
difference(){
    linear_extrude(2)
    offset(boarder)
    square(board_size);


    hull(){
        translate([0,0,2])
        linear_extrude(0.001)
        offset(delta=2)
        translate([9/2,9/2+5,0])
        square(display_size);

        linear_extrude(0.001)
        translate([9/2,9/2+5,0])
        square(display_size);
    }

}


translate([0,0,board_z+thickness])
linear_extrude(2)
difference(){
offset(boarder)
square(board_size);

offset(-1)
square(board_size);
}


linear_extrude(board_z+thickness)
difference(){
offset(boarder)
square(board_size);

square(board_size);

}
}