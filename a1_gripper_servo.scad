include <BOSL2/std.scad>
include <BOSL2/gears.scad>
include <peeler_handle.scad>

// --- Global Parameters ---
plate_z = 55;
plate_y = 8;
plate_x = 53.5;
plate_r = 5.5;

// --- Main Assembly ---
module assembly() {
    plate();
    
    // Fingers
    color("grey")
    down(80)
    fwd(60) {
        
        finger_1_tpu();
        
        translate([39,0,20])
        *rotate([90,0,0])
        handle();
        
        left(20) finger_2_tpu();
    }
    
    // Reference Servo (Uncomment to view)
    // *feetech_STS3215();
}



module mounting_connector(){
    translate([-20+6.5,plate_y/2+1.5,plate_z/2]){
        mounting_hook();
        right(27)
        mounting_hook();
        
        down(54.5)
        right(2){
            mounting_hook(true);
            right(23)
            mounting_hook(true);            
        }
        
    }
}

module mounting_hook(up_hook=false){
    up(1)
    cuboid([3.5, 3, 2],anchor=TOP+BACK);
    
    up(1)
    if(up_hook){
        back(1)
        up(1)
        cuboid([3.5, 1, 3],anchor=TOP+BACK);
    } else {
        back(1)
        cuboid([3.5, 1, 3],anchor=TOP+BACK);    
    }
    
    

}

// --- Plate Sub-Components ---
module plate() {
    difference() {
        left(20)
        cuboid([plate_x+20, plate_y, plate_z], rounding=plate_r, edges="Y");
        
        
        translate([0,0,-plate_z/2])
        cuboid([18, plate_y, 10]);
        
        // Upper left hole
        translate([-plate_x/2 + plate_r, plate_y/2 - 0.8, plate_z/2 - plate_r]) {
            ycyl(d=6.5, h=20, anchor=BACK);
            ycyl(d=3, h=10);
        }
        
        // Lower left hole
        down(35)
        translate([-plate_x/2 + plate_r, plate_y/2 - 0.8, plate_z/2 - plate_r]) {
            ycyl(d=6.5, h=10, anchor=BACK);
            ycyl(d=3, h=10);
        }
        
        // Shaft hole
        translate([28, 0, 4.5])
        down(35)
        translate([-plate_x/2 + plate_r, 0, plate_z/2 - plate_r]) {
            ycyl(d=12, h=10);
        }
    }
    
    mounting_connector();
    
    servo_holder();
    board_holder();
    
    right(30)
    rotate([90,0,0])
    down(plate_y/2)
    {
    m5_atom_stack_holder();
    * up(2) m5_atom_stack();
    }
}

module servo_holder() {
    fwd(plate_y/2 - 0.1)
    down(4)
    difference() {
        cuboid([25+4, 10, 32+4], anchor=BACK, rounding=plate_r/2, edges="Y");
        
        cuboid([25, 11, 32], anchor=BACK);
        
        fwd(8)
        hull() {
            cuboid([25, 11, 32], anchor=BACK);
            fwd(2)
            cuboid([25+4, 11, 32+4], anchor=BACK);
        }
        
        down(3)
        cuboid([14, 11, 32], anchor=BACK);
        
        up(3)
        fwd(5)
        cuboid([19, 11, 32], anchor=BACK);
        
        // Servo screw holes (bottom)
        for(i=[0:1])
            mirror([i,0,0])
            left(10)
            down(20)
            fwd(6.5)
            cyl(d=2, h=10);
        
        // Servo screw holes (top)
        for(i=[0:1])
            mirror([i,0,0])
            left(10)
            up(20)
            fwd(2.5)
            cyl(d=2, h=10);
    }
}

