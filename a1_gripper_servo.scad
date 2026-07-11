include <BOSL2/std.scad>
include <BOSL2/gears.scad>

plate_z = 50;
plate_y = 8;
plate_x = 53.5;

plate_r = 5.5;

anime = false;

module plate(){
    difference(){
        left(20)
        cuboid([plate_x+20,plate_y,plate_z], rounding=plate_r, edges="Y");
        
        // Upper left hole
        translate([-plate_x/2+plate_r,plate_y/2-0.8,plate_z/2-plate_r]){
            ycyl(d=6.5, h=20, anchor=BACK);
            ycyl(d=3, h=10);
        };
        
        // Lower left hole
        down(35)
        translate([-plate_x/2+plate_r,plate_y/2-0.8,plate_z/2-plate_r]){
            ycyl(d=6.5, h=10, anchor=BACK);
            ycyl(d=3, h=10);
        };
        
        // Shaft hole
        translate([28,0,4.5])
        down(35)
        translate([-plate_x/2+plate_r,0,plate_z/2-plate_r]){
            ycyl(d=12, h=10);
        };
    }
    
    
    // Servo holder
    fwd(plate_y/2-0.1)
    down(4)
    difference(){
        cuboid([25+4, 10, 32+4],anchor=BACK,rounding=plate_r/2, edges="Y");
        
        
        cuboid([25, 11, 32],anchor=BACK);
        
        fwd(8)
        hull(){
            cuboid([25, 11, 32],anchor=BACK);
            fwd(2)
            cuboid([25+4, 11, 32+4],anchor=BACK);
        }
        
        
        down(3)
        cuboid([14, 11, 32],anchor=BACK);
        
        up(3)
        fwd(5)
        cuboid([19, 11, 32],anchor=BACK);
        
        // Servo screw hole
        for(i=[0:1])
        mirror([i,0,0])
        left(10)
        down(20)
        fwd(6.5)
        cyl(d=2, h=10);
        
        for(i=[0:1])
        mirror([i,0,0])
        left(10)
        up(20)
        fwd(2.5)
        cyl(d=2, h=10);
        
        
    }
    
    // Board holder
    left(40)
    fwd(plate_y/2-0.1)
    {
    
        for(i=[0:1])
        mirror([i,0,0])
        left(26.2/2)
        up(5)
        fwd(4)
        rotate([0,0,45])
        cuboid([1, 1, 10],anchor=BACK);
    
        difference(){
            
            cuboid([25.2+4, 10, 42.2+4],anchor=BACK,rounding=plate_r/2, edges="Y");
            
            
            
            
            cuboid([25.2, 11, 42.2],anchor=BACK);
            cuboid([16, 11, 50],anchor=BACK);
            
            left(4)
            down(10)
            cuboid([25.2, 11, 15],anchor=BACK);
            
            fwd(8)
            hull(){
                cuboid([25.2, 11, 42.2],anchor=BACK);
                fwd(2)
                cuboid([25.2+4, 11, 42.2+4],anchor=BACK);
            }
            
        }
    
    }
}

fwd(50){
finger_1();
left(30)
finger_2();
}


module finger_2(){
    up(40)
    back(3.5){
    
    difference(){
    left(5/2)
    up(25/2+2)
    back(32.2+3)
    cuboid([25+5, 32.2+6, 4], anchor=BACK);
    
    
    up(18.5)
    back(15)
    mirror([0,0,1])
    servo_horn_screws();
    }
    
    back(32.2+3)
    difference(){
    left(5/2)
    cuboid([25+5, 3, 25], anchor=BACK);
    left(5/2)
    fwd(1)
    cuboid([19, 3, 19], anchor=BACK);
    
    for(i=[0:1])
    rotate([0,90*i,0])
    translate([10,0,10])
    ycyl(20, d=2.5);
    
    #translate([10-25,0,10])
    ycyl(20, d=2.5);
    
    #translate([10-25,0,-10])
    ycyl(20, d=2.5);
    
    right(18)
    ycyl(20, d=23);
    
    
    }
    
    up(18.5)
    back(15)
    mirror([0,0,1])
    servo_horn();
    
    
    
    difference(){
    union(){
    cuboid([25, 3, 25], anchor=BACK);
    
       hull(){
        cuboid([12, 2, 25], anchor=BACK);
        
        right(5)
        down(40)
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
    
    
    
    hull(){
    fwd(15)
    right(10)
    up(1)
    cuboid([5, 25+1, 8+1], rounding=4, edges="X");
    
    right(5)
    translate([0, -15, 20])
    cuboid([5, 25+1, 8+1]);
    }
    

    

}

module servo_horn_screws(){

    cyl(2, d=6, anchor=BOT);

    for(i=[0:3])
    rotate([0,0,90*i])
    left(14/2){
    cyl(20, d=3.5);
    up(2) cyl(20, d=6, anchor=BOT);
    }
}

module servo_horn(){

    difference(){
    union(){
        cyl(6, d=22, chamfer1=0.5, anchor=BOT);
        //up(3) cyl(6, d=35, chamfer=0.5, anchor=BOT);
        
    }
    
    
    
    
    servo_horn_screws();

    
}
}

module finger_1(){

    hull(){
    fwd(15)
    rotate([0,20,0])
    cuboid([5, 25+1, 8+1], rounding=4, edges="X");
    
    translate([10, -15, 20])
    cuboid([5, 25+1, 8+1]);
    }
    
    difference(){
    up(40)
    rotate([90,0,0])
    hull(){
    servo_horn();
    
    rotate([-90,0,0])
    translate([10, -15, -20])
    cuboid([5, 25+1, 8+1]);
    }
    
    up(40)
    rotate([90,0,0])
    servo_horn_screws();
    }
}

module feetech_STS3215(){
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




plate();

*feetech_STS3215();




