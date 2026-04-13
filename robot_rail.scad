include <BOSL2/std.scad>
include <BOSL2/gears.scad>

number_of_teeth = 60;

rail_length = number_of_teeth*PI;
rail_height = 45;
rail_width  = 25;

base_height = 6;
base_width  = 40;

gear_track_width = 5;




*rail_with_interface();

module alig_pin(){
    up(rail_height)
    zrot(45)
    hull(){
        cuboid([gear_track_width, gear_track_width, 1], anchor=TOP);
        
        #down(rail_height/4)
        fwd(gear_track_width)
        left(gear_track_width)
        cuboid([gear_track_width, gear_track_width, 1], anchor=TOP);
    }


}

module rail_with_interface(){
difference(){
    rail();
    back(base_width/8)
    zcyl(base_height+0.1, d=base_width/2, anchor=BOT, $fn=100);
    
    back(base_width/8)
    zcyl(base_height+10, d=3, anchor=BOT, $fn=20);
    
    alig_pin();
}

back(rail_length-0.1)
alig_pin();

back(rail_length+base_width/8)
difference(){
    zcyl(base_height, d=base_width/2+0.2, chamfer=0.5, anchor=BOT, $fn=100);

    zcyl(base_height,   d=3.2, anchor=BOT, $fn=20);
    zcyl(base_height/2, d=5.5, anchor=BOT, $fn=20);
    

    
    for(i=[0:13:360])
    rotate([0,0,i+90])
    left(base_width/4)
    rotate([0,0,20])
    cuboid([4,0.8,base_height], anchor=BOTTOM+BACK);
}
}


module rail(){

    hull(){
        up(rail_height)
        cuboid([rail_width, rail_length, 1], anchor=FRONT+TOP);

        up(rail_height-rail_width/2+gear_track_width/2)
        cuboid([gear_track_width, rail_length, 1], anchor=FRONT+TOP);
    }

    cuboid([base_width, rail_length, base_height], anchor=FRONT+BOTTOM);

    for(i=[0:1])
    mirror([i,0,0])
    up(rail_height/2)
    right(gear_track_width/2)
    zrot(-90)
    rack(mod=1, teeth=number_of_teeth, thickness=rail_height, bottom=gear_track_width,orient=BACK, anchor="root-right");

}