include <BOSL2/std.scad>
include <BOSL2/screws.scad>
//bottom_half(){
  diff()
    cuboid(20)
      attach(FRONT)
        %screw_hole("M6,12",anchor=TOP,thread=true,bevel1="reverse");
   
  back(15) 
  difference(){
    cyl(6, d=20, chamfer=0.5);
    cyl(10, d=12, chamfer=0.5);
    %translate([10,0,0])
    rotate([0,0,45])
    cuboid(15);
    
    }
//  }
        
   