module board_holder() {
    left(40)
    fwd(plate_y/2 - 0.1) {
        
        // Diagonal pegs/supports
        for(i=[0:1])
            mirror([i,0,0])
            left(26.2/2)
            up(5)
            fwd(4)
            rotate([0,0,45])
            cuboid([1, 1, 10], anchor=BACK);
    
        difference() {
            cuboid([25.2+4, 10, 42.2+4], anchor=BACK, rounding=plate_r/2, edges="Y");
            
            cuboid([25.2, 11, 42.2], anchor=BACK);
            cuboid([16, 11, 50], anchor=BACK);
            
            left(4)
            down(10)
            cuboid([25.2, 11, 15], anchor=BACK);
            
            fwd(8)
            hull() {
                cuboid([25.2, 11, 42.2], anchor=BACK);
                fwd(2)
                cuboid([25.2+4, 11, 42.2+4], anchor=BACK);
            }
        }
    }
}


module m5_atom_stack(){
    color("grey")
    cuboid([24.0,31.6,24.0], rounding=2, edges="Y", anchor=BOT);
}

module m5_atom_stack_holder(){
    difference(){
        cuboid([30,38,28], anchor=BOT);
        
        up(2)
        cuboid([24.4,32,24.4], anchor=BOT);
        
        hull(){
        back(27)
        up(2)
        cuboid([24.4,38,24.4], anchor=BOT);
        
        back(29)
        cuboid([30,38,28], anchor=BOT);
        }
        
        
        
        up(2+12)
        ycyl(d=20, h=20, anchor=BACK);
    }
}


module finger_1_tpu() {

    
    translate([15, -15+2, 20]){
    cuboid([10, 25+1, 30], rounding=4, edges="X");
    
    translate([-8/2-4,0,-5])
    cuboid([2, 25+1, 10]);
    
    translate([-8/2-2,0,-5])
    #cuboid([2.5, 25+1, 5]);
    
    translate([-9, 12, -5])
    rotate([0,0,45])
    #cuboid([0.5, 0.5, 10]);
    }
    
    

    difference() {
        up(40)
        rotate([90,0,0])
        hull() {
            servo_horn();
            
            rotate([-90,0,0])
            translate([15, -15+2, -10])
            cuboid([10, 25+1, 8+1], rounding=4, edges="X");
        }
        
        up(40)
        rotate([90,0,0])
        servo_horn_screws();
    }
}


// --- Finger Components ---
module finger_1() {
    hull() {
        fwd(15)
        up(10)
        rotate([0,20,0])
        cuboid([5, 25+1, 8+1], rounding=4, edges="X");
        
        translate([10, -15, 30])
        cuboid([5, 25+1, 8+1]);
    }
    
    difference() {
        up(40)
        rotate([90,0,0])
        hull() {
            servo_horn();
            
            rotate([-90,0,0])
            translate([10, -15, -10])
            cuboid([5, 25+1, 8+1]);
        }
        
        up(40)
        rotate([90,0,0])
        servo_horn_screws();
    }
}

module finger_2_tpu() {
    up(40)
    back(3.5) {
        difference() {
            left(5/2)
            up(25/2 + 2)
            back(32.2 + 3)
            cuboid([25+5, 32.2+6, 4], anchor=BACK);
            
            up(18.5)
            back(15)
            mirror([0,0,1])
            servo_horn_screws();
        }
        
        back(32.2 + 3)
        difference() {
            left(5/2)
            cuboid([25+5, 3, 25], anchor=BACK);
            
            left(5/2)
            fwd(1)
            cuboid([19, 3, 19], anchor=BACK);
            
            for(i=[0:1])
                rotate([0,90*i,0])
                translate([10,0,10])
                ycyl(20, d=2.5);
            
            // Debug cylinders (commented out)
            // translate([10-25,0,10]) ycyl(20, d=2.5);
            // translate([10-25,0,-10]) ycyl(20, d=2.5);
            
            right(18)
            ycyl(20, d=23);
        }
        
        up(18.5)
        back(15)
        mirror([0,0,1])
        servo_horn();
        
        difference() {
            union() {
                cuboid([25, 3, 25], anchor=BACK);
                
                hull() {
                    
                    cuboid([12, 2, 25], anchor=BACK);
                    
                    right(5)
                    down(30)
                    fwd(3.5)
                    translate([-10, -15, 20])
                    cuboid([5, 25+1, 8+1]);
                }
            }
            
            cuboid([25, 2, 14], anchor=BACK);
            
            for(i=[0:3])
                rotate([0,90*i,0])
                translate([10,0,10])
                ycyl(20, d=2);
            
            right(18)
            ycyl(20, d=23);
        }
        
        translate([-5,-18.5,-20]){
        cuboid([5, 25+1, 30], rounding=4, edges="X");
        
        translate([3.5+2,0,-5])
        cuboid([2, 25+1, 10]);
        
        translate([3.5,0,-5])
        cuboid([2.5, 25+1, 5]);
        
        translate([3.5+3,-12,-5])
        rotate([0,0,45])
        #cuboid([0.5, 0.5, 10]);
        }
    }
    

}

