cheki_width = 54;
cheki_height = 86;

frame_width = 4;
thickness = 4;

margin = 0.2;

magnet_width = 6;
magnet_height = 2;


difference(){
    frame_group();
    
    translate([
        cheki_width + frame_width*2,
        cheki_height/2+frame_width,
        1.5-0.4
    ]){
    #cylinder(
        magnet_height +0.5,
        magnet_width/2+0.1,
        magnet_width/2+0.1,
        $fn=20
    );
    
    #translate([-magnet_width-0.2,-magnet_width/2-0.1,0])
    cube([
        magnet_width+0.2,
        magnet_width+0.2,
        magnet_height +0.5,
    ]);
    }
    
    translate([
        cheki_width + frame_width*2,
        cheki_height+frame_width*2,
        1.5-0.4
    ]){
    #cylinder(
        magnet_height +0.5,
        magnet_width/2+0.1,
        magnet_width/2+0.1,
        $fn=20
    );
    
    #translate([0,-magnet_width/2-0.1,0])
    cube([
        magnet_width+0.2,
        magnet_width+0.2,
        magnet_height +0.5,
    ]);
    }
}

module frame_group(){
frame();

translate([0,cheki_height+frame_width*2,0])
frame();

translate([cheki_width+frame_width*2,cheki_height/2+frame_width,0])
frame();

translate([cheki_width+frame_width*2,-cheki_height/2-frame_width,0])
frame();
}

module frame(){
difference(){
cube([
    cheki_width + frame_width*2,
    cheki_height+frame_width*2,
    thickness
    ]);
    
translate([frame_width+margin,frame_width+margin,-1])
cube([
    cheki_width-margin*2,
    cheki_height-margin*2,
    thickness+2
    ]);
        
translate([frame_width-margin,frame_width-margin,thickness/3])
cube([
    cheki_width+margin*2,
    cheki_height+margin*2,
    thickness/3
    ]);    
    
    
translate([frame_width-margin,frame_width-margin+cheki_height*2/3,thickness/3*2-0.1])
cube([
    cheki_width+margin*2,
    cheki_height/3,
    thickness/3+0.2
    ]);
}
}