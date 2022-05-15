radius = 140;
border = 5;
gap = 5;
thick = 2;
water_gap = 1;

x_tile_offset = radius*1.5+gap*cos(360/6/2);
y_tile_offset = radius*cos(360/6/2)*2+gap;
tile(0, 0);
//tile(0, y_tile_offset);
//tile(0, -y_tile_offset);


//tile(x_tile_offset, y_tile_offset/2);
//tile(x_tile_offset, -y_tile_offset/2);
//tile(-x_tile_offset, -y_tile_offset/2);
//tile(-x_tile_offset, y_tile_offset/2);
//tile(x_tile_offset, y_tile_offset*1.5);




module tile(x_offset, y_offset) {
    road(x_offset, y_offset);
    //water(x_offset, y_offset);
    //park(x_offset, y_offset);
}
    


module road(x_offset, y_offset){
    color([0.1,0.1,0.1])
    rotate([0,0,0]){
        
        linear_extrude(thick)
        translate([x_offset, y_offset, 0])
        difference(){
            circle(r=radius,$fn=6);
            circle(r=radius-border,$fn=6);        
        }

        translate([0,0,water_gap])
        linear_extrude(thick-water_gap)
        intersection(){
            translate([x_offset, y_offset, 0]) circle(r=radius-border,$fn=6);
            import("staticmap-amsterdam-road-13.svg", center=true, dpi=50);
        }
    }
}

module water(x_offset, y_offset){
    color([0.1,0.1,0.8])
    linear_extrude(water_gap){

        intersection(){
            translate([x_offset, y_offset, 0]) circle(r=radius-border,$fn=6);
            difference(){
                import("staticmap-tokyo-water-13.svg", center=true, dpi=50);
            }
        }
    }
    
    
}

module park(x_offset, y_offset){
    color([0.1,0.8,0.1])
    linear_extrude(1.5)
    rotate([0,0,0]){

        intersection(){
            translate([x_offset, y_offset, 0]) circle(r=radius-border,$fn=6);
        difference(){
            import("staticmap-tokyo-park-13.svg", center=true, dpi=50);
            import("staticmap-tokyo-road-13.svg", center=true, dpi=50);
            import("staticmap-tokyo-water-13.svg", center=true, dpi=50);
        }
    }
    }
}