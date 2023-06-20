radius = 100;
border = 5;
gap = 5;
thick = 3;
water_gap = 1.5;

x_tile_offset = radius*1.5+gap*cos(360/6/2);
y_tile_offset = radius*cos(360/6/2)*2+gap;

super_2_tile();

module super_2_tile() {
    super_tile();
    
    translate([-3,sqrt(3)*5,0])
    super_tile2();
    
    translate([-9,sqrt(3)*1,0])
    super_tile2();
    
    translate([-6,sqrt(3)*2,0])
    rotate([0,0,60])
    mono_tile();
}

module super_tile2() {
    mono_tile();
    
    translate([-3,sqrt(3)*1,0])
    rotate([0,0,0])
    mono_tile(1);
    
    translate([-0,sqrt(3)*2,0])
    rotate([0,0,120])
    mono_tile();
    
    translate([-3,sqrt(3)*-1,0])
    rotate([0,0,120])
    mono_tile();
}

module super_tile() {
    mono_tile();
    
    translate([-0,sqrt(3)*2,0])
    rotate([0,0,-120])
    mono_tile(1);
    
    translate([-3,sqrt(3)*3,0])
    mono_tile();
    
    translate([-3,sqrt(3)*1,0])
    rotate([0,0,-120])
    mono_tile();
}


module mono_tile(mirror = 0) {
    monotile = [[0, 0], [0, sqrt(3)], [1, sqrt(3)], [3/2, (3 * sqrt(3))/2], [3, sqrt(3)], [3, 0], [4, 0], [9/2, -(sqrt(3)/2)], [3, -sqrt(3)], [3/2, -(sqrt(3)/2)], [1, -sqrt(3)], [-1, -sqrt(3)], [-(3/2), -(sqrt(3)/2)], [0, 0]];

    offset(-0.01)
    mirror([0,mirror,0])
    polygon(monotile);
}


module tile(x_offset, y_offset) {
    road(x_offset, y_offset);
    //water(x_offset, y_offset);
    //park(x_offset, y_offset);
}
    


module road(x_offset, y_offset){
    color([0.9,0.9,0.9])
    rotate([0,0,0]){
        
        difference(){
            linear_extrude(thick)
            translate([x_offset, y_offset, 0])
            difference(){
                circle(r=radius,$fn=6);
                circle(r=radius-border,$fn=6);
        
                
            }
            
            // Megne holes
            //translate([radius-border*2/3,0,0])
            //linear_extrude(2.2)
            //circle(r=2.4/2);
        }

        //#translate([0,0,water_gap])
        linear_extrude(thick-water_gap)
        intersection(){
            translate([x_offset, y_offset, 0]) circle(r=radius-border,$fn=6);
            import("staticmap-paris-road-13.svg", center=true, dpi=50);
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
            import("staticmap-shibuya-park-13.svg", center=true, dpi=50);
            import("staticmap-shibuya-road-13.svg", center=true, dpi=50);
            //import("staticmap-shibuya-water-13.svg", center=true, dpi=50);
        }
    }
    }
}