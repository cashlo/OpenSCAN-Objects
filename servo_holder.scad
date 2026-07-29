include <BOSL2/std.scad>
include <peeler_handle.scad>


horn = true;
handle = true;

if(handle)
translate([-40,10,0])
rotate([0,0,180])
handle(30);


up(3)
rotate([-90,0,0])
servo_holder();

if(horn){
    right(30)
    servo_horn();

    difference(){
    hull(){
    rotate([-90,0,0])
    cuboid([25+4, 3, 32+4], anchor=BACK, rounding=plate_r/2, edges="Y");
            

    right(30)
    cyl(3, d=22, chamfer1=0.5, anchor=BOT);
    }

    right(30)
    servo_horn_screws();
    }
}

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

module servo_holder() {
    difference() {
        cuboid([25+4, 10, 32+4], anchor=BACK, rounding=plate_r/2, edges="Y");
        
        #cuboid([25, 11, 32], anchor=BACK);
        
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