module finger_2() {
    up(40)
    back(3.5) {
        difference() {
            left(5/2)
            up(25/2 + 2)
            back(32.2 + 3)
            cuboid([25+5, 32.2+6, 4], anchor=BACK);
            
            up(18.5)
            back(15)
            mirror([0,0,1])
            servo_horn_screws();
        }
        
        back(32.2 + 3)
        difference() {
            left(5/2)
            cuboid([25+5, 3, 25], anchor=BACK);
            
            left(5/2)
            fwd(1)
            cuboid([19, 3, 19], anchor=BACK);
            
            for(i=[0:1])
                rotate([0,90*i,0])
                translate([10,0,10])
                ycyl(20, d=2.5);
            
            // Debug cylinders (commented out)
            // translate([10-25,0,10]) ycyl(20, d=2.5);
            // translate([10-25,0,-10]) ycyl(20, d=2.5);
            
            right(18)
            ycyl(20, d=23);
        }
        
        up(18.5)
        back(15)
        mirror([0,0,1])
        servo_horn();
        
        difference() {
            union() {
                cuboid([25, 3, 25], anchor=BACK);
                
                hull() {
                    
                    cuboid([12, 2, 25], anchor=BACK);
                    
                    right(5)
                    down(30)
                    fwd(3.5)
                    translate([0, -15, 20])
                    cuboid([5, 25+1, 8+1]);
                }
            }
            
            cuboid([25, 2, 14], anchor=BACK);
            
            for(i=[0:3])
                rotate([0,90*i,0])
                translate([10,0,10])
                ycyl(20, d=2);
            
            right(18)
            ycyl(20, d=23);
        }
    }
    
    hull() {
        fwd(15)
        right(10)
        up(11)
        cuboid([5, 25+1, 8+1], rounding=4, edges="X");
        
        right(5)
        up(10)
        translate([0, -15, 20])
        cuboid([5, 25+1, 8+1]);
    }
}

// --- Servo Sub-Components ---
module servo_horn_screws() {
    cyl(2, d=6, anchor=BOT);

    for(i=[0:3]) {
        rotate([0,0,90*i])
        left(14/2) {
            cyl(20, d=3.5);
            up(2) cyl(20, d=6, anchor=BOT);
        }
    }
}

module servo_horn() {
    difference() {
        union() {
            cyl(6, d=22, chamfer1=0.5, anchor=BOT);
            // up(3) cyl(6, d=35, chamfer=0.5, anchor=BOT);
        }
        servo_horn_screws();
    }
}

module feetech_STS3215() {
    color("grey")
    cuboid([45.23, 24.73, 32], rounding=2, edges="Z", anchor=BOT);
    
    color("grey")
    down(2)
    cuboid([45.23, 14, 35], anchor=BOT);
    
    color("grey")
    down(2)
    cuboid([45.23, 18.3, 32], anchor=BOT);
    
    color("silver")
    down(2)
    right(3)
    cyl(d=20, h=36.2, anchor=BOT+LEFT);
}

// --- Execute Model ---
assembly();