use <chamfer.scad>;

use <../dotSCAD/src/maze/mz_square.scad>
use <../dotSCAD/src/maze/mz_squarewalls.scad>
use <../dotSCAD/src/polyline_join.scad>

glass_width = 26;
glass_height = 76;
glass_depth = 1.3;

glass_offset = 0.2;
glass_overlap = 1;


food_hole_size = 10;

air_gap_size = 0.5;

depth = 7;
wall = 3;

case_offset = 0.2;
case_size = 5;

eleleg = 1;



    length = glass_height+wall-glass_overlap*2;
    width = glass_width*2+wall*3-glass_overlap*2;


base();

//case();

wall_thickness = 1;

difference(){
translate([wall-wall_thickness,wall-wall_thickness,wall])
linear_extrude(depth)
maze();
    
    
    tube_hole();
    
}


module maze(){
    rows = 16-4;
    columns = 12-3;
    cell_width = 6;
    

    cells = mz_square(rows, columns, seed=1);
    walls = mz_squarewalls(cells, cell_width);

    for(wall = walls) {
        polyline_join(wall)
            square(wall_thickness);
    }
}




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

module tube_hole(){
    translate([width*0.85,1,depth/2+wall])
        tube();
    
    #translate([width/8,length-1,depth/2+wall])
    rotate([0,0,180])
    tube();
}

module tube(){
    rotate([90,0,0])
        cylinder(
            wall+1,
            5.5/2,
            6/2,
            center=true,
            $fn=40
    );
}

module base(){
    difference(){
        
        chamfered_cube([
            width,
            length,
            depth+wall+wall
        ], eleleg);
        
        
        
        tube_hole();
    
        
        
        
        
        //air gap
   
   for(i=[wall*2.5:wall*2:wall*26]){
   translate([-7.5,i,wall*2])
        cube([
            glass_width+wall*2,
            air_gap_size,
            depth/2
        ]);
       
      translate([37.5,i,wall*2])
        cube([
            glass_width+wall*2,
            air_gap_size,
            depth/2
        ]);
   }
        
        // inside
        translate([wall,wall,wall])
            cube([
                glass_width-glass_overlap*2,
                glass_height-glass_overlap*2-wall,
                depth+wall+wall+1
            ]);
   
        // inside
        translate([wall*2+glass_width,wall,wall])
            cube([
                glass_width-glass_overlap*2,
                glass_height-glass_overlap*2-wall,
                depth+wall+wall+1
            ]);
        
        // middle cut
        translate([wall,wall,wall])
            cube([
                glass_width-glass_overlap*2+wall*2,
                glass_height-glass_overlap*2-wall,
                depth-wall+1
            ]);
   
           #translate([wall,wall*3,wall+depth])
            cube([
                glass_width-glass_overlap*2,
                glass_height-glass_overlap*2-wall,
                wall+wall
            ]);
            
                                            #translate([wall*2+glass_width,-wall,wall+depth])
            cube([
                glass_width-glass_overlap*2,
                glass_height-glass_overlap*2-wall,
                wall+wall
            ]);
        
        // Glass 1
        translate([
            wall-glass_overlap-glass_offset,
            wall-glass_overlap-glass_offset,
            wall+depth])
            cube([
                glass_width+glass_offset*2,
                glass_height+glass_offset*2,
                glass_depth+glass_offset*2
            ]);
            
        // Glass 2
        translate([
            wall*2+glass_width-glass_overlap-glass_offset,
            -glass_overlap-glass_offset,
            wall+depth])
            cube([
                glass_width+glass_offset*2,
                glass_height+glass_offset*2,
                glass_depth+glass_offset*2
            ]);
    }
}