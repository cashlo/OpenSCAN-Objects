include <BOSL2/std.scad>


%feetech_STS3215();

right(13)
up(34)
servo_horn_pad();

left(7)
up(34.5-3)
rotate([-90,0,0])
servo_body_pad();

module servo_body_pad() {

        difference() {
            union() {
                //back(4)
                cuboid([25, 3+4-0.5, 25], anchor=BACK);
                
            }
            
            cuboid([25, 2, 14], anchor=BACK);
            
            for(i=[0:3])
                rotate([0,90*i,0])
                translate([10,0,10]){
                    ycyl(20, d=2);
                    fwd(3)
                    ycyl(20, d=4,anchor=BACK);
                
                }
            
            right(18)
            ycyl(20, d=23);
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

module servo_horn_pad() {
    difference() {
        union() {
            cyl(4, d=22, chamfer1=0.5, anchor=BOT);
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