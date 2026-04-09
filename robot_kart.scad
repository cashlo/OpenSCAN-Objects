include <robot_rail.scad>

*rail_with_interface();

mod=0.8;
helical=0;
clearance=0.2;
max_teeth=50;
gears = 3;
gear_ratio = 6;

motor_shell = 3;

ring_thickness= 14;

number_teeth_wheel_gear = 65;

//left_half(200)
*kart_motor();


*for(i=[0:1])
mirror([i,0,0])
right(gear_track_width/2)
spur_gear(mod=1, teeth=number_teeth_wheel_gear, thickness=0.01, atype="tip",anchor=LEFT+BOTTOM){
up(90)
mirror([0,0,1])
kart_motor();
}

intersection(){
ring_gear(mod=mod, teeth=gear_data[1][1], profile_shift=gear_data[1][2], helical=helical, herringbone=true, gear_spin=gear_data[1][3],backing=5,thickness=ring_thickness,clearance=clearance);
zcyl(ring_thickness, r=or+2+3, chamfer=0.5, $fn=8);
}


module kart_motor(){
    motor_mount(5);
    *up(77) 
    mirror([0,0,1])
    gear_wheel();
}




gear_data = planetary_gears(mod=mod, n=gears, max_teeth=max_teeth, sun_carrier=gear_ratio, helical=helical, gear_spin=360/27*$t);

or = outer_radius(mod=mod, teeth=gear_data[1][1], clearance=clearance, helical=helical, profile_shift=profile_shift, internal=true);


module bearing_6806z(){
    difference(){
        zcyl(7, d=42, chamfer=0.5, anchor=BOT);
        down(1) zcyl(10, d=30, anchor=BOT);
    }
}

module rollerCAN_Lite(){
    
    {
        linear_extrude(12)
        rect(40, rounding=4);
        
        up(12)
        zcyl(3.5, d=40, chamfer2=1, anchor=BOT);
        
        up(15.2)
        zcyl(14.8, d=41, chamfer=1, anchor=BOT);
    }
}


module sun(){

up(13)
spur_gear(mod=mod, teeth=gear_data[0][1], profile_shift=gear_data[0][2], helical=helical, herringbone=true, gear_spin=gear_data[0][3],clearance=clearance,thickness=20);


difference(){
zcyl(6+3, d=30, anchor=BOT, chamfer=0.5);



for(i=[0:3])
rotate([0,0,90*i+45]){
translate([10,0,0])
cylinder(10, 3.5/2, 3.5/2);

translate([10,0,6])
cylinder(10, d=6.5);

}


}
}
module gear_wheel(){
    gear_wheel_upper();
    gear_wheel_lower();
}

module gear_wheel_upper(){
    difference(){
        union(){
            up(8+5+7/2)
            zcyl(l=7/2, d=30-0.2, chamfer1=0.5, anchor=BOTTOM);
            
            up(8+5+7)
            zcyl(l=2, d=32, chamfer1=0.8, anchor=BOTTOM);
            
            up(8+5+7+2)
            move_copies(gear_data[2][4])
            cyl(4, d=6, anchor=BOTTOM);
        }
    
        move_copies(gear_data[2][4])
        zcyl(50, d=3.3, anchor=BOTTOM);
    }

}



module gear_wheel_lower(){
    difference(){
        union(){
            spur_gear(mod=1, teeth=number_teeth_wheel_gear, thickness=8, chamfer=0.5, anchor=BOT);
            
            %up(8+5+0.1)
            bearing_6806z();
            
            up(8)
            zcyl(l=5, d=32, anchor=BOTTOM);
            
            
            up(8+5)
            zcyl(l=7/2, d=30-0.2, chamfer2=0.5, anchor=BOTTOM);
       }
       move_copies(gear_data[2][4])
       zcyl(50, d=2.8, anchor=BOTTOM);
   }
            

    
}

module motor_mount(z){

    %up(57) bearing_6806z();


    %up(51)
    move_copies(gear_data[2][4]){
        difference(){
        color("red")
        spur_gear(mod=mod, teeth=gear_data[2][1], profile_shift=gear_data[2][2], helical=-helical, herringbone=true, gear_spin=gear_data[2][3][$idx],clearance=clearance,thickness=6);
        
        translate([0,0,5-2]) cylinder(10, 8.1/2, 8.6/2, true);
        cylinder(10, 3.5/2, 3.5/2, true);
        
        }
        
        %down(6)
        zcyl(3, d=6, anchor=BOT, chamfer=0.5, $fn=10);
    }

    *up(50)
    ring_gear(mod=mod, teeth=gear_data[1][1], profile_shift=gear_data[1][2], helical=helical, herringbone=true, gear_spin=gear_data[1][3],backing=5,thickness=ring_thickness,clearance=clearance);

    up(30+z) sun();

    difference(){
        cuboid([42+motor_shell*2, 42+motor_shell*2, z+62], anchor=BOTTOM);
        
        
        // Space for bearing
        up(50)
        zcyl(20, d=35, anchor=BOT);
        
        #up(50)
        zcyl(14, d=42, anchor=BOT);
        
        
        // Space for ring gear
        up(50)
        zcyl(ring_thickness, r=or+2+3+0.2, $fn=8);
        
        up(50-ring_thickness/2)
        zcyl(0.1, r=200, $fn=8, anchor=TOP);
        
        // Screw holes
        for(i=[0:3])
        zrot(i*90){
            fwd(42/2)
            left(42/2)
            zcyl(200, d=2.8);
            
            up(50-ring_thickness/2)
            fwd(42/2)
            left(42/2)
            zcyl(200, d=3.4, anchor=BOTTOM);
            
            up(z+62-3)
            fwd(42/2)
            left(42/2)
            zcyl(4, d=9.5, anchor=BOTTOM);
        }
        
        
        
        
        for(i=[0:3])
        zrot(i*90)
        right(10)
        zrot(45)
        cuboid([42+motor_shell*2, 42+motor_shell*2, z+35], anchor=BOTTOM+LEFT+BACK);
        
        
        up(z)
        cuboid([40.2, 40.2, z+33], anchor=BOTTOM);
        
        %up(z)
        rollerCAN_Lite();
        
        // M2.5 mounting holes
        for(i=[0:3])
        rotate([0,0,i*90]){
            #translate([12, 12, 0])
            zcyl(z, d=2.8, anchor=BOT, $fn=10);
            
            #translate([12, 12, 0])
            zcyl(1.5, d=5.5, anchor=BOT, $fn=10);
        }
        
    }
        
    
}


