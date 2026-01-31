board_size = [59+0.6, 89.5+0.6];
display_size = [50, 75.5];
board_z = 1.6;

boarder = 3;

//flower();
//ear();

module boarder(){
    color("black")
    union(){
    difference(){
    face(0);
    face(-1);
    }

    difference(){

    translate([42,-24,0])
    rotate([0,0,90])
    offset(3+1)
    scale(2.5)
    upper_ear_fold();

    translate([42,-24,0])
    rotate([0,0,90])
    offset(3)
    scale(2.5)
    upper_ear_fold();


    translate([30,-54,0])
    rotate([0,0,10])
    square([20,40]);


    }
    }
}

flower_offset=[-5,0,5,0];


module face(offset=0, no_frame = false){
    if(!no_frame){
        offset(boarder+offset)
        square(board_size);
    }
    translate([13,-24,0])
    rotate([0,0,90-10])
    ear(offset);
    
    translate([42,-24,0])
    rotate([0,0,90])
    ear_fold(offset);
    
    translate([board_size[0]/2,0,0])
    difference(){
        offset(offset)
        scale([1,0.6,1])
        circle(board_size[0]/2+3);
        translate([-board_size[0]/2,0,0])
        square([board_size[0]+3,board_size[1]]);
    }

}

module flower(){
    offset(1)
    for(i=[0:3])
    rotate([0,0,90*i+flower_offset[i]])
    translate([5,0,0])
    scale([1,0.65,1])
    circle(10);
}

module forhead(offset=0){
    translate([board_size[0]/2,0,board_z+1+10])
    linear_extrude(3)
    difference(){
        offset(offset)
        scale([1,0.6,1])
        circle(board_size[0]/2+3);
        translate([-board_size[0]/2,0,0])
        square([board_size[0]+3,board_size[1]]);
    }
}

module ear(offset = 2){
    color("pink")
    offset(offset+5){
        scale(2.5)
        scale([1,0.4,1])
        difference(){
        circle(10);
        
        translate([5,-10,0])
        square([5,20]);
        }
    }
}

module upper_ear_fold(){
        translate([-3.5,-2,0])
        rotate([0,0,105])
        difference(){
        scale([1,0.4,1])
        circle(10);
        
        translate([2,-15,0])
        square([10,20]);
        }
}

module ear_fold(offset = 2){
    color("pink")
    
    offset(offset+4)
    scale(2.5){
        
        translate([-4.5,0,0])
        circle(3.5, $fn=20);
        
    
        scale([1,0.4,1])
        difference(){
        circle(10);
        
        translate([5,-10,0])
        square([6,20]);
        
        translate([-12,-10,0])
        square([7,20]);
        }
        
        
        
        upper_ear_fold();
    }
}

module mymelo_case_no_parts(){
    difference(){
        mymelo_case();
        3d_boarder();
        3d_flower();
        3d_flower_boarder();
        3d_flower_core();
        3d_flower_core_boarder();
    }
    
}

module 3d_boarder(){
    difference(){
    color("black")
    translate([board_size[0],0,board_z+3+10])
    linear_extrude(1)
    mirror([1,0,0])
    boarder();
    
    3d_flower();
    3d_flower_boarder();
    
    3d_flower_core();
    3d_flower_core_boarder();
}

}

module 3d_flower(offset = 0){
    difference(){
    color("white")
    translate([board_size[0]-5,-10,board_z+3+10])
    linear_extrude(1)
    rotate([0,0,40])
    offset(offset)
    flower();
    
    3d_flower_core();
    3d_flower_core_boarder();
    }

}

module 3d_flower_core(offset = 0){
    color("yellow")
    translate([board_size[0]-5,-10,board_z+3+10])
    linear_extrude(1)
    offset(offset)
    rotate([0,0,30])
    scale([1,0.9,1])
    circle(4.5, $fn=20);
}

module 3d_flower_core_boarder(offset = 0){
    color("black")
    difference(){
        3d_flower_core(1);
        3d_flower_core(0);
    }
}

module 3d_flower_boarder(){
    color("black")
    difference(){
        3d_flower(1);
        3d_flower(0);
    }
}

