glass_width = 26;
glass_height = 76;
glass_depth = 1.3;

glass_offset = 0.2;
glass_overlap = 1;

water_tank_width = 10;
water_gap_width = 1;
water_gap_depth = 0.5;

food_hole_size = 10;

depth = 15;
wall = 3;

difference(){
base();
cube([
    glass_width+wall*2-glass_overlap*2,
    glass_width+wall-glass_overlap,
    depth+wall+wall
]);
}

module base(){
    difference(){
        cube([
            glass_width+wall*2-glass_overlap*2,
            glass_height+wall*3-glass_overlap*2+water_tank_width,
            depth+wall+wall
        ]);
        
        //water tank
        translate([wall,glass_height+wall*2-glass_overlap*2,wall])
        cube([
            glass_width-glass_overlap*2,
            water_tank_width,
            depth+wall+wall
        ]);
        
        //water gap
   translate([wall,glass_height+wall-glass_overlap*2-water_gap_width,wall-water_gap_depth])
        cube([
            glass_width-glass_overlap*2,
            water_tank_width+water_gap_width+wall,
            water_gap_depth
        ]);
        
        // food hole
        #translate([
            wall-glass_overlap+glass_width/2,
            wall+glass_width/2-glass_overlap,
            wall-water_gap_depth])
        cylinder(1, food_hole_size, food_hole_size);
        
        
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