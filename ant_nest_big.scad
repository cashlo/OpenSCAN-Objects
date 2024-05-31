use <chamfer.scad>;

glass_width = 138;
glass_height = 179;
glass_depth = 2.2;

nest_gap = 10;

frame_overlap = 5;
frame_offset = 5;

cover_offset = 1;

light_cover();
module light_cover() {
    translate([0,0,10]){
    cube([
        glass_width - frame_overlap*2 - cover_offset*2,
        glass_height - frame_overlap*2 - cover_offset*2,
        glass_depth], true);
    
    for(i=[-1:1]){
        translate([-glass_width/2-frame_offset,i*glass_height/4,0])
        rotate([90])
        rotate_extrude(angle = 90, $fn=10)
        translate([30,0,0])
        square(10, true);
    }
    }
}

module glass() {
    cube([glass_width, glass_height, glass_depth], true);
}



module glass_plates(){
    translate([0,0,(nest_gap+glass_depth)/2])
    glass();

    translate([0,0,-(nest_gap+glass_depth)/2])
    glass();
}

module frame(){
    difference(){
        chamfered_cube([
            glass_width + frame_offset*2,
            glass_height + frame_offset*2,
            glass_depth + frame_offset*2 + glass_depth*2 + nest_gap
        ], 1, true);
        
        cube([
            glass_width - frame_overlap*2,
            glass_height - frame_overlap*2,
            glass_depth + frame_offset*3 + glass_depth*2 + nest_gap
        ], true);
        
        
    }
}

module air_gap(){
      translate([glass_width*0.4,0,nest_gap/4])
      cube([glass_width/8 , 200, 0.3], true);  
    
    translate([glass_width*0.4,0,-nest_gap/4])
      cube([glass_width/8 , 200, 0.3], true);  
    
    translate([glass_width/16 + glass_width*0.4,0,0])
      cube([0.1 , 200, nest_gap/2+0.3], true);
    
    translate([-glass_width/16 + glass_width*0.4,0,nest_gap*1.25])
      cube([0.1 , 200, nest_gap*2+0.3], true);
    
    translate([-glass_width/16 + glass_width*0.4,0,-nest_gap*1.25])
      cube([0.1 , 200, nest_gap*2+0.3], true);   
}

module tube(){
    translate([glass_width/4,glass_height/2,0])
    rotate([90,0,0])
        cylinder(
            frame_overlap+frame_offset,
            6/2,
            5.2/2,
            center=true,
            $fn=40
    );
}
/*
difference(){
    frame();
    air_gap();
   glass_plates();
    #tube();
}
*/