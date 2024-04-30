use <chamfer.scad>;

glass_width = 26;
glass_height = 76;
glass_depth = 1.3;

glass_offset = 0.2;
glass_overlap = 1;

water_tank_width = 2.5;
water_gap_width = 1;
water_gap_depth = 0.5;

food_hole_size = 10;

air_gap_size = 0.5;

depth = 15;
wall = 3;

case_offset = 0.2;
case_size = 5;

eleleg = 1;



    length = glass_height+wall*3-glass_overlap*2+water_tank_width;
    width = glass_width+wall*2-glass_overlap*2;


difference(){
base();
food_block();
}

translate([0,-1,0])
intersection(){
base();
food_block();
}

//case();

module case(){
    difference(){
        translate([-case_size-case_offset,-case_size-case_offset,-case_size/2])
        cube([
            width+case_offset*2+case_size*2,
            length+case_offset*2+case_size*2,
            case_size
        ]);
        
        cube([
            width+case_offset*2,
            length+case_offset*2,
            depth+wall+wall
        ]);
    }
    
    }

module food_block(){
    cube([
        glass_width+wall*2-glass_overlap*2,
        glass_width+wall-glass_overlap,
        depth+wall+wall
    ]);
}


module eleleg_cut(){
        
                translate([width/2,glass_width+wall-glass_overlap,0])
    rotate([45,0,0])
        cube([
            width,
            eleleg,
            eleleg
        ], true);
    
    
}

module base(){
    difference(){
        chamfered_cube([
            width,
            length,
            depth+wall+wall
        ], eleleg);
        
        
        eleleg_cut();
        translate([0,0,depth+wall+wall])
        eleleg_cut();
        
        
        //water tank
        translate([wall,glass_height+wall*2-glass_overlap*2,wall])
        cube([
            glass_width-glass_overlap*2,
            water_tank_width,
            depth+wall+wall
        ]);
        
        //water gap
   #translate([wall*2,glass_height+wall-glass_overlap*2-water_gap_width,wall-water_gap_depth])
        cube([
            glass_width-glass_overlap*2-wall*2,
            water_tank_width+water_gap_width+wall,
            water_gap_depth
        ]);
        
        
        
        //air gap
   #
   for(i=[wall*2.5:wall*2:wall*26]){
   translate([-0.5,i,wall*2])
        cube([
            glass_width+wall*2,
            air_gap_size,
            depth/2
        ]);
   }
        
        // food hole
        #translate([
            wall-glass_overlap+(glass_width-18)/2,
            wall+(glass_width-18)/2-glass_overlap,
            wall-water_gap_depth])
        cube([18+glass_offset*2, 21.6+glass_offset*2, 1]);
        
        
        translate([wall,wall,wall])
            cube([
                glass_width-glass_overlap*2,
                glass_height-glass_overlap*2,
                depth+wall+wall+1
            ]);
        
        translate([
            wall-glass_overlap-glass_offset,
            wall-glass_overlap-glass_offset,
            wall+depth])
            cube([
                glass_width+glass_offset*2,
                glass_height+glass_offset*2,
                glass_depth+glass_offset*2
            ]);
    }
}