mymelo_case_no_parts();
3d_boarder();
3d_flower();
3d_flower_boarder();
3d_flower_core();
3d_flower_core_boarder();


module mymelo_case() {
    color("pink")
    union(){
    case_with_holes();
    
    translate([board_size[0],0,board_z+1+10])
    linear_extrude(3)
    mirror([1,0,0])
    face(0, no_frame=true);
    
    
    }
}


//translate([7,board_size[1]-20, 10-3-board_z])
//rotate([0,-90,0])
//button();
//
//translate([7,board_size[1]-40, 10-3-board_z])
//rotate([0,-90,0])
//button();

module button(r = 3, h=boarder+9, hinge_y = 2, hinge_r = 0.6){
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


module case_with_holes(){
difference(){
case(10);

#translate([7,board_size[1]-20, 10-3-board_z])
rotate([0,-90,0])
button(r=3.1, hinge_r=0.8);

translate([7,board_size[1]-40, 10-3-board_z]){
rotate([0,-90,0])
button(r=3.1, hinge_r=0.8);
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

#translate([-boarder/2-0.8,board_size[1]-20-3.1-1, 0])
cube([0.8*2, 3.1*2+2, 7.1]);

translate([-boarder/2-0.8,board_size[1]-40-3.1-1, 0])
cube([0.8*2, 3.1*2+2, 7.1]);



#
translate([-boarder/4,-boarder/4,-1])
cylinder(10, 1.9/2, 1.9/2, $fn=10);

#translate([boarder/4+board_size[0],-boarder/4,-1])
cylinder(10, 1.9/2, 1.9/2, $fn=10);

#
translate([-boarder/4,boarder/4+board_size[1],-1])
cylinder(10, 1.9/2, 1.9/2, $fn=10);

#translate([boarder/4+board_size[0],boarder/4+board_size[1],-1])
cylinder(10, 1.9/2, 1.9/2, $fn=10);
}
}

//case_with_holes();


translate([0,0,0])
difference(){
//back_cover();

//for(i=[0:2])
//for(j=[0:2])
//translate([13+i*2.4-j,29.5+j*2.2,-1])
//rotate([0,0,360/12])
//cylinder(10, 1, 1, $fn=6);
//
//// camera hole
//translate([board_size[0]/2,board_size[1],0])
//cube([13,13*2,50], true);


}

module back_cover(){


difference(){
    linear_extrude(1)
    offset(boarder)
    square(board_size);
    
    #
    translate([-boarder/4,-boarder/4,-1])
    cylinder(10, 2.2/2, 2.2/2, $fn=10);
    
    #translate([boarder/4+board_size[0],-boarder/4,-1])
    cylinder(10, 2.2/2, 2.2/2, $fn=10);
    
    #
    translate([-boarder/4,boarder/4+board_size[1],-1])
    cylinder(10, 2.2/2, 2.2/2, $fn=10);
    
    #translate([boarder/4+board_size[0],boarder/4+board_size[1],-1])
    cylinder(10, 2.2/2, 2.2/2, $fn=10);
    

    
}

linear_extrude(2)
offset(-0.2)
square(board_size);

difference(){
    translate([-boarder,board_size[1]-20-3.1+0.1, 0])
    cube([boarder, 3.1*2-0.2, 6]);

    #translate([7,board_size[1]-20, 10-3-board_z+1])
    rotate([0,-90,0])
    #button(r=3.1, hinge_r=0.8);
}

difference(){
    translate([-boarder,board_size[1]-40-3.1+0.1, 0])
    cube([boarder, 3.1*2-0.2, 6]);

    #translate([7,board_size[1]-40, 10-3-board_z+1])
    rotate([0,-90,0])
    button(r=3.1, hinge_r=0.8);
    
   }

}

module case(thickness = 15){
translate([board_size[0]/2,-boarder-1.5,thickness/2])
difference(){
cylinder(2.5, 4, 4);
cylinder(3,   1.2, 1.2, $fn = 10);

}
translate([0,0,board_z+2+thickness])
difference(){
    linear_extrude(2)
    offset(boarder)
    square(board_size);


    hull(){
        translate([0,0,2])
        linear_extrude(0.001)
        offset(3, $fn=20)
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