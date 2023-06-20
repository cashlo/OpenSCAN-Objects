scale = 20;
border = 2/scale;
gap = 2/scale;
thick = 3;


linear_extrude(thick)
scale([scale,scale,1])
difference(){
    super_tile2(offset=gap/2);
    super_tile2(offset=gap/2+border);
}

linear_extrude(thick/2)
intersection(){
scale([scale,scale,1])
super_tile2(offset=gap/2+border);
#translate([-200,20,0])
    rotate([0,0,30])
    import("staticmap-amsterdam-road-13.svg", center=true, dpi=50);
}

module super_tile3() {
    rotate([0,0,-120])
    super_tile2();
    
    translate([6,sqrt(3)*10,0])
    rotate([0,0,0])
    super_tile2();
    
    translate([-9,sqrt(3)*1,0])
    rotate([0,0,0])
    super_tile2();
    
    //bonus tile
    translate([0,sqrt(3)*6,0])
    rotate([0,0,60])
    super_tile();
    
    
}

module super_tile2(offset=0) {
    super_tile(offset=offset);
    
    translate([-3,sqrt(3)*7,0])
    rotate([0,0,120])
    super_tile(offset=offset);
    
    translate([-9,sqrt(3)*3,0])
    rotate([0,0,120])
    super_tile(offset=offset);
    
    
    //bonus tile
    color("pink")
    translate([-6,sqrt(3)*2,0])
    rotate([0,0,60])
    mono_tile(offset=offset);
    
    color("pink")
    translate([6,sqrt(3)*0,0])
    rotate([0,0,-120])
    mono_tile(offset=offset);
    
    color("pink")
    translate([-6,sqrt(3)*-2,0])
    rotate([0,0,120])
    mono_tile(offset=offset);
    
    color("pink")
    translate([-3,sqrt(3)*-1,0])
    rotate([0,0,-60])
    mono_tile(offset=offset);
    
    color("pink")
    translate([-9,sqrt(3)*-1,0])
    rotate([0,0,180])
    mono_tile(offset=offset);  
    
}

module super_tile(offset=0) {
    mono_tile(offset=offset);
    
    translate([-0,sqrt(3)*2,0])
    rotate([0,0,-120])
    mono_tile(1,offset=offset);
    
    translate([-3,sqrt(3)*3,0])
    mono_tile(offset=offset);
    
    translate([-3,sqrt(3)*1,0])
    rotate([0,0,-120])
    mono_tile(offset=offset);
    
    //bonus tile
    color("orange")
    translate([3,sqrt(3)*1,0])
    rotate([0,0,60])
    mono_tile(0,offset=offset);
    
    color("orange")
    translate([3,sqrt(3)*3,0])
    rotate([0,0,120])
    mono_tile(0,offset=offset);
    
    color("orange")
    translate([-3,sqrt(3)*5,0])
    mono_tile(offset=offset);    
}


module mono_tile(mirror=0, offset=0) {
    monotile = [[0, 0], [0, sqrt(3)], [1, sqrt(3)], [3/2, (3 * sqrt(3))/2], [3, sqrt(3)], [3, 0], [4, 0], [9/2, -(sqrt(3)/2)], [3, -sqrt(3)], [3/2, -(sqrt(3)/2)], [1, -sqrt(3)], [-1, -sqrt(3)], [-(3/2), -(sqrt(3)/2)], [0, 0]];

    offset(delta=-offset)
    mirror([0,mirror,0])
    polygon(monotile);
}